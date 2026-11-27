import 'package:board_cut/core/core.dart';
import 'package:board_cut/core/core_injection.dart';
import 'package:board_cut/features/customers/data/models/customer_model.dart';
import 'package:board_cut/features/create_customer/presentation/viewmodels/create_customer_view_model.dart';
import 'package:board_cut/shared/shared.dart';
import 'package:flutter/material.dart';

class CreateCustomerPage extends BaseStatefulScreen {
  const CreateCustomerPage({super.key, this.customerId});

  final String? customerId;

  @override
  BaseState<CreateCustomerPage> createState() => _CreateCustomerPageState();
}

class _CreateCustomerPageState extends BaseState<CreateCustomerPage> {
  final _viewModel = sl<CreateCustomerViewModel>();
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _emailController = TextEditingController();
  final _addressController = TextEditingController();
  final _contactNameController = TextEditingController();
  final _contactPhoneController = TextEditingController();
  final _contactEmailController = TextEditingController();
  CustomerModel? _customer;
  CustomerStatus _status = CustomerStatus.active;
  bool _isLoadingCustomer = false;
  bool _isSaving = false;
  String? _error;

  bool get _isEditing => widget.customerId != null;

  @override
  void initState() {
    super.initState();
    if (widget.customerId != null) _loadCustomer();
  }

  void _populateForm(CustomerModel customer) {
    _customer = customer;
    _nameController.text = customer.name;
    _phoneController.text = customer.phone ?? '';
    _emailController.text = customer.email ?? '';
    _addressController.text = customer.address ?? '';
    _contactNameController.text = customer.contactName ?? '';
    _contactPhoneController.text = customer.contactPhone ?? '';
    _contactEmailController.text = customer.contactEmail ?? '';
    _status = customer.status;
  }

