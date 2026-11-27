import 'dart:async';
import 'dart:math' as math;

import 'package:board_cut/core/core.dart';
import 'package:board_cut/core/core_injection.dart';
import 'package:board_cut/core/auth/role_access.dart';
import 'package:board_cut/features/materials/data/models/material_model.dart';
import 'package:board_cut/features/materials/presentation/viewmodels/materials_view_model.dart';
import 'package:board_cut/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:provider/provider.dart';

const _materialTypes = <(String, String)>[
  ('MDF', 'MDF'),
  ('HDHMR', 'HDHMR'),
  ('PLYWOOD', 'Plywood'),
  ('PARTICLE_BOARD', 'Particle board'),
  ('LAMINATE', 'Laminate'),
  ('ACRYLIC', 'Acrylic'),
  ('ALUMINIUM', 'Aluminium'),
  ('GLASS', 'Glass'),
  ('MIRROR', 'Mirror'),
  ('OTHER', 'Other'),
];

const _materialUnits = <(String, String)>[
  ('SHEET', 'Sheet'),
  ('SQM', 'Square metre'),
  ('SQFT', 'Square foot'),
  ('KG', 'Kilogram'),
];

class MaterialsPage extends BaseStatefulScreen {
  const MaterialsPage({super.key});

  @override
  BaseState<MaterialsPage> createState() => _MaterialsPageState();
}

class _MaterialsPageState extends BaseState<MaterialsPage> {
  final _viewModel = sl<MaterialsViewModel>();
  final _searchController = TextEditingController();
  Timer? _searchTimer;
  bool _canManageMaterials = false;

  @override
  void initState() {
    super.initState();
    _loadPermissions();
  }

  @override
  void dispose() {
    _searchTimer?.cancel();
    _searchController.dispose();
    super.dispose();
  }

  Future<void> _loadPermissions() async {
    final roleValue = await sl<FlutterSecureStorage>().read(
      key: 'auth_user_role',
    );
    final role = userRoleFromApi(roleValue);
    if (!mounted) return;
    setState(() {
      _canManageMaterials =
          role != null &&
          canPerformModule(role, 'inventory', 'create') &&
          canPerformModule(role, 'inventory', 'update') &&
          canPerformModule(role, 'inventory', 'delete');
    });
  }

