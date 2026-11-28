import 'package:board_cut/core/core.dart';
import 'package:board_cut/core/core_injection.dart';
import 'package:board_cut/features/warehouses/presentation/viewmodels/warehouses_view_model.dart';
import 'package:board_cut/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../data/models/warehouse_model.dart';

class WarehousesPage extends BaseStatefulScreen {
  const WarehousesPage({super.key});

  @override
  BaseState<WarehousesPage> createState() => _WarehousesPageState();
}

class _WarehousesPageState extends BaseState<WarehousesPage> {
  var _isSmallScreen = false;
  final _vm = sl<WarehousesViewModel>();
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
    _isSmallScreen =
        screenType == ScreenType.mobile || screenType == ScreenType.tablet;

    return ChangeNotifierProvider(
      create: (_) => _vm..fetchWarehouses(),

      child: Consumer<WarehousesViewModel>(
        builder: (context, vm, child) {
          if (vm.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }
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

  Widget _buildDesktopLayout(WarehousesViewModel vm) => Padding(
    padding: const EdgeInsets.all(16),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        RecordListToolbar(
          title: 'Warehouses',
          subtitle: 'Manage storage locations for your factories.',
          description: 'Review warehouse contacts, addresses, and status.',
          action: ButtonWidget.primary(
            onPressed: () => _openWarehouseForm(vm),
            label: 'Create Warehouse',
            icon: Icons.add,
            iconPosition: IconPosition.left,
          ),
          searchController: _searchController,
          searchHint: 'Search by warehouse, contact or address...',
          onSearchChanged: (value) =>
              setState(() => _searchQuery = value.trim().toLowerCase()),
          statusOptions: const [
            'All Status',
            'Active',
            'Inactive',
            'Under Maintenance',
          ],
          selectedStatus: _statusFilter,
          onStatusChanged: (value) => setState(() => _statusFilter = value),
          onClear: _clearFilters,
        ),
        const SizedBox(height: 16),
        SizedBox(
          width: double.maxFinite,
          child: _warehouses(vm, isSmallScreen: _isSmallScreen),
        ),
      ],
    ),
  );

  void _clearFilters() {
    _searchController.clear();
    setState(() {
      _searchQuery = '';
      _statusFilter = 'All Status';
    });
  }

  bool _matchesWarehouse(WarehouseModel warehouse) {
    final matchesText =
        _searchQuery.isEmpty ||
        [
          warehouse.name,
          warehouse.location ?? '',
          warehouse.contactName ?? '',
          warehouse.contactEmail ?? '',
          warehouse.contactPhone ?? '',
        ].any((value) => value.toLowerCase().contains(_searchQuery));
    final status = switch (warehouse.status) {
      WarehouseStatus.active => 'Active',
      WarehouseStatus.inActive => 'Inactive',
      WarehouseStatus.underMaintenance => 'Under Maintenance',
    };
    return matchesText &&
        (_statusFilter == 'All Status' || status == _statusFilter);
  }

  void _onView(WarehouseModel warehouse) {
    WarehouseDetailPageRoute(warehouse.id).push(context);
  }

  Future<void> _openWarehouseForm(
    WarehousesViewModel vm, [
    WarehouseModel? warehouse,
  ]) async {
    final saved = await CreateWarehousePageRoute(warehouse).push<bool>(context);
    if (saved == true && mounted) await vm.fetchWarehouses();
  }

  void _onEdit(WarehouseModel warehouse) {
    _openWarehouseForm(_vm, warehouse);
  }

  Widget _warehouses(WarehousesViewModel vm, {bool isSmallScreen = false}) {
    return DataTableWidget(
      sortColumnIndex: vm.sortBy == "name"
          ? 0
          : vm.sortBy == "email"
          ? 1
          : null,
      sortAscending: vm.isAscending,
      rowsPerPage: vm.rowsPerPage(isSmallScreen),
      columns: <DataColumn>[
        DataColumn(
          label: TableHeader(label: "NAME"),
          onSort: (columnIndex, ascending) {
            vm.sort((u) => u.name, "name");
          },
        ),
        if (!isSmallScreen)
          DataColumn(label: TableHeader(label: "CONTACT PERSON")),
        DataColumn(label: TableHeader(label: "PHONE")),
        if (!isSmallScreen) DataColumn(label: TableHeader(label: "EMAIL")),
        DataColumn(label: TableHeader(label: "ADDRESS")),
        DataColumn(label: TableHeader(label: "STATUS")),
        DataColumn(label: TableHeader(label: "ACTION")),
      ],
      dataSource: FilteredDataTableSource<WarehouseModel>(
        source: WarehousesDataSource(
          vm: vm,
          onEdit: _onEdit,
          onView: _onView,
          isSmallScreen: isSmallScreen,
        ),
        records: vm.warehouses,
        predicate: _matchesWarehouse,
      ),
    );
  }

  // Widget _mobileLayout() {
  //   return Column(
  //     children: [
  //       AppbarWidget(titleLabel: 'Warehouses'),
  //       Expanded(
  //         child: Padding(
  //           padding: const EdgeInsets.all(16.0),
  //           child: Column(
  //             children: [
  //               Row(
  //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                 children: [_dateFilter(), _statusFilter()],
  //               ),
  //               const SizedBox(height: 10),
  //               _createWarehouseButton(),
  //               const SizedBox(height: 10),
  //               Expanded(
  //                 child: ListView.builder(
  //                   itemCount: _vm.warehouses.length,
  //                   itemBuilder: (context, index) {
  //                     final warehouse = _vm.warehouses[index];
  //                     return _listItem(warehouse);
  //                   },
  //                 ),
  //               ),
  //             ],
  //           ),
  //         ),
  //       ),
  //     ],
  //   );
  // }

  // Widget _tabletLayout() {
  //   return Column(
  //     children: [
  //       AppbarWidget(titleLabel: 'Warehouses'),
  //       Expanded(
  //         child: Padding(
  //           padding: const EdgeInsets.all(16.0),
  //           child: Column(
  //             children: [
  //               Row(
  //                 spacing: 10,
  //                 mainAxisAlignment: MainAxisAlignment.end,
  //                 children: [
  //                   _dateFilter(),
  //                   _statusFilter(),
  //                   _createWarehouseButton(),
  //                 ],
  //               ),
  //               const SizedBox(height: 10),
  //               Expanded(
  //                 child: ListView.builder(
  //                   itemCount: _vm.warehouses.length,
  //                   itemBuilder: (context, index) {
  //                     final warehouse = _vm.warehouses[index];
  //                     return _listItem(warehouse);
  //                   },
  //                 ),
  //               ),
  //             ],
  //           ),
  //         ),
  //       ),
  //     ],
  //   );
  // }

  // Widget _listItem(WarehouseModel warehouse) {
  //   return WarehouseItem(
  //     name: warehouse.name,
  //     contactPerson: warehouse.contactName,
  //     phone: warehouse.contactPhone,
  //     email: warehouse.contactEmail ?? '',
  //     address: "${warehouse.addressLine1}, ${warehouse.addressLine2}",
  //     status: WarehouseStatus.active,
  //     onTap: () => _onView(warehouse),
  //     onEdit: () => _onEdit(warehouse),
  //   );
  // }
}

class WarehousesDataSource extends DataTableSource {
  final WarehousesViewModel vm;
  final Function(WarehouseModel warehouse)? onView;
  final Function(WarehouseModel warehouse)? onEdit;
  final bool isSmallScreen;