  Future<void> _loadCustomer() async {
    final customerId = widget.customerId;
    if (customerId == null) return;
    setState(() {
      _isLoadingCustomer = true;
      _error = null;
    });
    await _viewModel.loadCustomer(customerId);
    if (!mounted) return;
    final customer = _viewModel.customer;
    setState(() {
      _isLoadingCustomer = false;
      _error = _viewModel.error;
      if (customer != null) _populateForm(customer);
    });
  }

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    _addressController.dispose();
    _contactNameController.dispose();
    _contactPhoneController.dispose();
    _contactEmailController.dispose();
    super.dispose();
  }

  @override
  Widget buildResponsive(BuildContext context, ScreenType screenType) {
    final isSmallScreen =
        screenType == ScreenType.mobile || screenType == ScreenType.tablet;

    return Scaffold(
      backgroundColor: AppColors.transparent,
      body: Center(
        child: Container(
          width: isSmallScreen ? double.maxFinite : AppSize.dialogWidth,
          height: ResponsiveHelper.determineDialogHeight(screenType),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppSize.borderRadius),
            color: AppColors.surface,
          ),
          padding: const EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                DialogHeaderWidget(
                  title: _isEditing ? 'Update Customer' : 'New Customer',
                ),
                const SizedBox(height: 16),
                if (_error != null) ...[
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            _error!,
                            style: const TextStyle(color: AppColors.errorColor),
                          ),
                        ),
                        if (_isEditing)
                          TextButton(
                            onPressed: _isLoadingCustomer
                                ? null
                                : _loadCustomer,
                            child: const Text('Retry'),
                          ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 8),
                ],
                Expanded(
                  child: _isLoadingCustomer
                      ? const Center(child: CircularProgressIndicator())
                      : _isEditing && _customer == null
                      ? const SizedBox.shrink()
                      : Scrollbar(
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                if (_customer case final customer?) ...[
                                  _customerMetadata(customer),
                                  const SizedBox(height: 14),
                                ],
                                if (isSmallScreen) ...[
                                  _textField(
                                    controller: _nameController,
                                    label: 'Customer name',
                                    required: true,
                                  ),
                                  _textField(
                                    controller: _phoneController,
                                    label: 'Phone',
                                    keyboardType: TextInputType.phone,
                                  ),
                                  _textField(
                                    controller: _emailController,
                                    label: 'Email',
                                    keyboardType: TextInputType.emailAddress,
                                  ),
                                  _statusField(),
                                ] else ...[
                                  Row(
                                    children: [
                                      Expanded(
                                        child: _textField(
                                          controller: _nameController,
                                          label: 'Customer name',
                                          required: true,
                                        ),
                                      ),
                                      const SizedBox(width: 12),
                                      Expanded(
                                        child: _textField(
                                          controller: _phoneController,
                                          label: 'Phone',
                                          keyboardType: TextInputType.phone,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: _textField(
                                          controller: _emailController,
                                          label: 'Email',
                                          keyboardType:
                                              TextInputType.emailAddress,
                                        ),
                                      ),
                                      const SizedBox(width: 12),
                                      Expanded(child: _statusField()),
                                    ],
                                  ),
                                ],
                                if (isSmallScreen) ...[
                                  _textField(
                                    controller: _contactNameController,
                                    label: 'Contact name',
                                  ),
                                  _textField(
                                    controller: _contactPhoneController,
                                    label: 'Contact phone',
                                    keyboardType: TextInputType.phone,
                                  ),
                                ] else
                                  Row(
                                    children: [
                                      Expanded(
                                        child: _textField(
                                          controller: _contactNameController,
                                          label: 'Contact name',
                                        ),
                                      ),
                                      const SizedBox(width: 12),
                                      Expanded(
                                        child: _textField(
                                          controller: _contactPhoneController,
                                          label: 'Contact phone',
                                          keyboardType: TextInputType.phone,
                                        ),
                                      ),
                                    ],
                                  ),
                                _textField(
                                  controller: _contactEmailController,
                                  label: 'Contact email',
                                  keyboardType: TextInputType.emailAddress,
                                ),
                                _textField(
                                  controller: _addressController,
                                  label: 'Address',
                                  maxLines: 3,
                                ),
                                const SizedBox(height: 12),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    ButtonWidget.secondary(
                                      label: 'Cancel',
                                      onPressed: _isSaving
                                          ? null
                                          : () => router.pop(),
                                    ),
                                    const SizedBox(width: 12),
                                    ButtonWidget.primary(
                                      label: _isSaving
                                          ? 'Saving...'
                                          : _isEditing
                                          ? 'Update Customer'
                                          : 'Create Customer',
                                      onPressed:
                                          _isSaving ||
                                              _isLoadingCustomer ||
                                              (_isEditing && _customer == null)
                                          ? null
                                          : _save,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _customerMetadata(CustomerModel customer) => Container(
    width: double.infinity,
    margin: const EdgeInsets.only(bottom: 4),
    padding: const EdgeInsets.all(12),
    decoration: BoxDecoration(
      color: AppColors.backgroundColor,
      borderRadius: BorderRadius.circular(AppSize.borderRadius),
    ),
    child: Wrap(
      spacing: 24,
      runSpacing: 8,
      children: [
        ItemSectionWidget(label: 'Customer ID', value: customer.id),
        if (customer.createdAt != null)
          ItemSectionWidget(
            label: 'Created',
            value: customer.createdAt!.toDdMMMyyyy(),
          ),
        if (customer.updatedAt != null)
          ItemSectionWidget(
            label: 'Last updated',
            value: customer.updatedAt!.toDdMMMyyyy(),
          ),
        ItemSectionWidget(label: 'Projects', value: '${customer.projectCount}'),
        ItemSectionWidget(label: 'Orders', value: '${customer.orderCount}'),
      ],
    ),
  );

  Widget _textField({
    required TextEditingController controller,
    required String label,
    bool required = false,
    int maxLines = 1,
    TextInputType keyboardType = TextInputType.text,
  }) => Padding(
    padding: const EdgeInsets.only(bottom: 14),
    child: TextFormFieldWidget(
      controller: controller,
      labelText: label,
      hintText: 'Enter $label',
      keyboardType: keyboardType,
      maxLines: maxLines,
      isRequired: required,
      validator: required
          ? (value) => value == null || value.trim().isEmpty
                ? '$label is required'
                : null
          : null,
    ),
  );

  Widget _statusField() => Padding(
    padding: const EdgeInsets.only(bottom: 14),
    child: AutoCompleteWidget<CustomerStatus>(
      labelText: 'Status',
      hintText: 'Select status',
      options: CustomerStatus.values,
      displayStringForOption: _statusLabel,
      initialValue: _statusLabel(_status),
      isRequired: true,
      validator: (value) =>
          CustomerStatus.values.any(
            (status) =>
                _statusLabel(status).toLowerCase() == value?.toLowerCase(),
          )
          ? null
          : 'Select a valid status',
      onSelected: (status) => setState(() => _status = status),
    ),
  );

  String _statusLabel(CustomerStatus status) => switch (status) {
    CustomerStatus.active => 'Active',
    CustomerStatus.inActive => 'Inactive',
  };

  Future<void> _save() async {
    if (!(_formKey.currentState?.validate() ?? false)) return;
    setState(() {
      _isSaving = true;
      _error = null;
    });

    final data = <String, dynamic>{
      'name': _nameController.text.trim(),
      'phone': _nullableValue(_phoneController.text),
      'email': _nullableValue(_emailController.text),
      'address': _nullableValue(_addressController.text),
      'contactName': _nullableValue(_contactNameController.text),
      'contactPhone': _nullableValue(_contactPhoneController.text),
      'contactEmail': _nullableValue(_contactEmailController.text),
      'status': _status == CustomerStatus.active ? 'ACTIVE' : 'INACTIVE',
    };

    final saved = await _viewModel.save(
      customerId: widget.customerId,
      data: data,
    );

    if (!mounted) return;
    if (saved) {
      router.pop(true);
    } else {
      setState(() {
        _error = _viewModel.error ?? 'Unable to save customer.';
        _isSaving = false;
      });
    }
  }

  String? _nullableValue(String value) {
    final trimmed = value.trim();
    return trimmed.isEmpty ? null : trimmed;
  }
}
