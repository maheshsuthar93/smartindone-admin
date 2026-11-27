import 'dart:math' as math;

import 'package:board_cut/core/core.dart';
import 'package:board_cut/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../viewmodels/create_inventory_view_model.dart';

class CreateInventoryPage extends BaseStatefulScreen {
  const CreateInventoryPage({super.key});

  @override
  BaseState<CreateInventoryPage> createState() => _CreateInventoryPageState();
}

class _CreateInventoryPageState extends BaseState<CreateInventoryPage> {
  late final CreateInventoryViewModel _viewModel;
  final _formKey = GlobalKey<FormState>();
  final _hardwareNameController = TextEditingController();
  final _quantityController = TextEditingController();
  final _widthController = TextEditingController();
  final _heightController = TextEditingController();
  final _remarkController = TextEditingController();
  final _brandController = TextEditingController();
  final _finishController = TextEditingController();
  final _specificationController = TextEditingController();
  final _minStockController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _viewModel = CreateInventoryViewModel()..addListener(_onViewModelChanged);
  }

  void _onViewModelChanged() {
    if (mounted) setState(() {});
  }

  @override
  void dispose() {
    _viewModel
      ..removeListener(_onViewModelChanged)
      ..dispose();
    _hardwareNameController.dispose();
    _quantityController.dispose();
    _widthController.dispose();
    _heightController.dispose();
    _remarkController.dispose();
    _brandController.dispose();
    _finishController.dispose();
    _specificationController.dispose();
    _minStockController.dispose();
    super.dispose();
  }

  @override
  Widget buildResponsive(BuildContext context, ScreenType screenType) {
    final isSmallScreen = screenType != ScreenType.desktop;
    final screenHeight = MediaQuery.sizeOf(context).height;
    final keyboardInset = MediaQuery.viewInsetsOf(context).vertical;
    final availableHeight = (screenHeight - keyboardInset - 32).clamp(
      320.0,
      screenHeight,
    );
    final dialogHeight = math.min(
      ResponsiveHelper.determineDialogHeight(screenType),
      availableHeight,
    );
    return Scaffold(
      backgroundColor: AppColors.transparent,
      body: Center(
        child: Container(
          height: dialogHeight,
          width: isSmallScreen ? double.maxFinite : AppSize.dialogWidth,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppSize.borderRadius),
            color: AppColors.surface,
          ),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                DialogHeaderWidget(title: 'Create Inventory'),
                const SizedBox(height: 20),
                Expanded(child: _buildForm()),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildForm() => Form(
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
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    spacing: 20,
                    children: [
                      _responsiveRow(_typeField, _materialField),
                      _responsiveRow(_quantityField, _statusField),
                      if (_viewModel.isSheet) ...[
                        _responsiveRow(_widthField, _heightField),
                        _responsiveRow(_sheetTypeField, _grainDirectionField),
                      ] else ...[
                        _responsiveRow(_hardwareTypeField, _hardwareUnitField),
                        _responsiveRow(_brandField, _finishField),
                        _minStockField,
                        _specificationField,
                        _remarkField,
                      ],
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(height: 16),
        Align(
          alignment: Alignment.centerRight,
          child: Wrap(
            alignment: WrapAlignment.end,
            spacing: 10,
            runSpacing: 10,
            children: [
              SizedBox(
                width: 160,
                child: ButtonWidget.secondary(
                  label: 'Cancel',
                  onPressed: router.pop,
                ),
              ),
              SizedBox(width: 200, child: _buildCreateButton),
            ],
          ),
        ),
      ],
    ),
  );

  Widget _responsiveRow(Widget first, Widget second) => LayoutBuilder(
    builder: (context, constraints) => constraints.maxWidth < 560
        ? Column(spacing: 12, children: [first, second])
        : Row(
            spacing: 10,
            children: [
              Expanded(child: first),
              Expanded(child: second),
            ],
          ),
  );

  Widget get _widthField => _numberField(
    label: 'Width',
    hint: 'Enter sheet width',
    controller: _widthController,
    required: true,
    positive: true,
  );

  Widget get _heightField => _numberField(
    label: 'Height',
    hint: 'Enter sheet height',
    controller: _heightController,
    required: true,
    positive: true,
  );

  Widget get _quantityField => _numberField(
    label: 'Quantity',
    hint: _viewModel.isSheet ? 'Number of sheets' : 'Hardware quantity',
    controller: _quantityController,
    required: true,
    positive: true,
    integer: true,
  );

  Widget get _minStockField => _numberField(
    label: 'Minimum stock',
    hint: 'Optional reorder threshold',
    controller: _minStockController,
    integer: true,
    positive: false,
  );

  Widget get _brandField =>
      _textField('Brand', 'Optional brand', _brandController);

  Widget get _finishField =>
      _textField('Finish', 'Optional finish', _finishController);

  Widget get _specificationField => _textField(
    'Specification',
    'Optional hardware specification',
    _specificationController,
    maxLines: 2,
  );

  Widget get _remarkField => _textField(
    'Remark',
    'Additional inventory information',
    _remarkController,
    maxLines: 3,
  );

  Widget _numberField({
    required String label,
    required String hint,
    required TextEditingController controller,
    bool required = false,
    bool positive = true,
    bool integer = false,
  }) => _buildTextFormField(
    labelText: label,
    hintText: hint,
    controller: controller,
    isRequired: required,
    keyboardType: TextInputType.numberWithOptions(decimal: !integer),
    inputFormatters: [
      FilteringTextInputFormatter.allow(
        RegExp(integer ? r'^\d*' : r'^\d*\.?\d*'),
      ),
    ],
    validator: (value) {
      final text = value?.trim() ?? '';
      if (text.isEmpty) return required ? '$label is required' : null;
      final number = num.tryParse(text);
      if (number == null) return 'Enter a valid ${label.toLowerCase()}';
      if (positive && number <= 0) return '$label must be greater than zero';
      if (integer && number % 1 != 0) return '$label must be a whole number';
      return null;
    },
    prefixIcon: const Icon(
      Icons.numbers,
      color: AppColors.textFieldIcon,
      size: 20,
    ),
  );

  Widget _textField(
    String label,
    String hint,
    TextEditingController controller, {
    int maxLines = 1,
  }) => _buildTextFormField(
    labelText: label,
    hintText: hint,
    controller: controller,
    maxLines: maxLines,
  );

  Widget get _statusField => _selectField<InventoryStatus>(
    label: 'Status',
    options: InventoryStatus.values,
    selected: _viewModel.status,
    onSelected: _viewModel.setStatus,
    displayStringForOption: _viewModel.optionLabel,
    validator: (_) =>
        _viewModel.status == null ? 'Select a status from the list' : null,
  );

  Widget get _typeField => _selectField<InventoryType>(
    label: 'Inventory type',
    options: CreateInventoryViewModel.inventoryTypes,
    selected: _viewModel.type,
    onSelected: _viewModel.setType,
    displayStringForOption: _viewModel.optionLabel,
    validator: (_) => null,
  );

  Widget get _materialField => !_viewModel.isSheet
      ? _buildTextFormField(
          labelText: 'Hardware name',
          hintText: 'Enter hardware name',
          controller: _hardwareNameController,
          isRequired: true,
          validator: (value) => value == null || value.trim().isEmpty
              ? 'Hardware name is required'
              : null,
          prefixIcon: const Icon(
            Icons.inventory_2_outlined,
            color: AppColors.textFieldIcon,
            size: 20,
          ),
        )
      : _selectField(
          label: 'Material',
          options: Constants.materials,
          selected: _viewModel.material,
          onSelected: _viewModel.setMaterial,
          displayStringForOption: (value) => value,
          onChanged: (value) {
            if (value != _viewModel.material) _viewModel.setMaterial(null);
          },
          validator: (_) =>
              _viewModel.material == null ? 'Select a material' : null,
        );

  Widget get _sheetTypeField => _selectField<SheetType>(
    label: 'Sheet type',
    options: [SheetType.full, SheetType.offcut],
    selected: _viewModel.sheetType,
    onSelected: _viewModel.setSheetType,
    displayStringForOption: _viewModel.optionLabel,
    validator: (_) =>
        _viewModel.sheetType == null ? 'Select a sheet type' : null,
  );

  Widget get _grainDirectionField => _selectField<GrainDirection>(
    label: 'Grain direction',
    options: GrainDirection.values,
    selected: _viewModel.grainDirection,
    onSelected: _viewModel.setGrainDirection,
    displayStringForOption: (direction) => direction.label,
    validator: (_) =>
        _viewModel.grainDirection == null ? 'Select a grain direction' : null,
  );

  Widget get _hardwareTypeField => _selectField<HardwareType>(
    label: 'Hardware type',
    options: HardwareType.values,
    selected: _viewModel.hardwareType,
    onSelected: _viewModel.setHardwareType,
    displayStringForOption: _viewModel.optionLabel,
    validator: (_) =>
        _viewModel.hardwareType == null ? 'Select a hardware type' : null,
  );

  Widget get _hardwareUnitField => _selectField<HardwareUnit>(
    label: 'Unit',
    options: HardwareUnit.values,
    selected: _viewModel.hardwareUnit,
    onSelected: _viewModel.setHardwareUnit,
    displayStringForOption: _viewModel.optionLabel,
    validator: (_) => _viewModel.hardwareUnit == null ? 'Select a unit' : null,
  );

  Widget _selectField<T extends Object>({
    required String label,
    required List<T> options,
    required T? selected,
    required ValueChanged<T> onSelected,
    required String Function(T) displayStringForOption,
    ValueChanged<String>? onChanged,
    required String? Function(String?) validator,
  }) => _buildAutoCompleteField<T>(
    labelText: label,
    hintText: 'Select $label'.toLowerCase(),
    options: options,
    initialValue: selected == null ? null : displayStringForOption(selected),
    displayStringForOption: displayStringForOption,
    onSelected: onSelected,
    onChanged: onChanged,
    validator: validator,
    isRequired: true,
    prefixIcon: const Icon(
      Icons.category_outlined,
      color: AppColors.textFieldIcon,
      size: 20,
    ),
  );

  Widget get _buildCreateButton => ButtonWidget(
    label: 'Create Inventory',
    onPressed: () {
      if (_formKey.currentState?.validate() ?? false) router.pop();
    },
  );

  Widget _buildTextFormField({
    String? labelText,
    String? hintText,
    TextInputType keyboardType = TextInputType.text,
    List<TextInputFormatter>? inputFormatters,
    int maxLines = 1,
    Widget? prefixIcon,
    bool isRequired = false,
    TextEditingController? controller,
    String? Function(String?)? validator,
  }) => TextFormFieldWidget(
    inputFormatters: inputFormatters,
    keyboardType: keyboardType,
    maxLines: maxLines,
    hintText: hintText,
    labelText: labelText,
    prefixIcon: prefixIcon,
    isRequired: isRequired,
    controller: controller,
    validator: validator,
  );

  Widget _buildAutoCompleteField<T extends Object>({
    String? labelText,
    String? hintText,
    required List<T> options,
    required String Function(T) displayStringForOption,
    required void Function(T) onSelected,
    ValueChanged<String>? onChanged,
    String? Function(String?)? validator,
    String? initialValue,
    bool isRequired = false,
    Widget? prefixIcon,
  }) => AutoCompleteWidget<T>(
    labelText: labelText,
    hintText: hintText,
    options: options,
    displayStringForOption: displayStringForOption,
    onSelected: onSelected,
    onChanged: onChanged,
    validator: validator,
    initialValue: initialValue,
    isRequired: isRequired,
    prefixIcon: prefixIcon,
  );
}
