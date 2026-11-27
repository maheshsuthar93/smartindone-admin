import 'dart:async';

import 'package:board_cut/core/core.dart';
import 'package:board_cut/core/core_injection.dart';
import 'package:board_cut/features/inventory_transactions/inventory_transactions_view_model.dart';
import 'package:board_cut/features/inventory_transactions/data/models/inventory_transaction_model.dart';
import 'package:board_cut/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class InventoryTransactionsPage extends BaseStatefulScreen {
  const InventoryTransactionsPage({super.key});

  @override
  BaseState<InventoryTransactionsPage> createState() =>
      _InventoryTransactionsPageState();
}

class _InventoryTransactionsPageState
    extends BaseState<InventoryTransactionsPage> {
  late final vm = sl<InventoryTransactionsViewModel>()..load();
  final search = TextEditingController();
  Timer? _searchTimer;

  @override
  void dispose() {
    _searchTimer?.cancel();
    search.dispose();
    vm.dispose();
    super.dispose();
  }

  void _onSearchChanged(String value) {
    _searchTimer?.cancel();
    _searchTimer = Timer(const Duration(milliseconds: 300), () {
      if (mounted) vm.load(page: 1, search: value.trim());
    });
  }

  @override
  Widget buildResponsive(BuildContext context, ScreenType screenType) {
    final desiredLimit = screenType == ScreenType.desktop ? 8 : 5;
    if (vm.limit != desiredLimit) {
      vm.limit = desiredLimit;
      vm.load(page: 1);
    }
    return ChangeNotifierProvider.value(
      value: vm,
      child: Consumer<InventoryTransactionsViewModel>(
        builder: (context, model, _) {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  RecordListToolbar(
                    title: 'Inventory transactions',
                    subtitle: 'Review stock receipts, adjustments, transfers, and production movements.',
                    description:
                        'History is limited to your company warehouses.',
                    searchController: search,
                    searchHint: 'Search transactions...',
                    onSearchChanged: _onSearchChanged,
                    statusOptions: const [],
                    selectedStatus: '',
                    onStatusChanged: (_) {},
                    action: const SizedBox.shrink(),
                    onClear: () {
                      search.clear();
                      _searchTimer?.cancel();
                      model.load(page: 1, search: '');
                    },
                  ),
                  const SizedBox(height: 16),
                  if (model.error != null)
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: Text(model.error!),
                      ),
                    ),
                  if (model.isLoading && model.transactions.isEmpty)
                    const Center(
                      child: Padding(
                        padding: EdgeInsets.all(48),
                        child: CircularProgressIndicator(),
                      ),
                    )
                  else if (model.transactions.isEmpty)
                    EmptyStateWidget(
                      title: model.search.isEmpty
                          ? 'No stock history yet'
                          : 'No transactions match your search',
                      description: model.search.isEmpty
                          ? 'Inventory movements will appear here as stock changes.'
                          : 'Try a different search term or clear your search.',
                      icon: model.search.isEmpty
                          ? Icons.receipt_long_outlined
                          : Icons.search_off_outlined,
                    )
                  else
                    DataTableWidget(
                      rowsPerPage: model.limit,
                      sortAscending: false,
                      columns: const [
                        DataColumn(label: TableHeader(label: 'DATE')),
                        DataColumn(label: TableHeader(label: 'ITEM')),
                        DataColumn(label: TableHeader(label: 'TYPE')),
                        DataColumn(label: TableHeader(label: 'WAREHOUSE')),
                        DataColumn(label: TableHeader(label: 'CHANGE')),
                        DataColumn(label: TableHeader(label: 'NOTES')),
                      ],
                      dataSource: _TransactionTableSource(
                        rows: model.transactions,
                        total: model.total,
                        page: model.page,
                        limit: model.limit,
                        buildRow: (t) {
                          final date = t.createdAt?.toLocal();
                          final item =
                              t.material?.name ??
                              t.hardware?.name ??
                              'Inventory item';
                          return DataRow(
                            cells: [
                              DataCell(
                                TableValue(
                                  label: date == null
                                      ? '—'
                                      : MaterialLocalizations.of(context)
                                            .formatMediumDate(date),
                                ),
                              ),
                              DataCell(TableValue(label: item)),
                              DataCell(
                                TableStatusValue(label: t.transactionType),
                              ),
                              DataCell(
                                TableValue(label: t.warehouse?.name ?? ''),
                              ),
                              DataCell(
                                TableValue(label: t.quantityChange.toString()),
                              ),
                              DataCell(
                                SizedBox(
                                  width: 220,
                                  child: TableValue(
                                    label: t.notes ?? '—',
                                    maxLines: 5,
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                      onPageChanged: (start) {
                        final next = start ~/ model.limit + 1;
                        if (next != model.page && next <= model.totalPages) {
                          model.load(page: next);
                        }
                      },
                    ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class _TransactionTableSource extends DataTableSource {
  _TransactionTableSource({
    required this.rows,
    required this.total,
    required this.page,
    required this.limit,
    required this.buildRow,
  });

  final List<InventoryTransactionModel> rows;
  final int total, page, limit;
  final DataRow Function(InventoryTransactionModel) buildRow;

  @override
  DataRow? getRow(int index) {
    final local = index - (page - 1) * limit;
    return local >= 0 && local < rows.length
        ? DataRow.byIndex(index: index, cells: buildRow(rows[local]).cells)
        : null;
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => total;

  @override
  int get selectedRowCount => 0;
}
