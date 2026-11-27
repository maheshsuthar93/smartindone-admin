import 'dart:math' as math;

import 'package:board_cut/core/core.dart';
import 'package:board_cut/core/core_injection.dart';
import 'package:board_cut/features/process_types/data/models/process_type_model.dart';
import 'package:board_cut/features/process_types/presentation/viewmodels/process_types_view_model.dart';
import 'package:board_cut/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class ProcessTypesPage extends BaseStatefulScreen {
  const ProcessTypesPage({super.key});

  @override
  BaseState<ProcessTypesPage> createState() => _ProcessTypesPageState();
}

class _ProcessTypesPageState extends BaseState<ProcessTypesPage> {
  late final ProcessTypesViewModel _viewModel;
  final _searchController = TextEditingController();
  String _searchQuery = '';

  @override
  void initState() {
    super.initState();
    _viewModel = sl<ProcessTypesViewModel>()..fetchProcessTypes();
  }

  @override
  void dispose() {
    _searchController.dispose();
    _viewModel.dispose();
    super.dispose();
  }

  @override
  Widget buildResponsive(BuildContext context, ScreenType screenType) {
    return ChangeNotifierProvider.value(
      value: _viewModel,
      child: Consumer<ProcessTypesViewModel>(
        builder: (context, vm, _) => Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      RecordListToolbar(
                        title: 'Process types',
                        subtitle: 'Configure the production stages used for this company.',
                        description: 'Manage the order and names of your production steps.',
                        action: ButtonWidget.primary(
                          onPressed: vm.isSaving ? null : () => _edit(vm),
                          label: screenType == ScreenType.desktop
                              ? 'Add process type'
                              : 'Add',
                          icon: Icons.add,
                          iconPosition: IconPosition.left,
                        ),
                        searchController: _searchController,
                        searchHint: 'Search process types...',
                        onSearchChanged: (value) => setState(
                          () => _searchQuery = value.trim().toLowerCase(),
                        ),
                        statusOptions: const [],
                        selectedStatus: '',
                        onStatusChanged: (_) {},
                        onClear: () {
                          _searchController.clear();
                          setState(() => _searchQuery = '');
                        },
                      ),
                      const SizedBox(height: 16),
                      if (vm.error != null) ...[
                        _errorBanner(vm.error!, onRetry: vm.fetchProcessTypes),
                        const SizedBox(height: 12),
                      ],
                      _content(vm, screenType),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _content(ProcessTypesViewModel vm, ScreenType screenType) {
    if (vm.isLoading && vm.processTypes.isEmpty) {
      return const Padding(
        padding: EdgeInsets.all(48),
        child: Center(child: CircularProgressIndicator()),
      );
    }

    final processTypes = vm.processTypes
        .where((item) => item.name.toLowerCase().contains(_searchQuery))
        .toList();
    if (processTypes.isEmpty) {
      return EmptyStateWidget(
        title: _searchQuery.isEmpty
            ? 'No process types yet'
            : 'No process types match your search',
        description: _searchQuery.isEmpty
            ? 'Add the production stages your company follows.'
            : 'Try a different search term or clear your search.',
        icon: _searchQuery.isEmpty
            ? Icons.precision_manufacturing_outlined
            : Icons.search_off_outlined,
      );
    }

    final isSmallScreen =
        screenType == ScreenType.mobile || screenType == ScreenType.tablet;
    return SizedBox(
      width: double.maxFinite,
      child: DataTableWidget(
        rowsPerPage: isSmallScreen ? 5 : 8,
        sortAscending: true,
        columns: const [
          DataColumn(label: TableHeader(label: 'SEQUENCE')),
          DataColumn(label: TableHeader(label: 'PROCESS TYPE')),
          DataColumn(label: TableHeader(label: 'ACTION')),
        ],
        dataSource: _ProcessTypesDataSource(
          processTypes: processTypes,
          isSaving: vm.isSaving,
          onEdit: (processType) => _edit(vm, processType),
          onDelete: (processType) => _delete(vm, processType),
        ),
      ),
    );
  }

  Widget _errorBanner(String message, {required VoidCallback onRetry}) => Card(
    color: AppColors.errorColor.withValues(alpha: 0.08),
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: Row(
        children: [
          Expanded(child: Text(message)),
          TextButton(onPressed: onRetry, child: const Text('Retry')),
        ],
      ),
    ),
  );

  Future<void> _edit(
    ProcessTypesViewModel vm, [
    ProcessTypeModel? processType,
  ]) async {
    final saved = await ProcessTypeFormPageRoute(
      (_) => _ProcessTypeFormDialog(
        processType: processType,
        sequenceDefault: vm.processTypes.length + 1,
        onSave: (name, sequenceOrder) async {
          final success = processType == null
              ? await vm.create(name: name, sequenceOrder: sequenceOrder)
              : await vm.update(
                  processTypeId: processType.id,
                  name: name,
                  sequenceOrder: sequenceOrder,
                );
          return success ? null : (vm.error ?? 'Could not save process type.');
        },
      ),
    ).push<bool>(context);

    if (saved == true && mounted) {
      _showNotice('Process type saved');
    }
  }

  Future<void> _delete(
    ProcessTypesViewModel vm,
    ProcessTypeModel processType,
  ) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text('Delete process type?'),
        content: Text(
          'Delete “${processType.name}”? A process type used by existing pieces may not be removable.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext, false),
            child: const Text('Cancel'),
          ),
          ButtonWidget.danger(
            label: 'Delete',
            onPressed: () => Navigator.pop(dialogContext, true),
          ),
        ],
      ),
    );
    if (confirmed != true) return;
    final success = await vm.delete(processTypeId: processType.id);
    if (mounted && success) _showNotice('Process type deleted');
  }

  void _showNotice(String message) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(SnackBar(content: Text(message)));
  }
}

