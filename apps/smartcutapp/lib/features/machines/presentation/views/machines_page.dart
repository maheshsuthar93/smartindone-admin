import 'dart:async';
import 'dart:math' as math;

import 'package:board_cut/core/auth/role_access.dart';
import 'package:board_cut/core/core.dart';
import 'package:board_cut/core/core_injection.dart';
import 'package:board_cut/features/factories/data/models/factory_model.dart';
import 'package:board_cut/features/machines/data/models/machine_model.dart';
import 'package:board_cut/features/machines/presentation/viewmodels/machines_view_model.dart';
import 'package:board_cut/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:provider/provider.dart';

const _machineTypes = <(MachineType, String)>[
  (MachineType.cnc, 'CNC'),
  (MachineType.panelSaw, 'Panel saw'),
  (MachineType.edgeBander, 'Edge bander'),
  (MachineType.drilling, 'Drilling'),
  (MachineType.other, 'Other'),
];

class MachinesPage extends BaseStatefulScreen {
  const MachinesPage({super.key});

  @override
  BaseState<MachinesPage> createState() => _MachinesPageState();
}

class _MachinesPageState extends BaseState<MachinesPage> {
  final _viewModel = sl<MachinesViewModel>();
  final _searchController = TextEditingController();
  Timer? _searchTimer;
  bool _canCreate = false;
  bool _canUpdate = false;
  bool _canDeactivate = false;

  @override
  void initState() {
    super.initState();
    _viewModel.initialize();
    _loadPermissions();
  }

  @override
  void dispose() {
    _searchTimer?.cancel();
    _searchController.dispose();
    _viewModel.dispose();
    super.dispose();
  }

  Future<void> _loadPermissions() async {
    final roleValue = await sl<FlutterSecureStorage>().read(
      key: 'auth_user_role',
    );
    final role = userRoleFromApi(roleValue);
    if (!mounted || role == null) return;
    setState(() {
      _canCreate = canPerformModule(role, 'factories', 'create');
      _canUpdate = canPerformModule(role, 'factories', 'update');
      _canDeactivate = canPerformModule(role, 'factories', 'delete');
    });
  }

  @override
  Widget buildResponsive(BuildContext context, ScreenType screenType) {
    _viewModel.setPageSize(screenType == ScreenType.desktop ? 8 : 5);
    return ChangeNotifierProvider.value(
      value: _viewModel,
      child: Consumer<MachinesViewModel>(
        builder: (context, vm, _) {
          if (vm.isLoading && vm.machines.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          }
          if (vm.error != null && vm.machines.isEmpty) {
            return Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(vm.error!),
                  const SizedBox(height: 12),
                  ButtonWidget.primary(
                    label: 'Retry',
                    onPressed: vm.initialize,
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

  Widget _buildContent(MachinesViewModel vm, ScreenType screenType) {
    final compact = screenType != ScreenType.desktop;
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          RecordListToolbar(
            title: 'Machines',
            subtitle: 'Manage production machines by factory.',
            description: 'Machine kerf can override the factory default.',
            action: _canCreate
                ? ButtonWidget.primary(
                    onPressed: () => _showMachineForm(vm),
                    label: compact ? 'Add' : 'Add Machine',
                    icon: Icons.add,
                    iconPosition: IconPosition.left,
                  )
                : const SizedBox.shrink(),
            searchController: _searchController,
            searchHint: 'Search by machine, code or factory...',
            onSearchChanged: _onSearchChanged,
            statusOptions: const [],
            selectedStatus: '',
            onStatusChanged: (_) {},
            onClear: () {
              _searchTimer?.cancel();
              _searchController.clear();
              vm.fetchMachines(page: 1, search: '');
            },
          ),
          const SizedBox(height: 16),
          if (vm.error != null)
            Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: Text(vm.error!, style: const TextStyle(color: Colors.red)),
            ),
          if (vm.isLoading) const LinearProgressIndicator(minHeight: 2),
          _machineTable(vm),
        ],
      ),
    );
  }

  void _onSearchChanged(String value) {
    _searchTimer?.cancel();
    _searchTimer = Timer(const Duration(milliseconds: 350), () {
      if (mounted) _viewModel.fetchMachines(page: 1, search: value.trim());
    });
  }

  Widget _machineTable(MachinesViewModel vm) {
    if (vm.machines.isEmpty && !vm.isLoading) {
      return EmptyStateWidget(
        title: vm.search.isEmpty
            ? 'No machines added yet'
            : 'No machines match your search',
        description: vm.search.isEmpty
            ? 'Add production machines and assign them to a factory.'
            : 'Try a different search term or clear your search.',
        icon: vm.search.isEmpty
            ? Icons.precision_manufacturing_outlined
            : Icons.search_off_outlined,
      );
    }

    return SizedBox(
      width: double.maxFinite,
      child: DataTableWidget(
        key: ValueKey('${vm.search}-${vm.currentPage}'),
        rowsPerPage: vm.pageSize,
        sortAscending: true,
        columns: const [
          DataColumn(label: TableHeader(label: 'NAME')),
          DataColumn(label: TableHeader(label: 'CODE')),
          DataColumn(label: TableHeader(label: 'TYPE')),
          DataColumn(label: TableHeader(label: 'FACTORY')),
          DataColumn(label: TableHeader(label: 'KERF (MM)')),
          DataColumn(label: TableHeader(label: 'STATUS')),
          DataColumn(label: TableHeader(label: 'ACTION')),
        ],
        dataSource: _MachinesDataSource(
          machines: vm.machines,
          totalCount: vm.totalCount,
          currentPage: vm.currentPage,
          pageSize: vm.pageSize,
          isLoading: vm.isLoading,
          buildRow: (machine) => _machineRow(vm, machine),
        ),
        onPageChanged: (firstRowIndex) {
          final page = firstRowIndex ~/ vm.pageSize + 1;
          if (page != vm.currentPage && page <= vm.totalPages) {
            vm.fetchMachines(page: page);
          }
        },
      ),
    );
  }

  DataRow _machineRow(MachinesViewModel vm, MachineModel machine) => DataRow(
    cells: [
      DataCell(TableValue(label: machine.name)),
      DataCell(TableValue(label: machine.code)),
      DataCell(TableValue(label: _machineTypeLabel(machine.type))),
      DataCell(TableValue(label: machine.factoryName)),
      DataCell(
        TableValue(label: machine.kerf?.toString() ?? 'Factory default'),
      ),
      DataCell(
        TableStatusValue(
          label: machine.isActive ? 'Active' : 'Inactive',
          color: AppColors.statusColor(
            machine.isActive ? 'active' : 'inactive',
          ),
        ),
      ),
      DataCell(
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (_canUpdate)
              IconButton(
                tooltip: 'Edit machine',
                onPressed: vm.isSaving
                    ? null
                    : () => _showMachineForm(vm, machine: machine),
                icon: const Icon(Icons.edit, size: 20),
              ),
            if (_canDeactivate && machine.isActive)
              IconButton(
                tooltip: 'Deactivate machine',
                onPressed: vm.isSaving
                    ? null
                    : () => _confirmDeactivate(vm, machine),
                icon: const Icon(Icons.block_outlined),
              ),
          ],
        ),
      ),
    ],
  );