  @override
  Widget buildResponsive(BuildContext context, ScreenType screenType) {
    _viewModel.setPageSize(screenType == ScreenType.desktop ? 8 : 5);
    return ChangeNotifierProvider(
      create: (_) => _viewModel..fetchMaterials(),
      child: Consumer<MaterialsViewModel>(
        builder: (context, vm, child) {
          if (vm.isLoading && vm.materials.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          }
          if (vm.error != null && vm.materials.isEmpty) {
            return Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(vm.error!),
                  const SizedBox(height: 12),
                  ButtonWidget.primary(
                    label: 'Retry',
                    onPressed: () => vm.fetchMaterials(page: vm.currentPage),
                  ),
                ],
              ),
            );
          }
          return _buildContent(vm, screenType);
        },
      ),
    );
  }

  Widget _buildContent(MaterialsViewModel vm, ScreenType screenType) {
    final isSmall = screenType != ScreenType.desktop;
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  RecordListToolbar(
                    title: 'Materials',
                    subtitle: 'Manage materials for the active company.',
                    description:
                        'Material records are scoped to your selected company.',
                    action: _canManageMaterials
                        ? ButtonWidget.primary(
                            onPressed: () => _showMaterialForm(vm),
                            label: isSmall ? 'Add' : 'Create Material',
                            icon: Icons.add,
                            iconPosition: IconPosition.left,
                          )
                        : const SizedBox.shrink(),
                    searchController: _searchController,
                    searchHint: 'Search by material name or code...',
                    onSearchChanged: _onSearchChanged,
                    statusOptions: const [],
                    selectedStatus: '',
                    onStatusChanged: (_) {},
                    onClear: () {
                      _searchController.clear();
                      _searchTimer?.cancel();
                      vm.fetchMaterials(page: 1, search: '');
                    },
                  ),
                  const SizedBox(height: 16),
                  if (vm.error != null)
                    Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: Text(
                        vm.error!,
                        style: const TextStyle(color: Colors.red),
                      ),
                    ),
                  if (vm.isLoading) const LinearProgressIndicator(minHeight: 2),
                  _materialsTable(vm),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  void _onSearchChanged(String value) {
    _searchTimer?.cancel();
    _searchTimer = Timer(const Duration(milliseconds: 350), () {
      if (!mounted) return;
      _viewModel.fetchMaterials(page: 1, search: value.trim());
    });
  }

  Widget _materialsTable(MaterialsViewModel vm) {
    if (vm.materials.isEmpty && !vm.isLoading) {
      return EmptyStateWidget(
        title: vm.search.isEmpty
            ? 'No materials added yet'
            : 'No materials match your search',
        description: vm.search.isEmpty
            ? 'Materials you add for this company will be listed here.'
            : 'Try a different search term or clear your search.',
        icon: vm.search.isEmpty
            ? Icons.layers_outlined
            : Icons.search_off_outlined,
      );
    }

    return SizedBox(
      width: double.maxFinite,
      child: DataTableWidget(
        key: ValueKey(vm.search),
        rowsPerPage: vm.pageSize,
        sortAscending: true,
        columns: const [
          DataColumn(label: TableHeader(label: 'NAME')),
          DataColumn(label: TableHeader(label: 'CODE')),
          DataColumn(label: TableHeader(label: 'TYPE')),
          DataColumn(label: TableHeader(label: 'THICKNESS')),
          DataColumn(label: TableHeader(label: 'UNIT')),
          DataColumn(label: TableHeader(label: 'STATUS')),
          DataColumn(label: TableHeader(label: 'ACTION')),
        ],
        dataSource: _MaterialsDataSource(
          materials: vm.materials,
          totalCount: vm.totalCount,
          currentPage: vm.currentPage,
          pageSize: vm.pageSize,
          isLoading: vm.isLoading,
          buildRow: (material) => _materialRow(vm, material),
        ),
        onPageChanged: (firstRowIndex) {
          final page = firstRowIndex ~/ vm.pageSize + 1;
          if (page != vm.currentPage && page <= vm.totalPages) {
            vm.fetchMaterials(page: page);
          }
        },
      ),
    );
  }

  DataRow _materialRow(MaterialsViewModel vm, MaterialModel material) =>
      DataRow(
        cells: [
          DataCell(TableValue(label: material.name)),
          DataCell(TableValue(label: material.code)),
          DataCell(TableValue(label: _labelFor(_materialTypes, material.type))),
          DataCell(
            TableValue(
              label: material.thickness == null
                  ? '—'
                  : '${material.thickness} mm',
            ),
          ),
          DataCell(TableValue(label: _labelFor(_materialUnits, material.unit))),
          DataCell(
            TableStatusValue(
              label: material.isActive ? 'Active' : 'Inactive',
              color: AppColors.statusColor(
                material.isActive ? 'active' : 'inactive',
              ),
            ),
          ),
          DataCell(
            _canManageMaterials
                ? Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        tooltip: 'Edit material',
                        onPressed: () =>
                            _showMaterialForm(vm, material: material),
                        icon: const Icon(Icons.edit, size: 20),
                      ),
                      IconButton(
                        tooltip: 'Delete material',
                        onPressed: () => _confirmDelete(vm, material),
                        icon: const Icon(Icons.delete_outline),
                      ),
                    ],
                  )
                : const SizedBox.shrink(),
          ),
        ],
      );

  Future<void> _showMaterialForm(
    MaterialsViewModel vm, {
    MaterialModel? material,
  }) async {
    final saved = await MaterialFormPageRoute(material).push<bool>(context);
    if (saved == true && mounted) {
      await vm.fetchMaterials(page: vm.currentPage);
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            material == null ? 'Material created.' : 'Material updated.',
          ),
        ),
      );
    }
  }

  Future<void> _confirmDelete(
    MaterialsViewModel vm,
    MaterialModel material,
  ) async {
    final shouldDelete = await showDialog<bool>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text('Delete material?'),
        content: Text(
          'Delete ${material.name} (${material.code})? Materials already used by parts or inventory may not be deletable.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext, false),
            child: const Text('Cancel'),
          ),
          FilledButton(
            onPressed: () => Navigator.pop(dialogContext, true),
            child: const Text('Delete'),
          ),
        ],
      ),
    );
    if (shouldDelete != true) return;
    final error = await vm.removeMaterial(material.id);
    if (!mounted) return;
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(error ?? 'Material deleted.')));
  }
}

