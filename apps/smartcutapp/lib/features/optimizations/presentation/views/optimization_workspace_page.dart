import 'dart:async';

import 'package:board_cut/core/core.dart';
import 'package:board_cut/core/core_injection.dart';
import 'package:board_cut/features/orders/data/models/order_model.dart';
import 'package:board_cut/features/orders/domain/usecases/get_orders.dart';
import 'package:board_cut/shared/shared.dart';
import 'package:flutter/material.dart';

class OptimizationWorkspacePage extends BaseStatefulScreen {
  const OptimizationWorkspacePage({super.key});

  @override
  BaseState<OptimizationWorkspacePage> createState() =>
      _OptimizationWorkspacePageState();
}

class _OptimizationWorkspacePageState
    extends BaseState<OptimizationWorkspacePage> {
  static const _pageSize = 10;

  final _getOrders = sl<GetOrders>();
  final _searchController = TextEditingController();
  Timer? _searchTimer;
  List<OrderModel> _orders = const [];
  int _page = 1;
  int _totalPages = 1;
  int _totalCount = 0;
  int _tableGeneration = 0;
  int _requestId = 0;
  bool _isLoading = true;
  String? _error;

  @override
  void initState() {
    super.initState();
    _loadOrders();
  }

  @override
  void dispose() {
    _searchTimer?.cancel();
    _searchController.dispose();
    super.dispose();
  }

  Future<void> _loadOrders({int page = 1, bool resetTable = false}) async {
    final requestId = ++_requestId;
    setState(() {
      _isLoading = true;
      _error = null;
      if (resetTable) {
        _tableGeneration++;
        _orders = const [];
        _totalCount = 0;
      }
    });

    final result = await _getOrders(
      page: page,
      limit: _pageSize,
      search: _searchController.text.trim(),
    );

    if (!mounted || requestId != _requestId) return;
    result.match(
      (failure) => setState(() {
        _error = failure.message;
        _orders = const [];
        _totalCount = 0;
        _isLoading = false;
      }),
      (response) => setState(() {
        _orders = response.items;
        _page = response.page;
        _totalCount = response.total;
        _totalPages = response.totalPages < 1 ? 1 : response.totalPages;
        _isLoading = false;
      }),
    );
  }

  void _onSearchChanged(String _) {
    _searchTimer?.cancel();
    _searchTimer = Timer(
      const Duration(milliseconds: 350),
      () => _loadOrders(page: 1, resetTable: true),
    );
  }

  @override
  Widget buildResponsive(BuildContext context, ScreenType screenType) {
    final isSmall = screenType != ScreenType.desktop;
    return SingleChildScrollView(
      padding: EdgeInsets.all(isSmall ? 12 : 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Optimizations',
            style: AppTextStyle.titleSmall
                .responsive(context)
                .semiBold
                .copyWith(color: AppColors.textPrimary),
          ),
          const SizedBox(height: 4),
          Text(
            'Choose an order to review its optimization runs, material groups, and sheet layouts.',
            style: AppTextStyle.bodySmall
                .responsive(context)
                .regular
                .copyWith(color: AppColors.textSecondary),
          ),
          const SizedBox(height: 16),
          Align(
            alignment: Alignment.centerLeft,
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 360),
              child: SizedBox(
                width: double.infinity,
                child: TextFormFieldWidget(
                  controller: _searchController,
                  hasLabel: false,
                  hintText: 'Search order, customer, project, or factory',
                  prefixIcon: const Icon(Icons.search, size: 18),
                  onChanged: _onSearchChanged,
                  onFieldSubmitted: (_) =>
                      _loadOrders(page: 1, resetTable: true),
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
          if (_isLoading && _orders.isEmpty)
            const Padding(
              padding: EdgeInsets.all(48),
              child: Center(child: CircularProgressIndicator()),
            )
          else if (_error != null)
            _messageCard(
              _error!,
              action: ButtonWidget.secondary(
                label: 'Retry',
                onPressed: () => _loadOrders(page: _page),
              ),
            )
          else if (_orders.isEmpty)
            EmptyStateWidget(
              title: _searchController.text.trim().isEmpty
                  ? 'No orders available'
                  : 'No orders match your search',
              description: _searchController.text.trim().isEmpty
                  ? 'Orders will appear here when they are created.'
                  : 'Try a different search term or clear your search.',
              icon: _searchController.text.trim().isEmpty
                  ? Icons.receipt_long_outlined
                  : Icons.search_off_outlined,
            )
          else
            _ordersTable(isSmall: isSmall),
        ],
      ),
    );
  }

  Widget _messageCard(String message, {Widget? action}) => Card(
    color: AppColors.surfaceColor,
    child: Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(message, style: AppTextStyle.bodySmall),
          if (action != null) ...[const SizedBox(height: 12), action],
        ],
      ),
    ),
  );

  Widget _ordersTable({required bool isSmall}) => DataTableWidget(
    key: ValueKey(_tableGeneration),
    rowsPerPage: _pageSize,
    showEmptyRows: false,
    sortAscending: true,
    columns: [
      const DataColumn(label: TableHeader(label: 'ORDER')),
      const DataColumn(label: TableHeader(label: 'PROJECT')),
      const DataColumn(label: TableHeader(label: 'CUSTOMER')),
      if (!isSmall) const DataColumn(label: TableHeader(label: 'FACTORY')),
      const DataColumn(label: TableHeader(label: 'STATUS')),
      const DataColumn(label: TableHeader(label: 'ACTION')),
    ],
    dataSource: _OptimizationOrderDataSource(
      orders: _orders,
      pageOffset: (_page - 1) * _pageSize,
      totalCount: _totalCount,
      isSmall: isSmall,
      context: context,
      onOpen: (order) {
        OptimizationsPageRoute(order.id).push(context);
      },
    ),
    onPageChanged: (firstRowIndex) {
      final requestedPage = firstRowIndex ~/ _pageSize + 1;
      if (requestedPage != _page &&
          requestedPage <= _totalPages &&
          !_isLoading) {
        _loadOrders(page: requestedPage);
      }
    },
  );
}

class _OptimizationOrderDataSource extends DataTableSource {
  _OptimizationOrderDataSource({
    required this.orders,
    required this.pageOffset,
    required this.totalCount,
    required this.isSmall,
    required this.context,
    required this.onOpen,
  });

  final List<OrderModel> orders;
  final int pageOffset;
  final int totalCount;
  final bool isSmall;
  final BuildContext context;
  final ValueChanged<OrderModel> onOpen;

  @override
  DataRow? getRow(int index) {
    final orderIndex = index - pageOffset;
    if (orderIndex < 0 || orderIndex >= orders.length) return null;
    final order = orders[orderIndex];

    return DataRow.byIndex(
      index: index,
      cells: [
        DataCell(TableValue(label: 'ORD-${order.orderNumber}')),
        DataCell(TableValue(label: order.project.name)),
        DataCell(TableValue(label: order.customer.name)),
        if (!isSmall) DataCell(TableValue(label: order.factory?.name ?? '-')),
        DataCell(
          TableStatusValue(
            label: order.status.label,
            color: AppColors.statusColor(order.status.label),
          ),
        ),
        DataCell(
          IconButton(
            tooltip: 'Open optimizations',
            icon: const Icon(Icons.open_in_new_outlined, size: 20),
            color: AppColors.textSecondary,
            onPressed: () => onOpen(order),
          ),
        ),
      ],
    );
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => totalCount;

  @override
  int get selectedRowCount => 0;
}
