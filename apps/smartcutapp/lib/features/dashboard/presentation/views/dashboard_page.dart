import 'package:board_cut/core/core.dart';
import 'package:board_cut/core/core_injection.dart';
import 'package:board_cut/features/dashboard/data/models/dashboard_order_model.dart';
import 'package:board_cut/features/dashboard/presentation/viewmodels/dashboard_view_model.dart';
import 'package:board_cut/shared/shared.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class DashboardPage extends BaseStatefulScreen {
  const DashboardPage({super.key});

  @override
  BaseState<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends BaseState<DashboardPage> {
  int? _sortColumnIndex;
  final bool _sortAscending = true;

  @override
  Widget buildResponsive(BuildContext context, ScreenType screenType) {
    return ChangeNotifierProvider(
      create: (_) => sl<DashboardViewModel>()
        ..fetchDashboardAnalytics()
        ..fetchOrders(),

      child: Consumer<DashboardViewModel>(
        builder: (context, vm, child) {
          if (vm.isLoading &&
              vm.isAnalyticsLoading &&
              vm.orders.isEmpty &&
              vm.analytics == null) {
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

  Widget _buildDesktopLayout(DashboardViewModel vm) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Dashboard',
                      style: AppTextStyle.titleSmall.bold.copyWith(
                        color: AppColors.textPrimary,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'A current view of orders, inventory, and shipments.',
                      style: AppTextStyle.bodySmall.regular.copyWith(
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ],
                ),
              ),
              IconButton(
                tooltip: 'Refresh dashboard',
                onPressed: () => vm.refresh(),
                icon: const Icon(Icons.refresh),
              ),
            ],
          ),
          if (vm.error != null) ...[
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: Text(
                    vm.error!,
                    style: const TextStyle(color: AppColors.errorColor),
                  ),
                ),
                TextButton(
                  onPressed: () => vm.refresh(),
                  child: const Text('Retry'),
                ),
              ],
            ),
          ],
          const SizedBox(height: 14),
          _buildMetricCards(vm),
          const SizedBox(height: 16),
          _analyticsOverview(vm),
          const SizedBox(height: 18),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Recent Orders', style: AppTextStyle.bodyMedium.bold),
              ButtonWidget.primary(
                onPressed: () => OrdersPageRoute().go(context),
                label: 'View All',
              ),
            ],
          ),
          const SizedBox(height: 8),
          SizedBox(width: double.maxFinite, child: _orders(vm)),
        ],
      ),
    );
  }

  Widget _analyticsOverview(DashboardViewModel vm) => LayoutBuilder(
    builder: (context, constraints) {
      final orderCard = _orderStatusCard(vm);
      final shipmentCard = _shipmentStatusCard(vm);
      if (constraints.maxWidth >= 1000) {
        return IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(flex: 5, child: _newOrdersChart(vm, height: 300)),
              const SizedBox(width: 12),
              Expanded(flex: 3, child: orderCard),
              const SizedBox(width: 12),
              Expanded(flex: 3, child: shipmentCard),
            ],
          ),
        );
      }

      return Column(
        children: [
          _newOrdersChart(vm),
          const SizedBox(height: 12),
          if (constraints.maxWidth < 760) ...[
            orderCard,
            const SizedBox(height: 14),
            shipmentCard,
          ] else
            IntrinsicHeight(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(child: orderCard),
                  const SizedBox(width: 14),
                  Expanded(child: shipmentCard),
                ],
              ),
            ),
        ],
      );
    },
  );

  Widget _buildMetricCards(DashboardViewModel vm) {
    final analytics = vm.analytics;
    final metrics = <_DashboardMetric>[
      _DashboardMetric(
        label: 'Total Orders',
        value: analytics?.totalOrders ?? 0,
        detail: '${analytics?.ordersThisMonth ?? 0} created this month',
        icon: Icons.receipt_long_outlined,
        color: AppColors.primaryColor,
      ),
      _DashboardMetric(
        label: 'In Production',
        value: analytics?.activeOrders ?? 0,
        detail: 'Orders currently being produced',
        icon: Icons.precision_manufacturing_outlined,
        color: AppColors.infoColor,
      ),
      _DashboardMetric(
        label: 'Draft Orders',
        value: analytics?.draftOrders ?? 0,
        detail: 'Orders awaiting approval',
        icon: Icons.edit_note_outlined,
        color: AppColors.pendingColor,
      ),
      _DashboardMetric(
        label: 'Completed Orders',
        value: analytics?.completedOrders ?? 0,
        detail: analytics == null || analytics.totalOrders == 0
            ? 'No orders recorded yet'
            : '${(analytics.completedOrders * 100 / analytics.totalOrders).round()}% of all orders',
        icon: Icons.task_alt_outlined,
        color: AppColors.successColor,
      ),
      _DashboardMetric(
        label: 'Customers',
        value: analytics?.totalCustomers ?? 0,
        detail: 'Customers in this company',
        icon: Icons.people_outline,
        color: AppColors.infoColor,
      ),
      _DashboardMetric(
        label: 'Total Projects',
        value: analytics?.totalProjects ?? 0,
        detail: 'All-time projects',
        icon: Icons.folder_open_outlined,
        color: AppColors.primaryColor,
      ),
      _DashboardMetric(
        label: 'Active Projects',
        value: analytics?.activeProjects ?? 0,
        detail: 'Planning or in progress',
        icon: Icons.work_outline,
        color: AppColors.infoColor,
      ),
      _DashboardMetric(
        label: 'Available Sheets',
        value: analytics?.availableSheets ?? 0,
        detail: 'Full sheets ready for use',
        icon: Icons.crop_landscape_outlined,
        color: AppColors.primaryColor,
      ),
      _DashboardMetric(
        label: 'Available Offcuts',
        value: analytics?.availableOffcuts ?? 0,
        detail: 'Reusable offcuts in stock',
        icon: Icons.content_cut_outlined,
        color: AppColors.warningColor,
      ),
      _DashboardMetric(
        label: 'Pending Shipments',
        value: analytics?.pendingShipments ?? 0,
        detail: 'Awaiting dispatch',
        icon: Icons.inventory_2_outlined,
        color: AppColors.warningColor,
      ),
      _DashboardMetric(
        label: 'In Transit',
        value: analytics?.inTransitShipments ?? 0,
        detail: 'Shipments on the way',
        icon: Icons.local_shipping_outlined,
        color: AppColors.infoColor,
      ),
      _DashboardMetric(
        label: 'Delivered This Month',
        value: analytics?.deliveriesThisMonth ?? 0,
        detail: 'Shipments delivered this month',
        icon: Icons.mark_email_read_outlined,
        color: AppColors.successColor,
      ),
    ];

    return LayoutBuilder(
      builder: (context, constraints) {
        final columns = constraints.maxWidth >= 1400
            ? 6
            : constraints.maxWidth >= 1150
            ? 5
            : constraints.maxWidth >= 900
            ? 4
            : constraints.maxWidth >= 760
            ? 3
            : constraints.maxWidth >= 420
            ? 2
            : 1;
        const spacing = 8.0;
        final cardWidth =
            (constraints.maxWidth - spacing * (columns - 1)) / columns;
        return Wrap(
          spacing: spacing,
          runSpacing: spacing,
          children: [
            for (final metric in metrics)
              SizedBox(
                width: cardWidth,
                child: _metricCard(metric, compact: columns >= 4),
              ),
          ],
        );
      },
    );
  }

  Widget _metricCard(_DashboardMetric metric, {required bool compact}) => Card(
    color: AppColors.surfaceColor,
    margin: EdgeInsets.zero,
    elevation: 0,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(14),
      side: BorderSide(color: metric.color.withValues(alpha: .14)),
    ),
    child: Padding(
      padding: EdgeInsets.all(compact ? 11 : 14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: compact ? 32 : 36,
                height: compact ? 32 : 36,
                decoration: BoxDecoration(
                  color: metric.color.withValues(alpha: .10),
                  borderRadius: BorderRadius.circular(11),
                ),
                child: Icon(
                  metric.icon,
                  color: metric.color,
                  size: compact ? 18 : 20,
                ),
              ),
              const Spacer(),
              Text(
                '${metric.value}',
                style: AppTextStyle.titleSmall.bold.copyWith(
                  color: AppColors.textPrimary,
                ),
              ),
            ],
          ),
          SizedBox(height: compact ? 8 : 12),
          Text(
            metric.label,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: AppTextStyle.labelMedium.semiBold.copyWith(
              color: AppColors.textPrimary,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            metric.detail,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: AppTextStyle.labelSmall.regular.copyWith(
              color: AppColors.textMuted,
            ),
          ),
        ],
      ),
    ),
  );

  Widget _newOrdersChart(DashboardViewModel vm, {double height = 195}) {
    final ordersByDay = <DateTime, int>{};
    for (final order in vm.orders) {
      final date = DateTime(
        order.createdAt.year,
        order.createdAt.month,
        order.createdAt.day,
      );
      ordersByDay.update(date, (count) => count + 1, ifAbsent: () => 1);
    }
    final days = ordersByDay.keys.toList()..sort();
    final maxCount = days.fold<int>(
      0,
      (max, day) => ordersByDay[day]! > max ? ordersByDay[day]! : max,
    );

    return Card(
      color: AppColors.surfaceColor,
      margin: EdgeInsets.zero,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14),
        side: BorderSide(color: AppColors.dividerColor),
      ),
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('New Orders', style: AppTextStyle.labelLarge.bold),
            const SizedBox(height: 4),
            Text(
              'Creation dates across the latest ${vm.orders.length} orders',
              style: AppTextStyle.labelSmall.regular.copyWith(
                color: AppColors.textSecondary,
              ),
            ),
            const SizedBox(height: 10),
            if (days.isEmpty)
              SizedBox(
                height: height,
                child: Center(
                  child: Text(
                    'No orders to chart yet',
                    style: AppTextStyle.bodySmall.regular.copyWith(
                      color: AppColors.textMuted,
                    ),
                  ),
                ),
              )
            else
              SizedBox(
                height: height,
                child: BarChart(
                  BarChartData(
                    maxY: (maxCount + 1).toDouble(),
                    minY: 0,
                    alignment: BarChartAlignment.spaceAround,
                    gridData: FlGridData(
                      drawVerticalLine: false,
                      getDrawingHorizontalLine: (_) => FlLine(
                        color: AppColors.dividerColor.withValues(alpha: .55),
                        strokeWidth: 1,
                      ),
                    ),
                    borderData: FlBorderData(show: false),
                    barTouchData: BarTouchData(
                      touchTooltipData: BarTouchTooltipData(
                        getTooltipItem: (group, groupIndex, rod, rodIndex) =>
                            BarTooltipItem(
                              '${DateFormat('d MMM').format(days[group.x])}: ${rod.toY.toInt()} orders',
                              const TextStyle(color: Colors.white),
                            ),
                      ),
                    ),
                    titlesData: FlTitlesData(
                      topTitles: const AxisTitles(
                        sideTitles: SideTitles(showTitles: false),
                      ),
                      rightTitles: const AxisTitles(
                        sideTitles: SideTitles(showTitles: false),
                      ),
                      leftTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          reservedSize: 32,
                          interval: 1,
                          getTitlesWidget: (value, _) => Text(
                            value.toInt().toString(),
                            style: AppTextStyle.labelSmall.regular.copyWith(
                              color: AppColors.textMuted,
                            ),
                          ),
                        ),
                      ),
                      bottomTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          reservedSize: 30,
                          interval: days.length > 7 ? 2 : 1,
                          getTitlesWidget: (value, _) {
                            final index = value.toInt();
                            if (index < 0 || index >= days.length) {
                              return const SizedBox.shrink();
                            }
                            return Padding(
                              padding: const EdgeInsets.only(top: 8),
                              child: Text(
                                DateFormat('d MMM').format(days[index]),
                                style: AppTextStyle.labelSmall.regular.copyWith(
                                  color: AppColors.textMuted,
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    barGroups: [
                      for (var index = 0; index < days.length; index++)
                        BarChartGroupData(
                          x: index,
                          barRods: [
                            BarChartRodData(
                              toY: ordersByDay[days[index]]!.toDouble(),
                              color: AppColors.primaryColor,
                              width: days.length > 8 ? 14 : 24,
                              borderRadius: const BorderRadius.vertical(
                                top: Radius.circular(5),
                              ),
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

  Widget _orderStatusCard(DashboardViewModel vm) {
    final data = vm.analytics;
    final total = data?.totalOrders ?? 0;
    return _statusBreakdownCard(
      title: 'Order Pipeline',
      total: total,
      rows: [
        _StatusMetric('Draft', data?.draftOrders ?? 0, AppColors.pendingColor),
        _StatusMetric(
          'Approved',
          data?.approvedOrders ?? 0,
          AppColors.infoColor,
        ),
        _StatusMetric(
          'In Production',
          data?.activeOrders ?? 0,
          AppColors.primaryColor,
        ),
        _StatusMetric(
          'Completed',
          data?.completedOrders ?? 0,
          AppColors.successColor,
        ),
        _StatusMetric(
          'Shipped',
          data?.shippedOrders ?? 0,
          AppColors.warningColor,
        ),
        _StatusMetric(
          'Delivered',
          data?.deliveredOrders ?? 0,
          AppColors.successColor,
        ),
        _StatusMetric(
          'Cancelled',
          data?.cancelledOrders ?? 0,
          AppColors.errorColor,
        ),
      ],
    );
  }

  Widget _shipmentStatusCard(DashboardViewModel vm) {
    final data = vm.analytics;
    final rows = [
      _StatusMetric(
        'Pending',
        data?.pendingShipments ?? 0,
        AppColors.pendingColor,
      ),
      _StatusMetric(
        'Dispatched',
        data?.dispatchedShipments ?? 0,
        AppColors.infoColor,
      ),
      _StatusMetric(
        'In Transit',
        data?.inTransitShipments ?? 0,
        AppColors.primaryColor,
      ),
      _StatusMetric(
        'Delivered',
        data?.deliveredShipments ?? 0,
        AppColors.successColor,
      ),
      _StatusMetric(
        'Cancelled',
        data?.cancelledShipments ?? 0,
        AppColors.errorColor,
      ),
    ];
    final total = rows.fold<int>(0, (sum, row) => sum + row.value);
    return _statusBreakdownCard(
      title: 'Shipment Pipeline',
      total: total,
      rows: rows,
    );
  }

  Widget _statusBreakdownCard({
    required String title,
    required int total,
    required List<_StatusMetric> rows,
  }) => Card(
    color: AppColors.surfaceColor,
    margin: EdgeInsets.zero,
    elevation: 0,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(14),
      side: BorderSide(color: AppColors.dividerColor),
    ),
    child: Padding(
      padding: const EdgeInsets.all(14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: AppTextStyle.labelLarge.bold.copyWith(
                  color: AppColors.textPrimary,
                ),
              ),
              Text(
                '$total total',
                style: AppTextStyle.labelSmall.regular.copyWith(
                  color: AppColors.textSecondary,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          for (final row in rows) ...[
            Row(
              children: [
                Expanded(
                  child: Text(
                    row.label,
                    style: AppTextStyle.labelSmall.regular.copyWith(
                      color: AppColors.textSecondary,
                    ),
                  ),
                ),
                Text(
                  '${row.value}',
                  style: AppTextStyle.labelSmall.semiBold.copyWith(
                    color: AppColors.textPrimary,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 4),
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: LinearProgressIndicator(
                value: total == 0 ? 0 : row.value / total,
                minHeight: 6,
                backgroundColor: AppColors.backgroundColor,
                color: row.color,
              ),
            ),
            const SizedBox(height: 8),
          ],
        ],
      ),
    ),
  );

  void _onView(DashboardOrderModel order) {
    OrderDetailPageRoute(orderId: order.id).push(context);
  }

  Widget _orders(DashboardViewModel vm) {
    return DataTableWidget(
      sortColumnIndex: _sortColumnIndex,
      sortAscending: _sortAscending,
      rowsPerPage: 5,
      columns: <DataColumn>[
        DataColumn(
          label: TableHeader(label: "CUSTOMER / PROJECT"),
          // onSort: (columnIndex, ascending) =>
          //     _sort<String>((data) => data['customer'], columnIndex, ascending),
        ),
        DataColumn(label: TableHeader(label: "FACTORY")),
        DataColumn(label: TableHeader(label: "STATUS")),
        DataColumn(label: TableHeader(label: "ORDER DATE")),
        // DataColumn(label: TableHeader(label: "COMPLETION")),
        DataColumn(label: TableHeader(label: "ACTION")),
      ],
      dataSource: RecentOrdersDataSource(
        vm: vm,
        onView: _onView,
        context: context,
      ),
    );
  }
}

class _DashboardMetric {
  const _DashboardMetric({
    required this.label,
    required this.value,
    required this.detail,
    required this.icon,
    required this.color,
  });

  final String label;
  final int value;
  final String detail;
  final IconData icon;
  final Color color;
}

class _StatusMetric {
  const _StatusMetric(this.label, this.value, this.color);

  final String label;
  final int value;
  final Color color;
}

class RecentOrdersDataSource extends DataTableSource {
  final DashboardViewModel vm;
  final Function(DashboardOrderModel order)? onView;
  final BuildContext context;

  RecentOrdersDataSource({
    required this.vm,
    this.onView,
    required this.context,
  });

  @override
  DataRow? getRow(int index) {
    if (index >= vm.orders.length) return null;

    final order = vm.orders[index];

    return DataRow.byIndex(
      index: index,
      cells: [
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
        DataCell(TableValue(label: order.createdAt.toDdMMMyyyy())),
        // DataCell(TableValue(label: "50%")),
        DataCell(
          Row(
            children: [
              IconButton(
                icon: Icon(
                  Icons.open_in_new_outlined,
                  size: 20,
                  color: AppColors.textSecondary,
                ),
                onPressed: onView == null ? null : () => onView!(order),
              ),
              // IconButton(
              //   icon: Icon(
              //     Icons.edit,
              //     size: 20,
              //     color: AppColors.textSecondary,
              //   ),
              //   onPressed: onEdit == null ? null : () => onEdit!(e),
              // ),
            ],
          ),
        ),
      ],
    );
  }

  // void updateData(List<Map<String, dynamic>> newOrders) {
  //   orders.clear();
  //   orders.addAll(newOrders);
  //   notifyListeners(); // 🔥 refresh table
  // }
  //
  // void sort<T>(
  //   Comparable<T> Function(Map<String, dynamic> data) getField,
  //   bool ascending,
  // ) {
  //   orders.sort((a, b) {
  //     final aValue = getField(a);
  //     final bValue = getField(b);
  //     return ascending
  //         ? Comparable.compare(aValue, bValue)
  //         : Comparable.compare(bValue, aValue);
  //   });
  //
  //   notifyListeners();
  // }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => vm.orders.length;

  @override
  int get selectedRowCount => 0;
}