class _MaterialsDataSource extends DataTableSource {
  _MaterialsDataSource({
    required this.materials,
    required this.totalCount,
    required this.currentPage,
    required this.pageSize,
    required this.isLoading,
    required this.buildRow,
  });

  final List<MaterialModel> materials;
  final int totalCount;
  final int currentPage;
  final int pageSize;
  final bool isLoading;
  final DataRow Function(MaterialModel material) buildRow;

  @override
  DataRow? getRow(int index) {
    if (isLoading) return null;
    final pageStartIndex = (currentPage - 1) * pageSize;
    final materialIndex = index - pageStartIndex;
    if (materialIndex < 0 || materialIndex >= materials.length) return null;
    return DataRow.byIndex(
      index: index,
      cells: buildRow(materials[materialIndex]).cells,
    );
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => totalCount;

  @override
  int get selectedRowCount => 0;
}

class MaterialFormPage extends StatefulWidget {
  const MaterialFormPage({super.key, this.material});

  final MaterialModel? material;

  @override
  State<MaterialFormPage> createState() => _MaterialFormPageState();
}

class _MaterialFormPageState extends State<MaterialFormPage> {
  final _viewModel = sl<MaterialsViewModel>();
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _nameController;
  late final TextEditingController _thicknessController;
  late String _type;
  late String _unit;
  late bool _isActive;
  bool _isSaving = false;
  String? _error;

  @override
  void initState() {
    super.initState();
    final material = widget.material;
    _nameController = TextEditingController(text: material?.name ?? '');
    _thicknessController = TextEditingController(
      text: material?.thickness?.toString() ?? '',
    );
    _type = material?.type ?? _materialTypes.first.$1;
    _unit = material?.unit ?? _materialUnits.first.$1;
    _isActive = material?.isActive ?? true;
  }

