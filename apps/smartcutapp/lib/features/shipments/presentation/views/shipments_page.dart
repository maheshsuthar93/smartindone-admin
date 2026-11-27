import 'package:board_cut/core/core.dart';
import 'package:board_cut/core/core_injection.dart';
import 'package:board_cut/features/shipments/data/models/model.dart';
import 'package:board_cut/features/shipments/presentation/viewmodels/shipments_view_model.dart';
import 'package:board_cut/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class ShipmentsPage extends BaseStatefulScreen {
  const ShipmentsPage({super.key});

  @override
  BaseState<ShipmentsPage> createState() => _ShipmentsPageState();
}

class _ShipmentsPageState extends BaseState<ShipmentsPage> {
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
      create: (_) => sl<ShipmentsViewModel>()..fetchShipments(),

      child: Consumer<ShipmentsViewModel>(
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

  Widget _buildDesktopLayout(ShipmentsViewModel vm) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SizedBox(
        width: double.maxFinite,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            RecordListToolbar(
              title: 'Shipments',
              subtitle: 'Manage deliveries for your customer orders.',
              description: 'Track dispatch dates, delivery schedules, and shipment status.',
              action: ButtonWidget.primary(
                onPressed: () => _createShipment(vm),
                label: 'Create Shipment',
                icon: Icons.add,
                iconPosition: IconPosition.left,
              ),
              searchController: _searchController,
              searchHint: 'Search by customer, project or shipment...',
              onSearchChanged: (value) =>
                  setState(() => _searchQuery = value.trim().toLowerCase()),
              statusOptions: const [
                'All Status',
                'Pending',
                'Dispatched',
                'In Transit',
                'Delivered',
                'Cancelled',
                'Unknown',
              ],
              selectedStatus: _statusFilter,
              onStatusChanged: (value) => setState(() => _statusFilter = value),
              onClear: _clearFilters,
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.maxFinite,
              child: _shipments(vm, isSmallScreen: _isSmallScreen),
            ),
          ],
        ),
      ),
    );
  }

  void _clearFilters() {
    _searchController.clear();
    setState(() {
      _searchQuery = '';
      _statusFilter = 'All Status';
    });
  }

  bool _matchesShipment(ShipmentModel shipment) {
    final matchesText =
        _searchQuery.isEmpty ||
        [
          shipment.shipmentNo,
          shipment.order.customer.name,
          shipment.order.project.name,
        ].any((value) => value.toLowerCase().contains(_searchQuery));
    final status = shipment.status.label;
    return matchesText &&
        (_statusFilter == 'All Status' || status == _statusFilter);
  }

  Widget _shipments(
    ShipmentsViewModel vm, {
    bool isSmallScreen = false,
  }) => DataTableWidget(
    sortAscending: vm.isAscending,
    rowsPerPage: vm.rowsPerPage(isSmallScreen),
    columns: <DataColumn>[
      DataColumn(
        label: TableHeader(label: "CUSTOMER"),
        onSort: (columnIndex, ascending) {
          //_sort<String>((data) => data['customer'], columnIndex, ascending);
        },
      ),
      DataColumn(
        label: TableHeader(label: "PROJECT"),
        onSort: (columnIndex, ascending) {
          //_sort<String>((data) => data['customer'], columnIndex, ascending);
        },
      ),
      DataColumn(label: TableHeader(label: "DISPATCH DATE")),
      if (!isSmallScreen)
        DataColumn(label: TableHeader(label: "EXPECTED DELIVERY DATE")),
      if (!isSmallScreen)
        DataColumn(label: TableHeader(label: "ACTUAL DELIVERY DATE")),
      DataColumn(label: TableHeader(label: "STATUS")),
      DataColumn(label: TableHeader(label: "ACTIONS")),
    ],
    dataSource: FilteredDataTableSource<ShipmentModel>(
      source: ShipmentsDataSource(
        vm: vm,
        onEdit: (shipment) => _onEdit(shipment, vm),
        onView: _onView,
        isSmallScreen: isSmallScreen,
      ),
      records: vm.shipments,
      predicate: _matchesShipment,
    ),
  );

  void _onView(ShipmentModel shipment) {
    ShipmentDetailPageRoute(shipment.id).push(context);
  }

  Future<void> _createShipment(ShipmentsViewModel vm) async {
    final created = await CreateShipmentPageRoute().push<bool>(context);
    if (created == true && mounted) {
      await vm.fetchShipments(page: 1);
    }
  }

  Future<void> _onEdit(ShipmentModel shipment, ShipmentsViewModel vm) async {
    final updated = await context.push<bool>(
      '/shipments/create-shipment?shipmentId=${Uri.encodeQueryComponent(shipment.id)}',
    );
    if (updated == true && mounted) {
      await vm.fetchShipments(page: 1);
    }
  }
}

class ShipmentsDataSource extends DataTableSource {
  final ShipmentsViewModel vm;
  final Function(ShipmentModel shipment)? onView;
  final Function(ShipmentModel shipment)? onEdit;

  final bool isSmallScreen;

  ShipmentsDataSource({
    required this.vm,
    this.onEdit,
    this.onView,
    this.isSmallScreen = false,
  });

  @override
  DataRow? getRow(int index) {
    if (index >= vm.shipments.length) return null;

    final shipment = vm.shipments[index];

    final customer = shipment.order.customer;
    final project = shipment.order.project;

    return DataRow.byIndex(
      index: index,
      //color: WidgetStateProperty.all(AppColors.gray1),
      cells: [
        DataCell(TableValue(label: customer.name)),
        DataCell(TableValue(label: project.name)),
        DataCell(TableValue(label: shipment.dispatchDate?.toDdMMMyyyy() ?? '')),
        if (!isSmallScreen)
          DataCell(
            TableValue(label: shipment.deliveryDate?.toDdMMMyyyy() ?? ''),
          ),
        if (!isSmallScreen)
          DataCell(
            TableValue(label: shipment.actualDeliveryDate?.toDdMMMyyyy() ?? ''),
          ),
        DataCell(
          TableStatusValue(
            label: shipment.status.label,
            color: AppColors.statusColor(shipment.status.label),
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
                onPressed: onView == null ? null : () => onView!(shipment),
              ),
              IconButton(
                icon: Icon(
                  Icons.edit,
                  size: 20,
                  color: AppColors.textSecondary,
                ),
                onPressed: onEdit == null ? null : () => onEdit!(shipment),
              ),
            ],
          ),
        ),
      ],
    );
  }

  void updateData(List<Map<String, dynamic>> newOrders) {
    // shipments.clear();
    //shipments.addAll(newOrders);
    notifyListeners(); // 🔥 refresh table
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => vm.shipments.length;

  @override
  int get selectedRowCount => 0;
}
