import 'package:board_cut/core/core.dart';
import 'package:board_cut/core/core_injection.dart';
import 'package:board_cut/features/create_part/data/models/part_material_option.dart';
import 'package:board_cut/features/create_part/data/models/part_request_model.dart';
import 'package:board_cut/features/create_part/presentation/viewmodels/create_part_view_model.dart';
import 'package:board_cut/features/part_detail/data/model/part_detail_model.dart';
import 'package:board_cut/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class CreatePartPage extends BaseStatefulScreen {
  const CreatePartPage({super.key, required this.itemId, this.partId});

  final String itemId;
  final String? partId;

  @override
  BaseState<CreatePartPage> createState() => _CreatePartPageState();
}

class _CreatePartPageState extends BaseState<CreatePartPage> {
  late final CreatePartViewModel _viewModel;
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _widthController = TextEditingController();
  final _heightController = TextEditingController();
  final _thicknessController = TextEditingController();
  final _quantityController = TextEditingController();
  final _topController = TextEditingController();
  final _bottomController = TextEditingController();
  final _leftController = TextEditingController();
  final _rightController = TextEditingController();

  PartMaterialOption? _selectedMaterial;
  GrainDirection? _grainDirection;
  bool _grain = false;
  bool _rotatable = true;
  bool _formInitialized = false;

  bool get _isEditing => widget.partId != null;

  @override
  void initState() {
    super.initState();
    _viewModel = sl<CreatePartViewModel>()..load(partId: widget.partId);
  }

  @override
  void dispose() {
    _nameController.dispose();
    _widthController.dispose();
    _heightController.dispose();
    _thicknessController.dispose();
    _quantityController.dispose();
    _topController.dispose();
    _bottomController.dispose();
    _leftController.dispose();
    _rightController.dispose();
    _viewModel.dispose();
    super.dispose();
  }

