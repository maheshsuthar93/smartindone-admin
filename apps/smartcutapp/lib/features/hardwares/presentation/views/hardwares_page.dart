import 'dart:async';
import 'dart:math' as math;

import 'package:board_cut/core/auth/role_access.dart';
import 'package:board_cut/core/core.dart';
import 'package:board_cut/core/core_injection.dart';
import 'package:board_cut/features/hardwares/data/models/hardware_model.dart';
import 'package:board_cut/features/hardwares/presentation/viewmodels/hardwares_view_model.dart';
import 'package:board_cut/features/warehouses/data/models/warehouse_model.dart';
import 'package:board_cut/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:provider/provider.dart';

const _hardwareTypes = <(String, String)>[
  ('HINGE', 'Hinge'),
  ('HANDLE', 'Handle'),
  ('CHANNEL', 'Channel'),
  ('LOCK', 'Lock'),
  ('SCREW', 'Screw'),
  ('CONNECTOR', 'Connector'),
  ('GAS_SPRING', 'Gas spring'),
  ('OTHER', 'Other'),
];

const _hardwareUnits = <(String, String)>[
  ('PCS', 'Pieces'),
  ('BOX', 'Box'),
  ('PACK', 'Pack'),
  ('SET', 'Set'),
  ('PAIR', 'Pair'),
  ('METER', 'Metre'),
  ('KG', 'Kilogram'),
];

class HardwaresPage extends BaseStatefulScreen {
  const HardwaresPage({super.key});

  @override
  BaseState<HardwaresPage> createState() => _HardwaresPageState();
}