  Future<void> _showMachineForm(
    MachinesViewModel vm, {
    MachineModel? machine,
  }) async {
    final error = await MachineFormPageRoute(
      (_) => _MachineFormDialog(
        machine: machine,
        factories: vm.factories,
        onSave: (data) => vm.saveMachine(machineId: machine?.id, data: data),
      ),
    ).push<String>(context);
    if (error == null || !mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(error)));
  }

  Future<void> _confirmDeactivate(
    MachinesViewModel vm,
    MachineModel machine,
  ) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text('Deactivate machine?'),
        content: Text('Deactivate ${machine.name} (${machine.code})?'),
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
    final error = await vm.deactivateMachine(machine.id);
    if (!mounted) return;
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(error ?? 'Machine deactivated.')));
  }
}

String _machineTypeLabel(MachineType type) {
  return switch (type) {
    MachineType.cnc => 'CNC',
    MachineType.panelSaw => 'Panel saw',
    MachineType.edgeBander => 'Edge bander',
    MachineType.drilling => 'Drilling',
    MachineType.other => 'Other',
  };
}

class _MachinesDataSource extends DataTableSource {
  _MachinesDataSource({
    required this.machines,
    required this.totalCount,
    required this.currentPage,
    required this.pageSize,
    required this.isLoading,
    required this.buildRow,
  });

  final List<MachineModel> machines;
  final int totalCount;
  final int currentPage;
  final int pageSize;
  final bool isLoading;
  final DataRow Function(MachineModel machine) buildRow;

  @override
  DataRow? getRow(int index) {
    if (isLoading) return null;
    final localIndex = index - (currentPage - 1) * pageSize;
    if (localIndex < 0 || localIndex >= machines.length) return null;
    return DataRow.byIndex(
      index: index,
      cells: buildRow(machines[localIndex]).cells,
    );
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => totalCount;

  @override
  int get selectedRowCount => 0;
}

class _MachineFormDialog extends StatefulWidget {
  const _MachineFormDialog({
    required this.factories,
    required this.onSave,
    this.machine,
  });

  final MachineModel? machine;
  final List<FactoryModel> factories;
  final Future<String?> Function(Map<String, dynamic> data) onSave;

  @override
  State<_MachineFormDialog> createState() => _MachineFormDialogState();
}

class _MachineFormDialogState extends State<_MachineFormDialog> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _nameController;
  late final TextEditingController _kerfController;
  late MachineType _type;
  late String? _factoryId;
  late bool _isActive;
  bool _isSaving = false;
  String? _error;

  @override
  void initState() {
    super.initState();
    final machine = widget.machine;
    _nameController = TextEditingController(text: machine?.name ?? '');
    _kerfController = TextEditingController(
      text: machine?.kerf?.toString() ?? '',
    );
    _type = machine?.type ?? MachineType.cnc;
    _factoryId = machine?.factoryId;
    _isActive = machine?.isActive ?? true;
  }