  WarehousesDataSource({
    required this.vm,
    this.onEdit,
    this.onView,
    this.isSmallScreen = false,
  });

  @override
  DataRow? getRow(int index) {
    if (index >= vm.warehouses.length) return null;

    final wh = vm.warehouses[index];

    return DataRow.byIndex(
      index: index,
      //color: WidgetStateProperty.all(AppColors.gray1),
      cells: [
        // DataCell(Text(e['orderId'])),
        DataCell(TableValue(label: wh.name)),
        if (!isSmallScreen) DataCell(TableValue(label: wh.contactName ?? '')),
        DataCell(TableValue(label: wh.contactPhone ?? '')),
        if (!isSmallScreen) DataCell(TableValue(label: wh.contactEmail ?? ' ')),
        DataCell(TableValue(label: wh.location ?? '')),
        DataCell(
          TableStatusValue(
            label: switch (wh.status) {
              WarehouseStatus.active => 'Active',
              WarehouseStatus.inActive => 'Inactive',
              WarehouseStatus.underMaintenance => 'Under Maintenance',
            },
            color: AppColors.statusColor(switch (wh.status) {
              WarehouseStatus.active => 'Active',
              WarehouseStatus.inActive => 'Inactive',
              WarehouseStatus.underMaintenance => 'Under Maintenance',
            }),
          ),
        ),
        DataCell(
          Row(
            children: [
              IconButton(
                icon: Icon(
                  Icons.open_in_new_outlined,
                  size: 20,
                  color: AppColors.textSecondary,
                ),
                onPressed: onView == null ? null : () => onView!(wh),
              ),
              IconButton(
                icon: Icon(
                  Icons.edit,
                  size: 20,
                  color: AppColors.textSecondary,
                ),
                onPressed: onEdit == null ? null : () => onEdit!(wh),
              ),
            ],
          ),
        ),
      ],
    );
  }

  void updateData(List<Map<String, dynamic>> newOrders) {
    // warehouses.clear();
    //warehouses.addAll(newOrders);
    notifyListeners(); // 🔥 refresh table
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => vm.warehouses.length;

  @override
  int get selectedRowCount => 0;
}
