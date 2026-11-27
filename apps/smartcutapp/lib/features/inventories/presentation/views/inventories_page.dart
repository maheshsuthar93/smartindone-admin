import 'dart:math' as math;

import 'package:board_cut/core/core.dart';
import 'package:board_cut/core/core_injection.dart';
import 'package:board_cut/features/inventories/data/models/inventory_model.dart';
import 'package:board_cut/features/inventories/presentation/viewmodels/inventories_view_model.dart';
import 'package:board_cut/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class InventoriesPage extends BaseStatefulScreen {
  const InventoriesPage({super.key});

  @override
  BaseState<InventoriesPage> createState() => _InventoriesPageState();
}

class _InventoriesPageState extends BaseState<InventoriesPage> {
  var _isSmallScreen = false;
  final _searchController = TextEditingController();
  String _searchQuery = '';
  String _statusFilter = 'All Status';

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget buildResponsive(BuildContext context, ScreenType screenType) {
    return ChangeNotifierProvider(
      create: (_) => sl<InventoriesViewModel>()
        ..fetchInventories()
        ..fetchInventoryAnalytics(),

      child: Consumer<InventoriesViewModel>(
        builder: (context, vm, child) {
          if (vm.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          _isSmallScreen =
              screenType == ScreenType.mobile ||
              screenType == ScreenType.tablet;

          return Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: switch (screenType) {
                    ScreenType.mobile => _buildDesktopLayout(vm),
                    ScreenType.tablet => _buildDesktopLayout(vm),
                    ScreenType.desktop => _buildDesktopLayout(vm),
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildDesktopLayout(InventoriesViewModel vm) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SizedBox(
        width: double.maxFinite,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            RecordListToolbar(
              title: 'Inventory',
              subtitle: 'Manage materials and hardware stock.',
              description:
                  'Review stock levels across factories and warehouses.',
              action: ButtonWidget.primary(
                onPressed: () => CreateInventoryPageRoute().push(context),
                label: 'Create Inventory',
                icon: Icons.add,
                iconPosition: IconPosition.left,
              ),
              searchController: _searchController,
              searchHint: 'Search by factory, warehouse or material...',
              onSearchChanged: (value) =>
                  setState(() => _searchQuery = value.trim().toLowerCase()),
              statusOptions: const [
                'All Status',
                'Available',
                'Reserved',
                'Out of Stock',
              ],
              selectedStatus: _statusFilter,
              onStatusChanged: (value) => setState(() => _statusFilter = value),
              onClear: _clearFilters,
            ),
            if (vm.error != null)
              Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: MaterialBanner(
                  content: Text(vm.error!),
                  leading: const Icon(Icons.error_outline),
                  actions: [
                    TextButton(
                      onPressed: vm.refreshInventory,
                      child: const Text('Retry'),
                    ),
                    TextButton(
                      onPressed: vm.clearError,
                      child: const Text('Dismiss'),
                    ),
                  ],
                ),
              ),
            const SizedBox(height: 16),
            _boxSections(vm),
            const SizedBox(height: 16),
            SizedBox(
              width: double.maxFinite,
              child: _inventories(vm, isSmallScreen: _isSmallScreen),
            ),
          ],
        ),
      ),
    );
  }

  Widget _boxSections(InventoriesViewModel vm) {
    return Row(
      spacing: 6,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: BoxSection(
            label: "Total Sheets",
            value: "${vm.totalSheets}".toString(),
            label2: '05 New, this month',
          ),
        ),
        Expanded(
          child: BoxSection(
            label: "Hardware Items",
            value: "${vm.totalHardwares}".toString(),
            label2: '2 shipped, this month',
          ),
        ),
        Expanded(
          child: BoxSection(
            label: "Consumables",
            value: "0",
            label2: '10 order, this month',
          ),
        ),
      ],
    );
  }

  void _clearFilters() {
    _searchController.clear();
    setState(() {
      _searchQuery = '';
      _statusFilter = 'All Status';
    });
  }

  bool _matchesInventory(InventoryModel inventory) {
    final materialName =
        inventory.material?.name ?? inventory.hardware?.name ?? '';
    final matchesText =
        _searchQuery.isEmpty ||
        [
          materialName,
          inventory.warehouse.name,
          inventory.warehouse.factory.name,
        ].any((value) => value.toLowerCase().contains(_searchQuery));
    final matchesStatus =
        _statusFilter == 'All Status' ||
        (_statusFilter == 'Available' && inventory.available > 0) ||
        (_statusFilter == 'Reserved' && inventory.reserved > 0) ||
        (_statusFilter == 'Out of Stock' && inventory.available <= 0);
    return matchesText && matchesStatus;
  }

  Widget _inventories(InventoriesViewModel vm, {bool isSmallScreen = false}) =>
      DataTableWidget(
        sortAscending: vm.isAscending,
        rowsPerPage: vm.rowsPerPage(isSmallScreen),
        columns: <DataColumn>[
          DataColumn(label: TableHeader(label: "FACTORY")),
          DataColumn(label: TableHeader(label: "WAREHOUSE")),
          DataColumn(
            label: TableHeader(label: "MATERIAL"),
            onSort: (columnIndex, ascending) {},
          ),
          DataColumn(
            label: TableHeader(label: "INVENTORY TYPE"),
            onSort: (columnIndex, ascending) {},
          ),
          if (!isSmallScreen) DataColumn(label: TableHeader(label: "ON HAND")),
          if (!isSmallScreen) DataColumn(label: TableHeader(label: "RESERVED")),
          DataColumn(label: TableHeader(label: "AVAILABLE")),
          DataColumn(label: TableHeader(label: "ACTIONS")),
        ],
        dataSource: FilteredDataTableSource<InventoryModel>(
          source: InventoryDataSource(
            vm: vm,
            onEdit: (inventory) => _onEdit(vm, inventory),
            onView: _onView,
            isSmallScreen: isSmallScreen,
            context: context,
          ),
          records: vm.inventories,
          predicate: _matchesInventory,
        ),
      );

  void _onView(InventoryModel inventory) {
    final itemName =
        inventory.material?.name ?? inventory.hardware?.name ?? 'Inventory';
    showDialog<void>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(itemName),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _detailLine(
              'Type',
              inventory.material != null ? 'Material' : 'Hardware',
            ),
            _detailLine('Factory', inventory.warehouse.factory.name),
            _detailLine('Warehouse', inventory.warehouse.name),
            _detailLine('On hand', inventory.onHand.toString()),
            _detailLine('Reserved', inventory.reserved.toString()),
            _detailLine('Available', inventory.available.toString()),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }

  Widget _detailLine(String label, String value) => Padding(
    padding: const EdgeInsets.symmetric(vertical: 4),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [Text(label), const SizedBox(width: 20), Text(value)],
    ),
  );

  Future<void> _onEdit(
    InventoriesViewModel vm,
    InventoryModel inventory,
  ) async {
    final saved = await showDialog<bool>(
      context: context,
      builder: (context) => _InventoryEditDialog(
        inventory: inventory,
        onSave: (target, notes) async {
          final success = await vm.setOnHand(inventory, target, notes: notes);
          return success ? null : vm.error ?? 'Unable to update inventory';
        },
      ),
    );
    if (saved != true || !mounted) return;

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Inventory updated successfully')),
    );
  }
}

