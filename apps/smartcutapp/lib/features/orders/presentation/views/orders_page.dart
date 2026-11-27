import 'package:board_cut/core/core.dart';
import 'package:board_cut/core/core_injection.dart';
import 'package:board_cut/features/orders/data/models/order_model.dart';
import 'package:board_cut/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../viewmodels/orders_view_model.dart';

class OrdersPage extends BaseStatefulScreen {
  const OrdersPage({super.key});

  @override
  BaseState<OrdersPage> createState() => _OrdersPageState();
}

class _OrdersPageState extends BaseState<OrdersPage> {
  var _isSmallScreen = false;
  final _searchController = TextEditingController();
  String _searchQuery = '';
  String _statusFilter = 'All Status';

  OrdersViewModel get _vm => sl<OrdersViewModel>();

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
      create: (_) => _vm
        ..fetchOrders()
        ..fetchOrderAnalytics(),

      child: Consumer<OrdersViewModel>(
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

  Widget _buildDesktopLayout(OrdersViewModel vm) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SizedBox(
        width: double.maxFinite,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            RecordListToolbar(
              title: 'Orders',
              subtitle: 'Manage orders across your Cut Optimizer workspace.',
              description:
                  'Track customers, projects, production, and delivery status.',
              action: ButtonWidget.primary(
                onPressed: () => _createOrder(context, vm),
                label: 'Create Order',
                icon: Icons.add,
                iconPosition: IconPosition.left,
              ),
              searchController: _searchController,
              searchHint: 'Search by order, customer or project...',
              onSearchChanged: (value) =>
                  setState(() => _searchQuery = value.trim().toLowerCase()),
              statusOptions: const [
                'All Status',
                'Draft',
                'Approved',
                'In Production',
                'Completed',
                'Shipped',
                'Delivered',
                'Cancelled',
              ],
              selectedStatus: _statusFilter,
              onStatusChanged: (value) => setState(() => _statusFilter = value),
              onClear: _clearFilters,
            ),
            const SizedBox(height: 16),
            _boxSections(vm),
            const SizedBox(height: 16),
            SizedBox(
              width: double.maxFinite,
              child: _orders(vm, isSmallScreen: _isSmallScreen),
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

  bool _matchesOrder(OrderModel order) {
    final text = _searchQuery;
    final matchesText =
        text.isEmpty ||
        [
          order.orderNumber.toString(),
          order.customer.name,
          order.project.name,
          order.factory?.name ?? '',
        ].any((value) => value.toLowerCase().contains(text));
    final status = order.status.label;
    return matchesText &&
        (_statusFilter == 'All Status' || status == _statusFilter);
  }

  Future<void> _createOrder(
    BuildContext context,
    OrdersViewModel viewModel,
  ) async {
    final created = await CreateOrderPageRoute().push<bool>(context);
    if (created == true && mounted) {
      await Future.wait([
        viewModel.fetchOrders(page: 1),
        viewModel.fetchOrderAnalytics(),
      ]);
    }
  }

  Widget _boxSections(OrdersViewModel vm) {
    return Row(
      spacing: 6,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: BoxSection(
            label: "Total Orders",
            value: "${vm.totalOrders}".toString(),
            label2: '05 New, this month',
          ),
        ),
        Expanded(
          child: BoxSection(
            label: "In Progress",
            value: "${vm.totalActiveOrder}".toString(),
            label2: '2 shipped, this month',
          ),
        ),
        Expanded(
          child: BoxSection(
            label: "Completed",
            value: "${vm.totalCompleteOrder}".toString(),
            label2: '10 order, this month',
          ),
        ),
      ],
    );
  }

  void _onView(OrderModel order) {
    OrderDetailPageRoute(orderId: order.id).push(context);
  }

  Future<void> _onEdit(OrderModel order) async {
    final updated = await context.push<bool>(
      CreateOrderPageRoute().location,
      extra: order,
    );
    if (updated == true && mounted) {
      await context.read<OrdersViewModel>().fetchOrders(page: 1);
    }
  }

  Widget _orders(OrdersViewModel vm, {bool isSmallScreen = false}) {
    return DataTableWidget(
      sortColumnIndex: vm.sortBy == "name"
          ? 0
          : vm.sortBy == "email"
          ? 1
          : null,
      sortAscending: vm.isAscending,
      rowsPerPage: vm.rowsPerPage,
      columns: <DataColumn>[
        //DataColumn(label: _tableHeader("Order ID")),
        DataColumn(
          label: TableHeader(label: "PROJECT"),
          onSort: (columnIndex, ascending) {
            //vm.sort((u) => u.name, "name");
          },
        ),
        DataColumn(label: TableHeader(label: "FACTORY")),
        DataColumn(label: TableHeader(label: "STATUS")),
        if (!isSmallScreen) DataColumn(label: TableHeader(label: "ORDER DATE")),
        //DataColumn(label: TableHeader(label: "COMPLETION")),
        DataColumn(label: TableHeader(label: "ACTION")),
      ],
      dataSource: FilteredDataTableSource<OrderModel>(
        source: OrderDataSource(
          vm: vm,
          onView: _onView,
          onEdit: _onEdit,
          isSmallScreen: isSmallScreen,
          context: context,
        ),
        records: vm.orders,
        predicate: _matchesOrder,
      ),
    );
  }
}

class OrderDataSource extends DataTableSource {
  final OrdersViewModel vm;
  final Function(OrderModel order)? onView;
  final Function(OrderModel order)? onEdit;
  final bool isSmallScreen;
  final BuildContext context;