  @override
  void dispose() {
    _nameController.dispose();
    _kerfController.dispose();
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

    return Scaffold(
      backgroundColor: AppColors.transparent,
      body: Center(
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
                  title: widget.machine == null
                      ? 'Add Machine'
                      : 'Edit Machine',
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
                                _twoFields(_nameField(), _typeField()),
                                const SizedBox(height: 16),
                                _twoFields(_factoryField(), _kerfField()),
                                const SizedBox(height: 16),
                                if (widget.machine != null) ...[
                                  const SizedBox(height: 16),
                                  _statusField(),
                                ],
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
                                  : widget.machine == null
                                  ? 'Create Machine'
                                  : 'Save changes',
                              onPressed: _isSaving ? null : _save,
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
    hintText: 'Enter machine name',
    isRequired: true,
    maxLength: 100,
    validator: (value) =>
        (value?.trim().length ?? 0) < 2 ? 'Enter at least 2 characters.' : null,
  );

  Widget _typeField() => AutoCompleteWidget<(MachineType, String)>(
    labelText: 'Machine type',
    hintText: 'Select machine type',
    options: _machineTypes,
    displayStringForOption: (type) => type.$2,
    initialValue: _machineTypeLabel(_type),
    isRequired: true,
    validator: (text) =>
        _machineTypes.any(
          (type) => type.$2.toLowerCase() == text?.trim().toLowerCase(),
        )
        ? null
        : 'Select a valid machine type.',
    onChanged: (text) {
      final match = _machineTypes
          .where((type) => type.$2.toLowerCase() == text.trim().toLowerCase())
          .firstOrNull;
      _type = match?.$1 ?? MachineType.cnc;
    },
    onSelected: (type) => setState(() => _type = type.$1),
  );

  Widget _factoryField() {
    final selectedFactory = widget.factories
        .where((factory) => factory.id == _factoryId)
        .firstOrNull;
    return AutoCompleteWidget<FactoryModel>(
      labelText: 'Factory',
      hintText: 'Select factory',
      options: widget.factories,
      displayStringForOption: _factoryLabel,
      initialValue: selectedFactory == null
          ? null
          : _factoryLabel(selectedFactory),
      isRequired: true,
      validator: (text) =>
          widget.factories.any(
            (factory) =>
                _factoryLabel(factory).toLowerCase() ==
                text?.trim().toLowerCase(),
          )
          ? null
          : 'Select a factory.',
      onChanged: (text) {
        final match = widget.factories
            .where(
              (factory) =>
                  _factoryLabel(factory).toLowerCase() ==
                  text.trim().toLowerCase(),
            )
            .firstOrNull;
        _factoryId = match?.id;
      },
      onSelected: (factory) => setState(() => _factoryId = factory.id),
    );
  }

  Widget _kerfField() => TextFormFieldWidget(
    controller: _kerfController,
    labelText: 'Kerf override (mm)',
    hintText: 'Leave blank to use factory default',
    keyboardType: const TextInputType.numberWithOptions(decimal: true),
    inputFormatters: [
      FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*$')),
    ],
    validator: (value) {
      if (value == null || value.trim().isEmpty) return null;
      final kerf = double.tryParse(value);
      return kerf == null || !kerf.isFinite || kerf < 0
          ? 'Enter a non-negative number.'
          : null;
    },
  );

  Widget _statusField() => AutoCompleteWidget<(bool, String)>(
    labelText: 'Status',
    hintText: 'Select status',
    options: const [(true, 'Active'), (false, 'Inactive')],
    displayStringForOption: (status) => status.$2,
    initialValue: _isActive ? 'Active' : 'Inactive',
    isRequired: true,
    validator: (value) =>
        value == 'Active' || value == 'Inactive' ? null : 'Select a status.',
    onSelected: (status) => setState(() => _isActive = status.$1),
  );

  String _factoryLabel(FactoryModel factory) =>
      factory.code.isEmpty ? factory.name : '${factory.name} (${factory.code})';

  Future<void> _save() async {
    if (!_formKey.currentState!.validate()) return;
    setState(() {
      _isSaving = true;
      _error = null;
    });
    final kerfText = _kerfController.text.trim();
    final data = <String, dynamic>{
      'name': _nameController.text.trim(),
      'type': switch (_type) {
        MachineType.cnc => 'CNC',
        MachineType.panelSaw => 'PANEL_SAW',
        MachineType.edgeBander => 'EDGE_BANDER',
        MachineType.drilling => 'DRILLING',
        MachineType.other => 'OTHER',
      },
      'factoryId': _factoryId,
      if (widget.machine != null) 'isActive': _isActive,
      if (kerfText.isNotEmpty) 'kerf': double.parse(kerfText),
      if (widget.machine != null && kerfText.isEmpty) 'kerf': null,
    };
    final error = await widget.onSave(data);
    if (!mounted) return;
    if (error != null) {
      setState(() {
        _isSaving = false;
        _error = error;
      });
      return;
    }
    Navigator.pop(context);
  }
}