class _InventoryEditDialog extends StatefulWidget {
  const _InventoryEditDialog({required this.inventory, required this.onSave});

  final InventoryModel inventory;
  final Future<String?> Function(int onHand, String? notes) onSave;

  String get itemName =>
      inventory.material?.name ?? inventory.hardware?.name ?? 'Inventory';
  int get onHand => inventory.onHand;
  int get reserved => inventory.reserved;
  int get available => inventory.available;
  String get itemId => inventory.materialId ?? inventory.hardwareId ?? '—';
  String get itemType => inventory.material != null ? 'Material' : 'Hardware';

  @override
  State<_InventoryEditDialog> createState() => _InventoryEditDialogState();
}

class _InventoryEditDialogState extends State<_InventoryEditDialog> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _quantityController;
  final _notesController = TextEditingController();
  String? _error;
  bool _isSaving = false;

  @override
  void initState() {
    super.initState();
    _quantityController = TextEditingController(text: '${widget.onHand}');
  }

  @override
  void dispose() {
    _quantityController.dispose();
    _notesController.dispose();
    super.dispose();
  }

  Future<void> _save() async {
    if (!(_formKey.currentState?.validate() ?? false)) return;
    final target = int.tryParse(_quantityController.text.trim());
    if (target == null) return;
    setState(() {
      _isSaving = true;
      _error = null;
    });
    final error = await widget.onSave(
      target,
      _notesController.text.trim().isEmpty
          ? null
          : _notesController.text.trim(),
    );
    if (!mounted) return;
    if (error == null) {
      Navigator.of(context).pop(true);
      return;
    }
    setState(() {
      _isSaving = false;
      _error = error;
    });
  }

  @override
  @override
  Widget build(BuildContext context) {
    final screenType = ResponsiveHelper.getScreenType(context);
    final isSmall = screenType != ScreenType.desktop;
    final screenSize = MediaQuery.sizeOf(context);
    final availableHeight =
        (screenSize.height - MediaQuery.viewInsetsOf(context).vertical - 32)
            .clamp(320.0, screenSize.height);
    final dialogHeight = math.min(
      ResponsiveHelper.determineDialogHeight(screenType),
      availableHeight,
    );
    return Dialog(
      backgroundColor: AppColors.transparent,
      insetPadding: EdgeInsets.all(isSmall ? 12 : 40),
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
            DialogHeaderWidget(title: 'Adjust ${widget.itemName}'),
            const SizedBox(height: 12),
            Expanded(
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            _inventoryInfoCard(),
                            const SizedBox(height: 14),
                            _twoFields(
                              isSmall,
                              _quantityField(),
                              _notesField(),
                            ),
                            if (_error != null) ...[
                              const SizedBox(height: 12),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  _error!,
                                  style: TextStyle(
                                    color: Theme.of(context).colorScheme.error,
                                  ),
                                ),
                              ),
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
                              : () => Navigator.of(context).pop(false),
                        ),
                        const SizedBox(width: 10),
                        ButtonWidget.primary(
                          label: _isSaving ? 'Saving...' : 'Save adjustment',
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
    );
  }

  Widget _inventoryInfoCard() => Container(
    width: double.infinity,
    margin: const EdgeInsets.only(bottom: 4),
    decoration: BoxDecoration(
      color: AppColors.backgroundColor,
      borderRadius: BorderRadius.circular(AppSize.borderRadius),
    ),
    child: Padding(
      padding: const EdgeInsets.all(12),
      child: Wrap(
        spacing: 24,
        runSpacing: 8,
        children: [
          ItemSectionWidget(label: 'Inventory ID', value: widget.inventory.id),
          ItemSectionWidget(
            label: '${widget.itemType} ID',
            value: widget.itemId,
          ),
          ItemSectionWidget(label: 'Item', value: widget.itemName),
          ItemSectionWidget(
            label: 'Factory',
            value: widget.inventory.warehouse.factory.name,
          ),
          ItemSectionWidget(
            label: 'Factory ID',
            value: widget.inventory.warehouse.factory.id,
          ),
          ItemSectionWidget(
            label: 'Warehouse',
            value: widget.inventory.warehouse.name,
          ),
          ItemSectionWidget(
            label: 'Warehouse ID',
            value: widget.inventory.warehouse.id,
          ),
          ItemSectionWidget(label: 'On hand', value: '${widget.onHand}'),
          ItemSectionWidget(
            label: 'Currently reserved',
            value: '${widget.reserved}',
          ),
          ItemSectionWidget(label: 'Available', value: '${widget.available}'),
        ],
      ),
    ),
  );

  Widget _twoFields(bool isSmall, Widget first, Widget second) => isSmall
      ? Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [first, const SizedBox(height: 14), second],
        )
      : Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(child: first),
            const SizedBox(width: 16),
            Expanded(child: second),
          ],
        );

  Widget _quantityField() => TextFormFieldWidget(
    controller: _quantityController,
    labelText: 'New on-hand quantity',
    hintText: 'Enter total on-hand quantity',
    keyboardType: TextInputType.number,
    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
    isRequired: true,
    validator: (value) {
      final target = int.tryParse(value?.trim() ?? '');
      if (target == null || target < 0) {
        return 'Enter a valid on-hand quantity.';
      }
      if (target < widget.reserved) {
        return 'Quantity cannot be below reserved stock.';
      }
      return null;
    },
  );

  Widget _notesField() => TextFormFieldWidget(
    controller: _notesController,
    labelText: 'Adjustment note',
    hintText: 'Optional note',
    maxLines: 2,
  );
}

