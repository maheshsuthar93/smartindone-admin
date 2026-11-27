import 'package:board_cut/core/core.dart';
import 'package:board_cut/core/core_injection.dart';
import 'package:board_cut/features/factories/data/models/factory_model.dart';
import 'package:board_cut/features/factories/presentation/viewmodels/factory_form_view_model.dart';
import 'package:board_cut/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FactoryFormPage extends BaseStatefulScreen {
  const FactoryFormPage({super.key, this.factory});

  final FactoryModel? factory;

  @override
  BaseState<FactoryFormPage> createState() => _FactoryFormPageState();
}

class _FactoryFormPageState extends BaseState<FactoryFormPage> {
  final _formKey = GlobalKey<FormState>();
  final _name = TextEditingController();
  final _address = TextEditingController();
  final _city = TextEditingController();
  final _state = TextEditingController();
  final _phone = TextEditingController();
  final _email = TextEditingController();
  final _kerf = TextEditingController();
  bool _isActive = true;
  late final FactoryFormViewModel _viewModel;

  @override
  void initState() {
    super.initState();
    final factory = widget.factory;
    _viewModel = sl<FactoryFormViewModel>();
    if (factory != null) {
      _name.text = factory.name;
      _address.text = factory.address ?? '';
      _city.text = factory.city ?? '';
      _state.text = factory.state ?? '';
      _phone.text = factory.phone ?? '';
      _email.text = factory.email ?? '';
      _kerf.text = factory.kerf?.toString() ?? '';
      _isActive = factory.isActive;
    }
  }

  @override
  void dispose() {
    _name.dispose();
    _address.dispose();
    _city.dispose();
    _state.dispose();
    _phone.dispose();
    _email.dispose();
    _kerf.dispose();
    _viewModel.dispose();
    super.dispose();
  }

  @override
  Widget buildResponsive(BuildContext context, ScreenType screenType) {
    final isSmall = screenType != ScreenType.desktop;
    return ChangeNotifierProvider.value(
      value: _viewModel,
      child: Consumer<FactoryFormViewModel>(
        builder: (context, vm, _) => Center(
          child: Container(
            width: isSmall ? double.infinity : AppSize.dialogWidth,
            constraints: BoxConstraints(
              maxHeight: isSmall ? 700 : 620,
              minHeight: isSmall ? 520 : 420,
            ),
            decoration: BoxDecoration(
              color: AppColors.surface,
              borderRadius: BorderRadius.circular(AppSize.borderRadius),
            ),
            padding: const EdgeInsets.all(20),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  DialogHeaderWidget(
                    title: widget.factory == null
                        ? 'Add Factory'
                        : 'Update Factory',
                  ),
                  const SizedBox(height: 16),
                  Expanded(
                    child: Column(
                      children: [
                        Expanded(
                          child: Scrollbar(
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  if (vm.error != null) ...[
                                    Text(
                                      vm.error!,
                                      style: const TextStyle(color: Colors.red),
                                    ),
                                    const SizedBox(height: 12),
                                  ],
                                  LayoutBuilder(
                                    builder: (context, constraints) {
                                      const spacing = 12.0;
                                      final fieldWidth =
                                          (constraints.maxWidth - spacing) / 2;

                                      return Wrap(
                                        spacing: spacing,
                                        children: [
                                          SizedBox(
                                            width: fieldWidth,
                                            child: _field(
                                              _name,
                                              'Name',
                                              required: true,
                                            ),
                                          ),
                                          SizedBox(
                                            width: fieldWidth,
                                            child: _field(
                                              _kerf,
                                              'Kerf (mm)',
                                              keyboardType:
                                                  const TextInputType.numberWithOptions(
                                                    decimal: true,
                                                  ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: fieldWidth,
                                            child: _field(_city, 'City'),
                                          ),
                                          SizedBox(
                                            width: fieldWidth,
                                            child: _field(_state, 'State'),
                                          ),
                                          SizedBox(
                                            width: fieldWidth,
                                            child: _field(
                                              _phone,
                                              'Phone',
                                              keyboardType: TextInputType.phone,
                                            ),
                                          ),
                                          SizedBox(
                                            width: fieldWidth,
                                            child: _field(
                                              _email,
                                              'Email',
                                              keyboardType:
                                                  TextInputType.emailAddress,
                                            ),
                                          ),
                                          SizedBox(
                                            width: fieldWidth,
                                            child: _statusField(),
                                          ),
                                        ],
                                      );
                                    },
                                  ),
                                  SizedBox(
                                    width: double.infinity,
                                    child: _field(
                                      _address,
                                      'Address',
                                      maxLines: 2,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 12),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            ButtonWidget.secondary(
                              label: 'Cancel',
                              onPressed: vm.isSaving
                                  ? null
                                  : () => router.pop(),
                            ),
                            const SizedBox(width: 12),
                            ButtonWidget.primary(
                              label: widget.factory == null
                                  ? 'Create Factory'
                                  : 'Update Factory',
                              onPressed: vm.isSaving ? null : _save,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _field(
    TextEditingController controller,
    String label, {
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
      initialValue: _isActive ? 'Active' : 'Inactive',
      displayStringForOption: (status) =>
          status == CustomerStatus.active ? 'Active' : 'Inactive',
      isRequired: true,
      validator: (value) => value == 'Active' || value == 'Inactive'
          ? null
          : 'Select a valid status',
      onSelected: (status) =>
          setState(() => _isActive = status == CustomerStatus.active),
    ),
  );

  Future<void> _save() async {
    if (!(_formKey.currentState?.validate() ?? false)) return;
    final saved = await _viewModel.save(
      factory: widget.factory,
      data: {
        'name': _name.text.trim(),
        'address': _address.text.trim(),
        'city': _city.text.trim(),
        'state': _state.text.trim(),
        'phone': _phone.text.trim(),
        'email': _email.text.trim(),
        'kerf': double.tryParse(_kerf.text.trim()),
        'isActive': _isActive,
      },
    );
    if (saved && mounted) router.pop(true);
  }
}