  @override
  Widget buildResponsive(BuildContext context, ScreenType screenType) {
    final isSmallScreen =
        screenType == ScreenType.mobile || screenType == ScreenType.tablet;
    return ChangeNotifierProvider.value(
      value: _viewModel,
      child: Consumer<CreatePartViewModel>(
        builder: (context, vm, _) {
          if (vm.saved) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              if (mounted) router.pop(true);
            });
          }
          if (!_formInitialized && !vm.isLoading && vm.part != null) {
            _populateForm(vm.part!);
          }

          return Scaffold(
            backgroundColor: AppColors.transparent,
            body: Center(
              child: Container(
                width: isSmallScreen ? double.maxFinite : AppSize.dialogWidth,
                height: ResponsiveHelper.determineDialogHeight(screenType),
                decoration: BoxDecoration(
                  color: AppColors.surface,
                  borderRadius: BorderRadius.circular(AppSize.borderRadius),
                ),
                child: vm.isLoading && !_formInitialized
                    ? const Center(child: CircularProgressIndicator())
                    : Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            DialogHeaderWidget(
                              title: _isEditing ? 'Update Part' : 'New Part',
                            ),
                            const SizedBox(height: 20),
                            Expanded(
                              child: Scrollbar(
                                child: SingleChildScrollView(
                                  child: Form(
                                    key: _formKey,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.stretch,
                                      children: [
                                        if (vm.error != null) ...[
                                          Text(
                                            vm.error!,
                                            style: const TextStyle(
                                              color: AppColors.errorColor,
                                            ),
                                          ),
                                          const SizedBox(height: 12),
                                        ],
                                        _fieldRow([
                                          _textField(
                                            controller: _nameController,
                                            label: 'Part name',
                                            required: true,
                                          ),
                                          _materialField(vm),
                                        ], isSmallScreen),
                                        const SizedBox(height: 16),
                                        _fieldRow([
                                          _numberField(
                                            controller: _widthController,
                                            label: 'Width (mm)',
                                            required: true,
                                          ),
                                          _numberField(
                                            controller: _heightController,
                                            label: 'Height (mm)',
                                            required: true,
                                          ),
                                        ], isSmallScreen),
                                        const SizedBox(height: 16),
                                        _fieldRow([
                                          _numberField(
                                            controller: _thicknessController,
                                            label: 'Thickness (mm)',
                                            required: true,
                                          ),
                                          _numberField(
                                            controller: _quantityController,
                                            label: 'Quantity',
                                            required: true,
                                            integer: true,
                                          ),
                                        ], isSmallScreen),
                                        const SizedBox(height: 16),
                                        _fieldRow([
                                          _numberField(
                                            controller: _topController,
                                            label: 'Top edge (mm)',
                                          ),
                                          _numberField(
                                            controller: _bottomController,
                                            label: 'Bottom edge (mm)',
                                          ),
                                        ], isSmallScreen),
                                        const SizedBox(height: 16),
                                        _fieldRow([
                                          _numberField(
                                            controller: _leftController,
                                            label: 'Left edge (mm)',
                                          ),
                                          _numberField(
                                            controller: _rightController,
                                            label: 'Right edge (mm)',
                                          ),
                                        ], isSmallScreen),
                                        const SizedBox(height: 16),
                                        _fieldRow([
                                          _booleanField(
                                            label: 'Grain',
                                            value: _grain,
                                            onChanged: (value) => setState(() {
                                              _grain = value;
                                              if (!_grain) {
                                                _grainDirection = null;
                                              }
                                            }),
                                          ),
                                          _booleanField(
                                            label: 'Rotatable',
                                            value: _rotatable,
                                            onChanged: (value) => setState(
                                              () => _rotatable = value,
                                            ),
                                          ),
                                        ], isSmallScreen),
                                        const SizedBox(height: 16),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                            top: 6,
                                          ),
                                          child: Text(
                                            'Turn Grain on when the part must align with the sheet grain. When Grain is off, rotation follows the Rotatable setting.',
                                            style: AppTextStyle.bodyXSmall
                                                .responsive(context)
                                                .regular
                                                .copyWith(
                                                  color:
                                                      AppColors.textSecondary,
                                                ),
                                          ),
                                        ),
                                        if (_grain) ...[
                                          const SizedBox(height: 16),
                                          _grainDirectionField(),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                              top: 6,
                                            ),
                                            child: Text(
                                              'Choose the part grain axis. A 90° turn swaps the axis and is allowed only if it still matches the sheet.',
                                              style: AppTextStyle.bodyXSmall
                                                  .responsive(context)
                                                  .regular
                                                  .copyWith(
                                                    color:
                                                        AppColors.textSecondary,
                                                  ),
                                            ),
                                          ),
                                        ],
                                        const SizedBox(height: 12),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            ButtonWidget.secondary(
                                              label: 'Cancel',
                                              onPressed: vm.isSaving
                                                  ? null
                                                  : () => router.pop(),
                                            ),
                                            const SizedBox(width: 10),
                                            ButtonWidget.primary(
                                              label: vm.isSaving
                                                  ? 'Saving...'
                                                  : _isEditing
                                                  ? 'Update Part'
                                                  : 'Create Part',
                                              onPressed: vm.isSaving
                                                  ? null
                                                  : () => _save(vm),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
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
        },
      ),
    );
  }

  void _populateForm(PartDetailModel part) {
    _formInitialized = true;
    _nameController.text = part.name;
    _widthController.text = part.width.toString();
    _heightController.text = part.height.toString();
    _thicknessController.text = part.thickness.toString();
    _quantityController.text = part.quantity.toString();
    _topController.text = part.edgeBandTop?.toString() ?? '';
    _bottomController.text = part.edgeBandBottom?.toString() ?? '';
    _leftController.text = part.edgeBandLeft?.toString() ?? '';
    _rightController.text = part.edgeBandRight?.toString() ?? '';
    _grain = part.grain;
    _rotatable = part.rotatable;
    _grainDirection = part.grainDirection;
    _selectedMaterial = PartMaterialOption(
      id: part.material.id,
      name: part.material.name,
    );
  }

  Future<void> _save(CreatePartViewModel vm) async {
    if (!(_formKey.currentState?.validate() ?? false)) return;
    final material = _selectedMaterial;
    if (material == null) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Select a material')));
      return;
    }

    final request = PartRequestModel(
      orderItemId: widget.itemId,
      name: _nameController.text.trim(),
      width: double.parse(_widthController.text.trim()),
      height: double.parse(_heightController.text.trim()),
      thickness: double.parse(_thicknessController.text.trim()),
      rotatable: _rotatable,
      grainDirection: _grain ? _grainDirection : null,
      edgeBandTop: _optionalNumber(_topController),
      edgeBandBottom: _optionalNumber(_bottomController),
      edgeBandLeft: _optionalNumber(_leftController),
      edgeBandRight: _optionalNumber(_rightController),
      grain: _grain,
      materialId: material.id,
      quantity: int.parse(_quantityController.text.trim()),
    );

    final saved = await vm.save(partId: widget.partId, data: request.toJson());
    if (!saved && mounted && vm.error != null) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(vm.error!)));
    }
  }

  Widget _fieldRow(List<Widget> fields, bool isSmall) {
    final visibleFields = fields
        .where(
          (field) =>
              !(field is SizedBox &&
                  field.width == null &&
                  field.height == null),
        )
        .toList();

    return isSmall
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              for (var i = 0; i < visibleFields.length; i++) ...[
                if (i > 0) const SizedBox(height: 16),
                visibleFields[i],
              ],
            ],
          )
        : Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              for (var i = 0; i < visibleFields.length; i++) ...[
                if (i > 0) const SizedBox(width: 12),
                Expanded(child: visibleFields[i]),
              ],
            ],
          );
  }

  Widget _materialField(CreatePartViewModel vm) {
    final materials = [...vm.materials];
    if (_selectedMaterial != null &&
        !materials.any((material) => material.id == _selectedMaterial!.id)) {
      materials.insert(0, _selectedMaterial!);
    }

    return AutoCompleteWidget<PartMaterialOption>(
      labelText: 'Material',
      hintText: materials.isEmpty
          ? 'No materials available'
          : 'Select material',
      options: materials,
      initialValue: _selectedMaterial?.name,
      prefixIcon: const Icon(
        Icons.layers_outlined,
        color: AppColors.textFieldIcon,
        size: 20,
      ),
      displayStringForOption: (material) => material.name,
      onSelected: (material) => setState(() => _selectedMaterial = material),
      filterFn: (material, query) =>
          material.name.toLowerCase().contains(query),
      isRequired: true,
      validator: (_) =>
          _selectedMaterial == null ? 'Material is required' : null,
      onChanged: (value) {
        if (_selectedMaterial?.name != value) _selectedMaterial = null;
      },
    );
  }

  Widget _booleanField({
    required String label,
    required bool value,
    required ValueChanged<bool> onChanged,
  }) => AutoCompleteWidget<String>(
    labelText: label,
    hintText: 'Select ${label.toLowerCase()}',
    options: const ['Yes', 'No'],
    initialValue: value ? 'Yes' : 'No',
    displayStringForOption: (choice) => choice,
    prefixIcon: Icon(
      label == 'Grain' ? Icons.grain : Icons.rotate_right_outlined,
      color: AppColors.textFieldIcon,
      size: 20,
    ),
    isRequired: true,
    validator: (choice) =>
        choice == 'Yes' || choice == 'No' ? null : 'Select Yes or No',
    onChanged: (choice) {
      if (choice == 'Yes' || choice == 'No') onChanged(choice == 'Yes');
    },
    onSelected: (choice) => onChanged(choice == 'Yes'),
  );

  Widget _grainDirectionField() => AutoCompleteWidget<GrainDirection>(
    labelText: 'Grain direction',
    hintText: 'Select grain direction',
    options: GrainDirection.values,
    initialValue: _grainDirection?.label,
    displayStringForOption: (direction) => direction.label,
    prefixIcon: const Icon(
      Icons.swap_vert,
      color: AppColors.textFieldIcon,
      size: 20,
    ),
    filterFn: (direction, query) =>
        direction.label.toLowerCase().contains(query),
    isRequired: _grain,
    validator: (label) {
      if (!_grain) return null;
      return GrainDirection.values.any(
            (direction) =>
                direction != GrainDirection.none && direction.label == label,
          )
          ? null
          : 'Grain direction is required';
    },
    onChanged: (label) {
      final matchingDirections = GrainDirection.values.where(
        (direction) => direction.label == label,
      );
      setState(() {
        _grainDirection = matchingDirections.isEmpty
            ? null
            : matchingDirections.first;
      });
    },
    onSelected: (direction) => setState(() => _grainDirection = direction),
  );

  Widget _textField({
    required TextEditingController controller,
    required String label,
    bool required = false,
  }) => TextFormFieldWidget(
    controller: controller,
    labelText: label,
    hintText: 'Enter $label',
    isRequired: required,
    validator: required
        ? (value) => value == null || value.trim().isEmpty
              ? '$label is required'
              : null
        : null,
  );

  Widget _numberField({
    required TextEditingController controller,
    required String label,
    bool required = false,
    bool integer = false,
  }) => TextFormFieldWidget(
    controller: controller,
    labelText: label,
    hintText: 'Enter $label',
    keyboardType: TextInputType.numberWithOptions(decimal: !integer),
    inputFormatters: [
      FilteringTextInputFormatter.allow(
        RegExp(integer ? r'^\d*' : r'^\d*\.?\d*'),
      ),
    ],
    isRequired: required,
    validator: (value) {
      final text = value?.trim() ?? '';
      if (text.isEmpty) return required ? '$label is required' : null;
      final number = num.tryParse(text);
      if (number == null) return 'Enter a valid ${label.toLowerCase()}';
      if (required && number <= 0) return '$label must be greater than zero';
      if (integer && number % 1 != 0) return '$label must be a whole number';
      return null;
    },
  );

  double? _optionalNumber(TextEditingController controller) {
    final value = controller.text.trim();
    return value.isEmpty ? null : double.parse(value);
  }
}