class _HardwaresPageState extends BaseState<HardwaresPage> {
  final _viewModel = sl<HardwaresViewModel>();
  final _searchController = TextEditingController();
  Timer? _searchTimer;
  bool _canManageHardwares = false;

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
      _canManageHardwares =
          role != null &&
          canPerformModule(role, 'inventory', 'create') &&
          canPerformModule(role, 'inventory', 'update') &&
          canPerformModule(role, 'inventory', 'delete');
    });
  }

  @override
  Widget buildResponsive(BuildContext context, ScreenType screenType) {
    final vm = _viewModel;
    vm.setPageSize(screenType == ScreenType.desktop ? 8 : 5);
    return ChangeNotifierProvider(
      create: (_) => vm
        ..fetchHardwares()
        ..fetchWarehouses(),
      child: Consumer<HardwaresViewModel>(
        builder: (context, vm, _) {
          if (vm.isLoading && vm.hardwares.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          }
          if (vm.error != null && vm.hardwares.isEmpty) {
            return Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(vm.error!),
                  const SizedBox(height: 12),
                  ButtonWidget.primary(
                    label: 'Retry',
                    onPressed: () => vm.fetchHardwares(page: vm.currentPage),
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

  Widget _buildContent(HardwaresViewModel vm, ScreenType screenType) {
    final isSmallScreen = screenType != ScreenType.desktop;
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
                    title: 'Hardware',
                    subtitle: 'Manage hardware and stock for this company.',
                    description: 'Hardware records and warehouse stock belong to the active company.',
                    action: _canManageHardwares
                        ? ButtonWidget.primary(
                            onPressed: () => _showHardwareForm(vm),
                            label: isSmallScreen ? 'Add' : 'Add Hardware',
                            icon: Icons.add,
                            iconPosition: IconPosition.left,
                          )
                        : const SizedBox.shrink(),
                    searchController: _searchController,
                    searchHint: 'Search by hardware, code, brand or finish...',
                    onSearchChanged: _onSearchChanged,
                    statusOptions: const [],
                    selectedStatus: '',
                    onStatusChanged: (_) {},
                    onClear: () {
                      _searchTimer?.cancel();
                      _searchController.clear();
                      vm.fetchHardwares(page: 1, search: '');
                    },
                  ),
                  const SizedBox(height: 16),
                  if (vm.warehouseError != null)
                    Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: Text(
                        'Warehouses could not be loaded: ${vm.warehouseError}',
                        style: const TextStyle(color: Colors.red),
                      ),
                    ),
                  if (vm.error != null)
                    Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: Text(
                        vm.error!,
                        style: const TextStyle(color: Colors.red),
                      ),
                    ),
                  if (vm.isLoading) const LinearProgressIndicator(minHeight: 2),
                  _hardwareTable(vm),
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
      if (mounted) _viewModel.fetchHardwares(page: 1, search: value.trim());
    });
  }

  Widget _hardwareTable(HardwaresViewModel vm) {
    if (vm.hardwares.isEmpty && !vm.isLoading) {
      return EmptyStateWidget(
        title: vm.search.isEmpty
            ? 'No hardware added yet'
            : 'No hardware matches your search',
        description: vm.search.isEmpty
            ? 'Hardware items added for this company will appear here.'
            : 'Try a different search term or clear your search.',
        icon: vm.search.isEmpty
            ? Icons.handyman_outlined
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
          DataColumn(label: TableHeader(label: 'BRAND')),
          DataColumn(label: TableHeader(label: 'FINISH')),
          DataColumn(label: TableHeader(label: 'AVAILABLE')),
          DataColumn(label: TableHeader(label: 'UNIT')),
          DataColumn(label: TableHeader(label: 'STATUS')),
          DataColumn(label: TableHeader(label: 'ACTION')),
        ],
        dataSource: _HardwaresDataSource(
          hardwares: vm.hardwares,
          totalCount: vm.totalCount,
          currentPage: vm.currentPage,
          pageSize: vm.pageSize,
          isLoading: vm.isLoading,
          buildRow: (hardware) => _hardwareRow(vm, hardware),
        ),
        onPageChanged: (firstRowIndex) {
          final page = firstRowIndex ~/ vm.pageSize + 1;
          if (page != vm.currentPage && page <= vm.totalPages) {
            vm.fetchHardwares(page: page);
          }
        },
      ),
    );
  }

  DataRow _hardwareRow(HardwaresViewModel vm, HardwareModel hardware) =>
      DataRow(
        cells: [
          DataCell(TableValue(label: hardware.name)),
          DataCell(TableValue(label: hardware.code)),
          DataCell(TableValue(label: _labelFor(_hardwareTypes, hardware.type))),
          DataCell(TableValue(label: hardware.brand ?? '—')),
          DataCell(TableValue(label: hardware.finish ?? '—')),
          DataCell(TableValue(label: _formatQuantity(hardware.availableStock))),
          DataCell(TableValue(label: _labelFor(_hardwareUnits, hardware.unit))),
          DataCell(
            TableStatusValue(
              label: hardware.isActive ? 'Active' : 'Inactive',
              color: AppColors.statusColor(
                hardware.isActive ? 'active' : 'inactive',
              ),
            ),
          ),
          DataCell(
            _canManageHardwares
                ? Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        tooltip: 'Edit hardware',
                        onPressed: vm.isSaving
                            ? null
                            : () => _showHardwareForm(vm, hardware: hardware),
                        icon: const Icon(Icons.edit, size: 20),
                      ),
                      if (hardware.isActive)
                        IconButton(
                          tooltip: 'Deactivate hardware',
                          onPressed: vm.isSaving
                              ? null
                              : () => _confirmDeactivate(vm, hardware),
                          icon: const Icon(Icons.block_outlined),
                        ),
                    ],
                  )
                : const SizedBox.shrink(),
          ),
        ],
      );

  Future<void> _showHardwareForm(
    HardwaresViewModel vm, {
    HardwareModel? hardware,
  }) async {
    final saved = await showDialog<bool>(
      context: context,
      builder: (_) => _HardwareFormDialog(
        hardware: hardware,
        warehouses: vm.warehouses,
        warehouseError: vm.warehouseError,
        onSave: (data) => vm.saveHardware(hardwareId: hardware?.id, data: data),
      ),
    );
    if (saved == true && mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            hardware == null ? 'Hardware created.' : 'Hardware updated.',
          ),
        ),
      );
    }
  }

  Future<void> _confirmDeactivate(
    HardwaresViewModel vm,
    HardwareModel hardware,
  ) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text('Deactivate hardware?'),
        content: Text(
          'Deactivate ${hardware.name} (${hardware.code})? It will no longer be available for new package assignments.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext, false),
            child: const Text('Cancel'),
          ),
          ButtonWidget.danger(
            label: 'Deactivate',
            onPressed: () => Navigator.pop(dialogContext, true),
          ),
        ],
      ),
    );
    if (confirmed != true) return;
    final error = await vm.deactivate(hardware.id);
    if (!mounted) return;
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(error ?? 'Hardware deactivated.')));
  }
}

class _HardwaresDataSource extends DataTableSource {
  _HardwaresDataSource({
    required this.hardwares,
    required this.totalCount,
    required this.currentPage,
    required this.pageSize,
    required this.isLoading,
    required this.buildRow,
  });

  final List<HardwareModel> hardwares;
  final int totalCount;
  final int currentPage;
  final int pageSize;
  final bool isLoading;
  final DataRow Function(HardwareModel hardware) buildRow;