class _ProcessTypeFormDialog extends StatefulWidget {
  const _ProcessTypeFormDialog({
    required this.sequenceDefault,
    required this.onSave,
    this.processType,
  });

  final ProcessTypeModel? processType;
  final int sequenceDefault;
  final Future<String?> Function(String name, int sequenceOrder) onSave;

  @override
  State<_ProcessTypeFormDialog> createState() => _ProcessTypeFormDialogState();
}

class _ProcessTypeFormDialogState extends State<_ProcessTypeFormDialog> {
  final _formKey = GlobalKey<FormState>();
  late final _nameController = TextEditingController(
    text: widget.processType?.name ?? '',
  );
  late final _sequenceController = TextEditingController(
    text: (widget.processType?.sequenceOrder ?? widget.sequenceDefault)
        .toString(),
  );
  bool _isSaving = false;
  String? _error;

  @override
  void dispose() {
    _nameController.dispose();
    _sequenceController.dispose();
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
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppColors.surface,
            borderRadius: BorderRadius.circular(AppSize.borderRadius),
          ),
          child: Column(
            children: [
              DialogHeaderWidget(
                title: widget.processType == null
                    ? 'Add Process Type'
                    : 'Update Process Type',
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
                          child: isSmall
                              ? Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    _nameField(),
                                    const SizedBox(height: 14),
                                    _sequenceField(),
                                    if (_error != null) ...[
                                      const SizedBox(height: 12),
                                      _errorText(),
                                    ],
                                  ],
                                )
                              : Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Expanded(child: _nameField()),
                                        const SizedBox(width: 16),
                                        Expanded(child: _sequenceField()),
                                      ],
                                    ),
                                    if (_error != null) ...[
                                      const SizedBox(height: 12),
                                      _errorText(),
                                    ],
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
                                : widget.processType == null
                                ? 'Create Process Type'
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
    );
  }

  Widget _nameField() => TextFormFieldWidget(
    controller: _nameController,
    labelText: 'Process name',
    hintText: 'e.g. Cutting',
    isRequired: true,
    maxLength: 255,
    validator: (value) =>
        value == null || value.trim().isEmpty ? 'Enter a process name.' : null,
  );

  Widget _sequenceField() => TextFormFieldWidget(
    controller: _sequenceController,
    labelText: 'Sequence order',
    hintText: '1',
    keyboardType: TextInputType.number,
    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
    isRequired: true,
    validator: (value) {
      final number = int.tryParse(value ?? '');
      return number == null || number < 1
          ? 'Enter a positive whole number.'
          : null;
    },
  );

  Widget _errorText() => Align(
    alignment: Alignment.centerLeft,
    child: Text(_error!, style: const TextStyle(color: Colors.red)),
  );

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;
    setState(() {
      _isSaving = true;
      _error = null;
    });
    final error = await widget.onSave(
      _nameController.text.trim(),
      int.parse(_sequenceController.text),
    );
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

class _ProcessTypesDataSource extends DataTableSource {
  _ProcessTypesDataSource({
    required this.processTypes,
    required this.isSaving,
    required this.onEdit,
    required this.onDelete,
  });

  final List<ProcessTypeModel> processTypes;
  final bool isSaving;
  final ValueChanged<ProcessTypeModel> onEdit;
  final ValueChanged<ProcessTypeModel> onDelete;

  @override
  DataRow? getRow(int index) {
    if (index < 0 || index >= processTypes.length) return null;
    final processType = processTypes[index];
    return DataRow.byIndex(
      index: index,
      cells: [
        DataCell(TableValue(label: '${processType.sequenceOrder}')),
        DataCell(TableValue(label: processType.name)),
        DataCell(
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                tooltip: 'Edit',
                onPressed: isSaving ? null : () => onEdit(processType),
                icon: const Icon(Icons.edit, size: 20),
              ),
              IconButton(
                tooltip: 'Delete',
                onPressed: isSaving ? null : () => onDelete(processType),
                icon: const Icon(Icons.delete_outline),
              ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => processTypes.length;

  @override
  int get selectedRowCount => 0;
}
