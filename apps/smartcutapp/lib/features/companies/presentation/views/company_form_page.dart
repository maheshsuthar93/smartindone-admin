import 'dart:math' as math;

import 'package:board_cut/core/core.dart';
import 'package:board_cut/core/core_injection.dart';
import 'package:board_cut/features/companies/presentation/viewmodels/company_form_view_model.dart';
import 'package:board_cut/shared/data/model/company_model.dart';
import 'package:board_cut/shared/shared.dart' hide CompanyModel;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CompanyFormPage extends BaseStatefulScreen {
  const CompanyFormPage({super.key, this.company});

  final CompanyModel? company;

  @override
  BaseState<CompanyFormPage> createState() => _CompanyFormPageState();
}

class _CompanyFormPageState extends BaseState<CompanyFormPage> {
  final _formKey = GlobalKey<FormState>();
  final _name = TextEditingController();
  final _serviceType = TextEditingController();
  final _ownerName = TextEditingController();
  final _ownerEmail = TextEditingController();
  final _ownerPhone = TextEditingController();
  late final CompanyFormViewModel _viewModel;
  bool _isActive = true;

  @override
  void initState() {
    super.initState();
    _viewModel = sl<CompanyFormViewModel>();
    _name.text = widget.company?.name ?? '';
    _serviceType.text = widget.company?.serviceType ?? '';
    _ownerName.text = widget.company?.ownerName ?? '';
    _ownerEmail.text = widget.company?.ownerEmail ?? '';
    _ownerPhone.text = widget.company?.ownerPhone ?? '';
    _isActive = widget.company?.isActive ?? true;
  }

  @override
  void dispose() {
    _name.dispose();
    _serviceType.dispose();
    _ownerName.dispose();
    _ownerEmail.dispose();
    _ownerPhone.dispose();
    _viewModel.dispose();
    super.dispose();
  }

  @override
  Widget buildResponsive(BuildContext context, ScreenType screenType) {
    final isSmall = screenType != ScreenType.desktop;
    final size = MediaQuery.sizeOf(context);
    final availableHeight = (size.height -
            MediaQuery.viewInsetsOf(context).vertical -
            32)
        .clamp(320.0, size.height);
    final dialogHeight = math.min(
      ResponsiveHelper.determineDialogHeight(screenType),
      availableHeight,
    );
    return ChangeNotifierProvider.value(
      value: _viewModel,
      child: Consumer<CompanyFormViewModel>(
        builder: (context, vm, _) => Center(
          child: Container(
            width: isSmall ? double.maxFinite : AppSize.dialogWidth,
            height: dialogHeight,
            decoration: BoxDecoration(
              color: AppColors.surface,
              borderRadius: BorderRadius.circular(AppSize.borderRadius),
            ),
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                DialogHeaderWidget(
                  title: widget.company == null
                      ? 'Add Company'
                      : 'Update Company',
                ),
                const SizedBox(height: 12),
                Expanded(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        Expanded(
                          child: Scrollbar(
                            child: SingleChildScrollView(
                              padding: const EdgeInsets.only(right: 4),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  if (vm.error != null) ...[
                                    Text(vm.error!, style: const TextStyle(color: Colors.red)),
                                    const SizedBox(height: 12),
                                  ],
                                  _responsiveRow(
                                    screenType,
                                    _textField(_name, 'Name', 'Enter company name', required: true),
                                    _textField(_serviceType, 'Company service/type', 'e.g. Electrical services'),
                                  ),
                                  const SizedBox(height: 16),
                                  _responsiveRow(
                                    screenType,
                                    _textField(_ownerName, 'Owner name', 'Enter owner name'),
                                    _textField(
                                      _ownerEmail,
                                      'Owner email',
                                      'name@example.com',
                                      keyboardType: TextInputType.emailAddress,
                                      validator: _emailValidator,
                                    ),
                                  ),
                                  const SizedBox(height: 16),
                                  _responsiveRow(
                                    screenType,
                                    _textField(_ownerPhone, 'Owner phone', 'Enter owner phone', keyboardType: TextInputType.phone),
                                    _statusField(vm),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            ButtonWidget.secondary(
                              label: 'Cancel',
                              onPressed: vm.isSaving ? null : () => router.pop(),
                            ),
                            const SizedBox(width: 10),
                            ButtonWidget.primary(
                              label: vm.isSaving
                                  ? 'Saving...'
                                  : widget.company == null
                                  ? 'Create Company'
                                  : 'Save changes',
                              onPressed: vm.isSaving ? null : _save,
                            ),
                          ],
                        ),
                      ],
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

  Widget _responsiveRow(ScreenType screenType, Widget first, Widget second) =>
      screenType == ScreenType.desktop
      ? Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Expanded(child: first),
          const SizedBox(width: 16),
          Expanded(child: second),
        ])
      : Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          first,
          const SizedBox(height: 14),
          second,
        ]);

  Widget _textField(
    TextEditingController controller,
    String label,
    String hint, {
    bool required = false,
    TextInputType keyboardType = TextInputType.text,
    String? Function(String?)? validator,
  }) => TextFormFieldWidget(
    controller: controller,
    labelText: label,
    hintText: hint,
    keyboardType: keyboardType,
    isRequired: required,
    validator: validator ?? (required ? (value) => value == null || value.trim().isEmpty ? '$label is required.' : null : null),
  );

  Widget _statusField(CompanyFormViewModel vm) => AutoCompleteWidget<String>(
    labelText: 'Company status',
    hintText: 'Select status',
    options: const ['Active', 'Inactive'],
    displayStringForOption: (status) => status,
    initialValue: _isActive ? 'Active' : 'Inactive',
    isRequired: true,
    validator: (value) => const ['Active', 'Inactive'].contains(value)
        ? null
        : 'Select a valid status.',
    onSelected: (status) {
      if (!vm.isSaving) setState(() => _isActive = status == 'Active');
    },
  );

  String? _emailValidator(String? value) {
    final email = value?.trim() ?? '';
    if (email.isEmpty) return null;
    return email.contains('@') ? null : 'Enter a valid email address.';
  }

  Future<void> _save() async {
    if (!(_formKey.currentState?.validate() ?? false)) return;
    final saved = await _viewModel.save(
      company: widget.company,
      name: _name.text.trim(),
      isActive: _isActive,
      serviceType: _serviceType.text,
      ownerName: _ownerName.text,
      ownerEmail: _ownerEmail.text,
      ownerPhone: _ownerPhone.text,
    );
    if (saved && mounted) router.pop(true);
  }
}