  @override
  DataRow? getRow(int index) {
    if (isLoading) return null;
    final localIndex = index - (currentPage - 1) * pageSize;
    if (localIndex < 0 || localIndex >= hardwares.length) return null;
    return DataRow.byIndex(
      index: index,
      cells: buildRow(hardwares[localIndex]).cells,
    );
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => totalCount;

  @override
  int get selectedRowCount => 0;
}

class _HardwareFormDialog extends StatefulWidget {
  const _HardwareFormDialog({
    required this.warehouses,
    required this.onSave,
    this.warehouseError,
    this.hardware,
  });

  final HardwareModel? hardware;
  final List<WarehouseModel> warehouses;
  final String? warehouseError;
  final Future<String?> Function(Map<String, dynamic> data) onSave;

  @override
  State<_HardwareFormDialog> createState() => _HardwareFormDialogState();
}

class _HardwareFormDialogState extends State<_HardwareFormDialog> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _nameController;
  late final TextEditingController _brandController;
  late final TextEditingController _finishController;
  late final TextEditingController _specificationController;
  late final TextEditingController _quantityController;
  late final TextEditingController _minimumStockController;
  late String _type;
  late String _unit;
  late bool _isActive;
  String? _warehouseId;
  bool _isSaving = false;
  String? _error;

  bool get _isEditing => widget.hardware != null;

  @override
  void initState() {
    super.initState();
    final hardware = widget.hardware;
    _nameController = TextEditingController(text: hardware?.name ?? '');
    _brandController = TextEditingController(text: hardware?.brand ?? '');
    _finishController = TextEditingController(text: hardware?.finish ?? '');
    _specificationController = TextEditingController(
      text: hardware?.specification ?? '',
    );
    _quantityController = TextEditingController(text: '1');
    _minimumStockController = TextEditingController(
      text: hardware == null || hardware.inventoryBalances.isEmpty
          ? '0'
          : hardware.inventoryBalances.first.minStock.toString(),
    );
    _type = hardware?.type ?? _hardwareTypes.first.$1;
    _unit = hardware?.unit ?? _hardwareUnits.first.$1;
    _isActive = hardware?.isActive ?? true;
    _warehouseId = widget.warehouses.firstOrNull?.id;
  }

  @override
  void dispose() {
    _nameController.dispose();
    _brandController.dispose();
    _finishController.dispose();
    _specificationController.dispose();
    _quantityController.dispose();
    _minimumStockController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenType = ResponsiveHelper.getScreenType(context);
    final isSmall = screenType != ScreenType.desktop;
    final size = MediaQuery.sizeOf(context);
    final availableHeight =
        (size.height - MediaQuery.viewInsetsOf(context).vertical - 32).clamp(
          320.0,
          size.height,
        );
    final height = math.min(
      ResponsiveHelper.determineDialogHeight(screenType),
      availableHeight,
    );
    return Dialog(
      backgroundColor: AppColors.transparent,
      insetPadding: EdgeInsets.all(isSmall ? 12 : 40),
      child: Container(
        width: isSmall ? double.maxFinite : AppSize.dialogWidth,
        height: height,
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(AppSize.borderRadius),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              DialogHeaderWidget(
                title: _isEditing ? 'Update Hardware' : 'Add Hardware',
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
                              if (_isEditing) ...[
                                Text('Code: ${widget.hardware!.code}'),
                                const SizedBox(height: 12),
                              ],
                              _twoFields(_nameField(), _typeField()),
                              const SizedBox(height: 16),
                              _twoFields(_brandField(), _finishField()),
                              const SizedBox(height: 16),
                              _twoFields(_unitField(), _minimumStockField()),
                              if (!_isEditing) ...[
                                const SizedBox(height: 16),
                                _twoFields(_warehouseField(), _quantityField()),
                              ],
                              const SizedBox(height: 16),
                              _statusField(),
                              _specificationField(),
                              if (!_isEditing && widget.warehouses.isEmpty)
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    widget.warehouseError ?? 'Create an active warehouse before adding hardware stock.',
                                    style: const TextStyle(color: Colors.red),
                                  ),
                                ),
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
                                : _isEditing
                                ? 'Save changes'
                                : 'Create Hardware',
                            onPressed:
                                _isSaving ||
                                    (!_isEditing && widget.warehouses.isEmpty)
                                ? null
                                : _submit,
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
    );
  }

