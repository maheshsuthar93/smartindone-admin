import 'package:board_cut/core/core.dart';
import 'package:board_cut/core/core_injection.dart';
import 'package:board_cut/features/create_user/presentation/viewmodels/create_user_view_model.dart';
import 'package:board_cut/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CreateUserPage extends BaseStatefulScreen {
  const CreateUserPage({super.key, this.user});

  final UserModel? user;

  bool get isEditing => user != null;

  @override
  BaseState<CreateUserPage> createState() => _CreateUserPageState();
}

class _CreateUserPageState extends BaseState<CreateUserPage> {
  final _viewModel = sl<CreateUserViewModel>();
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  UserRole? _selectedRole;
  UserStatus? _selectedStatus;
  CompanyModel? _selectedCompany;
  List<CompanyModel> _companies = [];
  String? _companiesError;
  bool _isSuperAdmin = false;
  bool _isLoadingCompanies = false;
  bool _isSaving = false;

  @override
  void initState() {
    super.initState();
    _nameController.text = widget.user?.name ?? '';
    _emailController.text = widget.user?.email ?? '';
    _selectedRole = widget.user?.role;
    _selectedStatus = widget.user?.status ?? UserStatus.active;
    _loadCompanyAccess();
  }

  Future<void> _loadCompanyAccess() async {
    await _viewModel.loadCompanyAccess(isEditing: widget.isEditing);
    if (!mounted) return;
    setState(() {
      _isSuperAdmin = _viewModel.isSuperAdmin;
      _companies = _viewModel.companies;
      _companiesError = _viewModel.companiesError;
      _isLoadingCompanies = _viewModel.isLoadingCompanies;
      if (_companies.length == 1) _selectedCompany = _companies.first;
    });
  }