  OrderDataSource({
    required this.vm,
    this.onEdit,
    this.onView,
    this.isSmallScreen = false,
    required this.context,
  });

  @override
  DataRow? getRow(int index) {
    if (index >= vm.orders.length) return null;

    final order = vm.orders[index];

    return DataRow.byIndex(
      index: index,
      //color: WidgetStateProperty.all(AppColors.gray1),
      cells: [
        // DataCell(Text(e['orderId'])),
        DataCell(
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                order.customer.name,
                style: AppTextStyle.labelSmall
                    .responsive(context)
                    .semiBold
                    .copyWith(color: AppColors.textPrimary),
              ),
              Text(
                order.project.name,
                style: AppTextStyle.labelSmall
                    .responsive(context)
                    .regular
                    .copyWith(color: AppColors.textSecondary),
              ),
            ],
          ),
        ),
        DataCell(TableValue(label: order.factory?.name ?? "-")),
        DataCell(
          TableStatusValue(
            label: order.status.label,
            color: AppColors.statusColor(order.status.label),
          ),
        ),
        if (!isSmallScreen)
          DataCell(TableValue(label: order.createdAt.toDdMMMyyyy())),
        //DataCell(TableValue(label: "50%")),
        DataCell(
          Row(
            children: [
              if (vm.updatingOrderId == order.id)
                const SizedBox.square(
                  dimension: 18,
                  child: CircularProgressIndicator(strokeWidth: 2),
                )
              else ...[
                if (order.status == OrderStatus.draft)
                  IconButton(
                    tooltip: 'Approve order',
                    icon: const Icon(
                      Icons.check_circle_outline,
                      size: 20,
                      color: Colors.green,
                    ),
                    onPressed: () => _confirmStatusChange(
                      order,
                      status: 'APPROVED',
                      action: 'Approve',
                    ),
                  ),
                if (order.status == OrderStatus.draft ||
                    order.status == OrderStatus.approved)
                  IconButton(
                    tooltip: 'Cancel order',
                    icon: const Icon(
                      Icons.cancel_outlined,
                      size: 20,
                      color: Colors.red,
                    ),
                    onPressed: () => _confirmStatusChange(
                      order,
                      status: 'CANCELLED',
                      action: 'Cancel',
                    ),
                  ),
              ],
              IconButton(
                icon: Icon(
                  Icons.open_in_new_outlined,
                  size: 20,
                  color: AppColors.textSecondary,
                ),
                onPressed: onView == null ? null : () => onView!(order),
              ),
              IconButton(
                icon: Icon(
                  Icons.edit,
                  size: 20,
                  color: AppColors.textSecondary,
                ),
                onPressed: onEdit == null ? null : () => onEdit!(order),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Future<void> _confirmStatusChange(
    OrderModel order, {
    required String status,
    required String action,
  }) async {
    final confirmed =
        await showDialog<bool>(
          context: context,
          builder: (dialogContext) => AlertDialog(
            title: Text('$action order?'),
            content: Text(
              action == 'Cancel'
                  ? 'Cancel order #${order.orderNumber}? This cannot be undone.'
                  : 'Approve order #${order.orderNumber}?',
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(dialogContext, false),
                child: const Text('Back'),
              ),
              FilledButton(
                onPressed: () => Navigator.pop(dialogContext, true),
                child: Text(action),
              ),
            ],
          ),
        ) ??
        false;

    if (!confirmed || !context.mounted) return;

    final message = await vm.updateOrderStatus(
      orderId: order.id,
      status: status,
    );
    if (!context.mounted) return;

    final resultMessage = status == 'APPROVED'
        ? 'Order approved successfully'
        : 'Order cancelled successfully';
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message ?? resultMessage)));
  }

  void updateData(List<Map<String, dynamic>> newOrders) {
    //orders.clear();
    //orders.addAll(newOrders);
    notifyListeners(); // 🔥 refresh table
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => vm.orders.length;

  @override
  int get selectedRowCount => 0;
}