  Widget _twoFields(Widget first, Widget second) => Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Expanded(child: first),
      const SizedBox(width: 16),
      Expanded(child: second),
    ],
  );

  Widget _nameField() => TextFormFieldWidget(
    controller: _nameController,
    labelText: 'Name',
    hintText: 'Enter hardware name',
    isRequired: true,
    maxLength: 100,
    validator: (value) {
      final name = value?.trim() ?? '';
      return name.length < 2 ? 'Enter at least 2 characters.' : null;
    },
  );

  Widget _brandField() => TextFormFieldWidget(
    controller: _brandController,
    labelText: 'Brand',
    hintText: 'Optional',
  );

  Widget _finishField() => TextFormFieldWidget(
    controller: _finishController,
    labelText: 'Finish',
    hintText: 'Optional',
  );

  Widget _specificationField() => TextFormFieldWidget(
    controller: _specificationController,
    labelText: 'Specification',
    hintText: 'Optional details',
    maxLines: 2,
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

  Widget _minimumStockField() => TextFormFieldWidget(
    controller: _minimumStockController,
    labelText: 'Minimum stock',
    hintText: '0',
    keyboardType: TextInputType.number,
    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
    validator: (value) => int.tryParse(value ?? '') == null
        ? 'Enter a non-negative whole number.'
        : null,
  );

  Widget _quantityField() => TextFormFieldWidget(
    controller: _quantityController,
    labelText: 'Starting quantity',
    hintText: '1',
    keyboardType: TextInputType.number,
    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
    isRequired: true,
    validator: (value) {
      final quantity = int.tryParse(value ?? '');
      return quantity == null || quantity < 1
          ? 'Enter a positive whole number.'
          : null;
    },
  );

  Widget _typeField() => _enumField(
    label: 'Hardware type',
    value: _type,
    options: _hardwareTypes,
    onChanged: (value) => setState(() => _type = value),
  );

  Widget _unitField() => _enumField(
    label: 'Unit',
    value: _unit,
    options: _hardwareUnits,
    onChanged: (value) => setState(() => _unit = value),
  );

  Widget _enumField({
    required String label,
    required String value,
    required List<(String, String)> options,
    required ValueChanged<String> onChanged,
  }) => AutoCompleteWidget<(String, String)>(
    labelText: label,
    hintText: 'Select ${label.toLowerCase()}',
    options: options,
    displayStringForOption: (option) => option.$2,
    initialValue: _labelFor(options, value),
    isRequired: true,
    validator: (text) =>
        options.any(
          (option) => option.$2.toLowerCase() == text?.trim().toLowerCase(),
        )
        ? null
        : 'Select a valid ${label.toLowerCase()}.',
    onChanged: (text) {
      final match = options
          .where(
            (option) => option.$2.toLowerCase() == text.trim().toLowerCase(),
          )
          .firstOrNull;
      onChanged(match?.$1 ?? '');
    },
    onSelected: (option) => onChanged(option.$1),
  );

  Widget _warehouseField() {
    final selectedWarehouse = widget.warehouses
        .where((warehouse) => warehouse.id == _warehouseId)
        .firstOrNull;
    return AutoCompleteWidget<WarehouseModel>(
      labelText: 'Warehouse',
      hintText: 'Select warehouse',
      options: widget.warehouses,
      displayStringForOption: (warehouse) => warehouse.name,
      initialValue: selectedWarehouse?.name,
      isRequired: true,
      validator: (text) =>
          widget.warehouses.any(
            (warehouse) =>
                warehouse.name.toLowerCase() == text?.trim().toLowerCase(),
          )
          ? null
          : 'Select a warehouse.',
      onChanged: (text) {
        final match = widget.warehouses
            .where(
              (warehouse) =>
                  warehouse.name.toLowerCase() == text.trim().toLowerCase(),
            )
            .firstOrNull;
        _warehouseId = match?.id;
      },
      onSelected: (warehouse) => setState(() => _warehouseId = warehouse.id),
    );
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;
    if (!_isEditing && _warehouseId == null) {
      setState(() => _error = 'Select an active warehouse.');
      return;
    }
    setState(() {
      _isSaving = true;
      _error = null;
    });
    final data = <String, dynamic>{
      'name': _nameController.text.trim(),
      'type': _type,
      'unit': _unit,
      'brand': _brandController.text.trim(),
      'finish': _finishController.text.trim(),
      'specification': _specificationController.text.trim(),
      'minStock': int.parse(_minimumStockController.text),
      'isActive': _isActive,
      if (!_isEditing) ...{
        'warehouseId': _warehouseId,
        'quantity': int.parse(_quantityController.text),
      },
    };
    final error = await widget.onSave(data);
    if (!mounted) return;
    if (error == null) {
      Navigator.pop(context, true);
    } else {
      setState(() {
        _isSaving = false;
        _error = error;
      });
    }
  }
}

String _labelFor(List<(String, String)> options, String value) {
  for (final option in options) {
    if (option.$1 == value) return option.$2;
  }
  return value;
}

String _formatQuantity(double quantity) => quantity == quantity.roundToDouble()
    ? quantity.toStringAsFixed(0)
    : quantity.toStringAsFixed(2);