  @override
  void dispose() {
    _nameController.dispose();
    _thicknessController.dispose();
    _viewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenType = ResponsiveHelper.getScreenType(context);
    final isSmallScreen = screenType != ScreenType.desktop;
    final screenSize = MediaQuery.sizeOf(context);
    final keyboardInset = MediaQuery.viewInsetsOf(context).vertical;
    final availableHeight = (screenSize.height - keyboardInset - 32).clamp(
      320.0,
      screenSize.height,
    );
    final dialogHeight = math.min(
      ResponsiveHelper.determineDialogHeight(screenType),
      availableHeight,
    );

    return Scaffold(
      backgroundColor: AppColors.transparent,
      body: Center(
        child: Container(
          width: isSmallScreen ? double.maxFinite : AppSize.dialogWidth,
          height: dialogHeight,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppSize.borderRadius),
            color: AppColors.surface,
          ),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                DialogHeaderWidget(
                  title: widget.material == null
                      ? 'Create Material'
                      : 'Update Material',
                ),
                const SizedBox(height: 12),
                Expanded(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        Expanded(
                          child: SingleChildScrollView(
                            padding: const EdgeInsets.only(right: 4),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                if (widget.material != null) ...[
                                  Text('Code: ${widget.material!.code}'),
                                  const SizedBox(height: 12),
                                ],
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(child: _nameField()),
                                    const SizedBox(width: 16),
                                    Expanded(child: _typeField()),
                                  ],
                                ),
                                const SizedBox(height: 16),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(child: _thicknessField()),
                                    const SizedBox(width: 16),
                                    Expanded(child: _unitField()),
                                  ],
                                ),
                                _statusField(),
                                if (_error != null)
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      _error!,
                                      style: const TextStyle(color: Colors.red),
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            ButtonWidget.secondary(
                              label: 'Cancel',
                              onPressed: _isSaving
                                  ? null
                                  : () => Navigator.pop(context),
                            ),
                            const SizedBox(width: 10),
                            ButtonWidget.primary(
                              label: _isSaving
                                  ? 'Saving...'
                                  : widget.material == null
                                  ? 'Create'
                                  : 'Save changes',
                              onPressed: _isSaving ? null : _submit,
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

  Widget _nameField() => TextFormFieldWidget(
    controller: _nameController,
    labelText: 'Name',
    hintText: 'Enter material name',
    isRequired: true,
    validator: (value) {
      final name = value?.trim() ?? '';
      if (name.length < 2) return 'Enter at least 2 characters.';
      if (name.length > 100) return 'Name cannot exceed 100 characters.';
      return null;
    },
  );

  Widget _typeField() => _dropdownField(
    label: 'Material type',
    value: _type,
    options: _materialTypes,
    onChanged: (value) => setState(() => _type = value),
  );

  Widget _thicknessField() => TextFormFieldWidget(
    controller: _thicknessController,
    labelText: 'Thickness (mm)',
    hintText: 'Optional',
    keyboardType: const TextInputType.numberWithOptions(decimal: true),
    validator: (value) {
      final text = value?.trim() ?? '';
      if (text.isEmpty) return null;
      final number = double.tryParse(text);
      if (number == null || number <= 0) {
        return 'Enter a positive number or leave blank.';
      }
      return null;
    },
  );

  Widget _unitField() => _dropdownField(
    label: 'Unit',
    value: _unit,
    options: _materialUnits,
    onChanged: (value) => setState(() => _unit = value),
  );

  Widget _statusField() => Padding(
    padding: const EdgeInsets.only(top: 12, bottom: 14),
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

  Widget _dropdownField({
    required String label,
    required String value,
    required List<(String, String)> options,
    required ValueChanged<String> onChanged,
  }) => AutoCompleteWidget<String>(
    labelText: label,
    hintText: 'Select ${label.toLowerCase()}',
    options: options.map((option) => option.$1).toList(),
    displayStringForOption: (option) => _labelFor(options, option),
    initialValue: _labelFor(options, value),
    isRequired: true,
    validator: (enteredValue) =>
        options.any(
          (option) =>
              option.$2.toLowerCase() == enteredValue?.trim().toLowerCase() ||
              option.$1.toLowerCase() == enteredValue?.trim().toLowerCase(),
        )
        ? null
        : 'Select a valid ${label.toLowerCase()}.',
    onSelected: onChanged,
  );

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;
    setState(() {
      _isSaving = true;
      _error = null;
    });
    final thicknessText = _thicknessController.text.trim();
    final data = <String, dynamic>{
      'name': _nameController.text.trim(),
      'type': _type,
      'unit': _unit,
      'isActive': _isActive,
      if (thicknessText.isNotEmpty)
        'thickness': double.parse(thicknessText)
      else if (widget.material != null)
        'thickness': null,
    };
    final error = await _viewModel.saveMaterial(
      materialId: widget.material?.id,
      data: data,
    );
    if (!mounted) return;
    if (error == null) {
      Navigator.pop(context, true);
      return;
    }
    setState(() {
      _isSaving = false;
      _error = error;
    });
  }
}

String _labelFor(List<(String, String)> options, String value) =>
    _labelForValue(options, value);

String _labelForValue(List<(String, String)> options, String value) {
  for (final option in options) {
    if (option.$1 == value) return option.$2;
  }
  return value;
}