  @override
  Widget buildResponsive(BuildContext context, ScreenType screenType) {
    final isSmallScreen =
        screenType == ScreenType.mobile || screenType == ScreenType.tablet;

    return Scaffold(
      backgroundColor: AppColors.transparent,
      body: Center(
        child: Container(
          width: !isSmallScreen ? AppSize.dialogWidth : double.maxFinite,
          height: ResponsiveHelper.determineDialogHeight(screenType),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppSize.borderRadius),
            color: AppColors.surface,
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                DialogHeaderWidget(
                  title: widget.isEditing ? 'Update User' : 'New User',
                ),
                const SizedBox(height: 20),
                Expanded(child: _buildDesktopLayout()),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDesktopLayout() {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Expanded(
            child: Scrollbar(
              child: SingleChildScrollView(
                child: Column(
                  spacing: 20,
                  children: [
                    Row(
                      spacing: 10,
                      children: [
                        Expanded(child: _nameField),
                        Expanded(child: _emailField),
                      ],
                    ),
                    Row(
                      spacing: 10,
                      children: [
                        Expanded(child: _roleField),
                        Expanded(child: _statusField),
                      ],
                    ),
                    if (_isSuperAdmin &&
                        !widget.isEditing &&
                        _selectedRole != UserRole.superAdmin)
                      _companyField,
                    Row(
                      spacing: 10,
                      children: [Expanded(child: _passwordField)],
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 12),
          Align(
            alignment: Alignment.centerRight,
            child: Row(
              spacing: 10,
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  width: 200,
                  child: ButtonWidget.secondary(
                    label: 'Cancel',
                    onPressed: () {
                      router.pop();
                    },
                  ),
                ),
                SizedBox(
                  width: 200,
                  child: _isSaving
                      ? const Center(
                          child: SizedBox.square(
                            dimension: 22,
                            child: CircularProgressIndicator(strokeWidth: 2),
                          ),
                        )
                      : _buildCreateButton,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget get _nameField => _buildTextFormField(
    labelText: 'Name',
    hintText: 'Enter the name',
    isRequired: true,
    controller: _nameController,
    prefixIcon: const Icon(
      Icons.person,
      color: AppColors.textFieldIcon,
      size: 20,
    ),
  );

  Widget get _emailField => _buildTextFormField(
    labelText: 'Email',
    hintText: 'Enter the email',
    isRequired: true,
    controller: _emailController,
    keyboardType: TextInputType.emailAddress,
    prefixIcon: const Icon(
      Icons.email,
      color: AppColors.textFieldIcon,
      size: 20,
    ),
  );

  Widget get _passwordField => _buildTextFormField(
    labelText: 'Password',
    hintText: widget.isEditing
        ? 'Leave blank to keep the current password'
        : 'Enter the password',
    isRequired: !widget.isEditing,
    keyboardType: TextInputType.text,
    controller: _passwordController,
    prefixIcon: const Icon(
      Icons.password,
      color: AppColors.textFieldIcon,
      size: 20,
    ),
  );

  Widget get _roleField => _buildAutoCompleteField(
    labelText: 'Role',
    options: _isSuperAdmin
        ? UserRole.values
        : UserRole.values
              .where(
                (role) => role != UserRole.admin && role != UserRole.superAdmin,
              )
              .toList(),
    initialValue: _selectedRole == null ? null : _roleLabel(_selectedRole!),
    displayStringForOption: _roleLabel,
    onSelected: (value) => setState(() => _selectedRole = value),
    isRequired: true,
    prefixIcon: const Icon(
      Icons.person,
      color: AppColors.textFieldIcon,
      size: 20,
    ),
  );

  Widget get _statusField => _buildAutoCompleteField(
    labelText: 'Status',
    options: Constants.userStatus,
    initialValue: _statusLabel(widget.user?.status),
    displayStringForOption: (name) => name,
    isRequired: true,
    prefixIcon: const Icon(
      Icons.person,
      color: AppColors.textFieldIcon,
      size: 20,
    ),
    onSelected: (value) {
      _selectedStatus = _statusFromLabel(value);
    },
    filterFn: (value, query) {
      return value.toLowerCase().contains(query);
    },
  );

  Widget get _companyField {
    if (_isLoadingCompanies) {
      return const LinearProgressIndicator();
    }
    if (_companiesError != null) {
      return Align(
        alignment: Alignment.centerLeft,
        child: Text(
          'Could not load companies: $_companiesError',
          style: AppTextStyle.labelSmall.copyWith(color: AppColors.errorColor),
        ),
      );
    }
    if (_companies.isEmpty) {
      return Align(
        alignment: Alignment.centerLeft,
        child: Text(
          'Create a company before adding users.',
          style: AppTextStyle.labelSmall.copyWith(color: AppColors.errorColor),
        ),
      );
    }
    return _buildAutoCompleteField<CompanyModel>(
      labelText: 'Company',
      hintText: 'Choose the user’s company',
      options: _companies,
      initialValue: _selectedCompany?.name,
      displayStringForOption: (company) => company.name,
      onSelected: (company) => _selectedCompany = company,
      isRequired: true,
      prefixIcon: const Icon(
        Icons.business,
        color: AppColors.textFieldIcon,
        size: 20,
      ),
    );
  }

  Widget get _buildCreateButton => ButtonWidget(
    label: widget.isEditing ? 'Update User' : 'Create User',
    onPressed: _submit,
  );

  Future<void> _submit() async {
    if (!(_formKey.currentState?.validate() ?? false)) return;

    final user = widget.user;
    final role = _selectedRole;
    final status = _selectedStatus;
    if (role == null || status == null) return;

    if (user == null &&
        _isSuperAdmin &&
        role != UserRole.superAdmin &&
        _selectedCompany == null) {
      Fluttertoast.showToast(msg: 'Choose a company for this user.');
      return;
    }

    final data = <String, dynamic>{
      'name': _nameController.text.trim(),
      'email': _emailController.text.trim(),
      'role': _roleToApiValue(role),
    };
    if (user != null) {
      data['status'] = _statusToApiValue(status);
      data['companyId'] = user.companyId;
    } else if (_isSuperAdmin && role != UserRole.superAdmin) {
      data['companyId'] = _selectedCompany!.id;
    }
    final password = _passwordController.text.trim();
    if (password.isNotEmpty || user == null) data['password'] = password;

    setState(() => _isSaving = true);
    try {
      final response = await _viewModel.save(userId: user?.id, data: data);
      if (!mounted) return;
      if (response == null || !response.success) {
        _showToast(_viewModel.error ?? 'Unable to save user.');
        return;
      }
      _showToast(response.message);
      router.pop(true);
    } finally {
      if (mounted) setState(() => _isSaving = false);
    }
  }

  void _showToast(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      webPosition: 'center',
      timeInSecForIosWeb: 1,
      backgroundColor: AppColors.primaryColor,
      webBgColor: AppColors.primaryColorWebHex,
      textColor: Colors.white,
      fontSize: 16,
    );
  }

  String _roleLabel(UserRole role) => switch (role) {
    UserRole.admin => 'Admin',
    UserRole.manager => 'Manager',
    UserRole.operator => 'Operator',
    UserRole.sales => 'Sales',
    UserRole.superAdmin => 'Super Admin',
  };

  String? _statusLabel(UserStatus? status) => switch (status) {
    UserStatus.active => 'ACTIVE',
    UserStatus.inActive => 'INACTIVE',
    UserStatus.suspended => 'SUSPENDED',
    null => null,
  };

  UserStatus? _statusFromLabel(String value) => switch (value) {
    'ACTIVE' => UserStatus.active,
    'INACTIVE' => UserStatus.inActive,
    'SUSPENDED' => UserStatus.suspended,
    _ => null,
  };

  String _roleToApiValue(UserRole role) => switch (role) {
    UserRole.admin => 'ADMIN',
    UserRole.manager => 'MANAGER',
    UserRole.operator => 'OPERATOR',
    UserRole.sales => 'SALES',
    UserRole.superAdmin => 'SUPER_ADMIN',
  };

  String _statusToApiValue(UserStatus status) => switch (status) {
    UserStatus.active => 'ACTIVE',
    UserStatus.inActive => 'INACTIVE',
    UserStatus.suspended => 'SUSPENDED',
  };

  Widget _buildAutoCompleteField<T extends Object>({
    String? labelText,
    String? hintText,
    TextInputType keyboardType = TextInputType.text,
    List<TextInputFormatter>? inputFormatters,
    bool readOnly = false,
    GestureTapCallback? onTap,
    required List<T> options,
    TextEditingController? controller,
    required String Function(T) displayStringForOption,
    required void Function(T) onSelected,
    bool Function(T option, String query)? filterFn,
    String? initialValue,
    bool isRequired = false,
    Widget? prefixIcon,
  }) {
    return AutoCompleteWidget(
      labelText: labelText,
      hintText: hintText,
      options: options,
      displayStringForOption: displayStringForOption,
      onSelected: onSelected,
      initialValue: initialValue,
      isRequired: isRequired,
      prefixIcon: prefixIcon,
    );
  }

  Widget _buildTextFormField({
    String? labelText,
    TextInputType keyboardType = TextInputType.text,
    List<TextInputFormatter>? inputFormatters,
    int maxLines = 1,
    String? hintText,
    Widget? prefixIcon,
    bool isRequired = false,
    TextEditingController? controller,
  }) {
    return TextFormFieldWidget(
      inputFormatters: inputFormatters,
      keyboardType: keyboardType,
      maxLines: maxLines,
      hintText: hintText,
      labelText: labelText,
      prefixIcon: prefixIcon,
      isRequired: isRequired,
      controller: controller,
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