class InventoryDataSource extends DataTableSource {
  final InventoriesViewModel vm;
  final Function(InventoryModel inventory)? onView;
  final Function(InventoryModel inventory)? onEdit;
  final Function(InventoryModel inventory)? onPrint;

  final bool isSmallScreen;
  final BuildContext context;

  InventoryDataSource({
    required this.vm,
    this.onEdit,
    this.onView,
    this.onPrint,
    this.isSmallScreen = false,
    required this.context,
  });

  String _materialName(InventoryModel inventory) {
    if (inventory.material?.name != null) {
      return inventory.material!.name;
    }
    return inventory.hardware!.name;
  }

  String _materialType(InventoryModel inventory) {
    if (inventory.material?.name != null) {
      return 'Sheet';
    }
    return 'Hardware';
  }

  @override
  DataRow? getRow(int index) {
    if (index >= vm.inventories.length) return null;

    final inventory = vm.inventories[index];
    final warehouse = inventory.warehouse;

    return DataRow.byIndex(
      index: index,
      // color: WidgetStateProperty.all(AppColors.gray1),
      cells: [
        DataCell(TableValue(label: warehouse.factory.name)),
        DataCell(TableValue(label: warehouse.name)),
        DataCell(TableValue(label: _materialName(inventory))),
        DataCell(TableValue(label: _materialType(inventory))),
        if (!isSmallScreen)
          DataCell(TableValue(label: inventory.onHand.toString())),
        if (!isSmallScreen)
          DataCell(TableValue(label: inventory.reserved.toString())),
        DataCell(TableValue(label: inventory.available.toString())),

        DataCell(
          Row(
            children: [
              IconButton(
                icon: Icon(
                  Icons.open_in_new_outlined,
                  size: 20,
                  color: AppColors.textSecondary,
                ),
                onPressed: onView == null ? null : () => onView!(inventory),
              ),
              IconButton(
                icon: Icon(
                  Icons.edit,
                  size: 20,
                  color: AppColors.textSecondary,
                ),
                onPressed: onEdit == null ? null : () => onEdit!(inventory),
              ),
              IconButton(
                icon: Icon(
                  Icons.print,
                  size: 20,
                  color: AppColors.textSecondary,
                ),
                onPressed: onPrint == null ? null : () => onPrint!(inventory),
              ),
            ],
          ),
        ),
      ],
    );
  }

  void updateData(List<Map<String, dynamic>> newOrders) {
    //inventory.clear();
    //inventory.addAll(newOrders);
    notifyListeners(); // 🔥 refresh table
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => vm.inventories.length;

  @override
  int get selectedRowCount => 0;
}
