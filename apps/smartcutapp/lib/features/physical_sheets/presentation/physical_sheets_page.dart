import 'dart:async';
import 'dart:math' as math;

import 'package:board_cut/core/core.dart';
import 'package:board_cut/core/core_injection.dart';
import 'package:board_cut/features/physical_sheets/physical_sheets_view_model.dart';
import 'package:board_cut/features/physical_sheets/data/models/physical_sheet_model.dart';
import 'package:board_cut/features/receive_sheets/presentation/receive_sheets_popup.dart';
import 'package:board_cut/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PhysicalSheetsPage extends BaseStatefulScreen {
  const PhysicalSheetsPage({super.key});

  @override
  BaseState<PhysicalSheetsPage> createState() => _PhysicalSheetsPageState();
}

class _PhysicalSheetsPageState extends BaseState<PhysicalSheetsPage> {
  late final vm = sl<PhysicalSheetsViewModel>()..load();
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
      child: Consumer<PhysicalSheetsViewModel>(
        builder: (context, model, _) {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  RecordListToolbar(
                    title: 'Physical sheets',
                    subtitle: 'Track full sheets and offcuts through the production lifecycle.',
                    description: 'Availability and sheet status stay synchronized with inventory balances.',
                    searchController: search,
                    searchHint: 'Search sheets...',
                    onSearchChanged: _onSearchChanged,
                    statusOptions: const [],
                    selectedStatus: '',
                    onStatusChanged: (_) {},
                    onClear: () {
                      search.clear();
                      _searchTimer?.cancel();
                      model.load(page: 1, search: '');
                    },
                    action: ButtonWidget.primary(
                      label: 'Receive sheets',
                      icon: Icons.add,
                      iconPosition: IconPosition.left,
                      onPressed: model.isSaving ? null : () => _create(),
                    ),
                  ),
                  const SizedBox(height: 16),
                  if (model.error != null)
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: Text(model.error!),
                      ),
                    ),
                  if (model.isLoading && model.sheets.isEmpty)
                    const Center(
                      child: Padding(
                        padding: EdgeInsets.all(48),
                        child: CircularProgressIndicator(),
                      ),
                    )
                  else if (model.sheets.isEmpty)
                    EmptyStateWidget(
                      title: model.search.isEmpty
                          ? 'No physical sheets yet'
                          : 'No sheets match your search',
                      description: model.search.isEmpty
                          ? 'Received full sheets and recorded offcuts will appear here.'
                          : 'Try a different search term or clear your search.',
                      icon: model.search.isEmpty
                          ? Icons.inventory_2_outlined
                          : Icons.search_off_outlined,
                    )
                  else
                    DataTableWidget(
                      rowsPerPage: model.limit,
                      sortAscending: true,
                      columns: const [
                        DataColumn(label: TableHeader(label: 'SHEET')),
                        DataColumn(label: TableHeader(label: 'MATERIAL')),
                        DataColumn(label: TableHeader(label: 'SIZE')),
                        DataColumn(label: TableHeader(label: 'WAREHOUSE')),
                        DataColumn(label: TableHeader(label: 'STATUS')),
                        DataColumn(label: TableHeader(label: 'ACTION')),
                      ],
                      dataSource: _SheetTableSource(
                        rows: model.sheets,
                        total: model.total,
                        page: model.page,
                        limit: model.limit,
                        buildRow: (s) {
                          final status = s.status;
                          return DataRow(
                            cells: [
                              DataCell(
                                TableValue(label: '${s.sheetCode} (${s.type})'),
                              ),
                              DataCell(TableValue(label: s.material.name)),
                              DataCell(
                                TableValue(label: '${s.width} × ${s.height}'),
                              ),
                              DataCell(TableValue(label: s.warehouse.name)),
                              DataCell(TableStatusValue(label: status)),
                              DataCell(
                                PopupMenuButton<String>(
                                  onSelected: (action) => _runAction(s, action),
                                  itemBuilder: (_) => [
                                    if (status == 'AVAILABLE')
                                      const PopupMenuItem(
                                        value: 'reserve',
                                        child: Text('Reserve'),
                                      ),
                                    if (status == 'RESERVED')
                                      const PopupMenuItem(
                                        value: 'release',
                                        child: Text('Release reservation'),
                                      ),
                                    if (status == 'RESERVED')
                                      const PopupMenuItem(
                                        value: 'start-production',
                                        child: Text('Start production'),
                                      ),
                                    if (status == 'IN_PRODUCTION')
                                      const PopupMenuItem(
                                        value: 'consume',
                                        child: Text('Complete production'),
                                      ),
                                    if (status == 'IN_PRODUCTION')
                                      const PopupMenuItem(
                                        value: 'offcut',
                                        child: Text('Record offcut'),
                                      ),
                                    if (status == 'AVAILABLE')
                                      const PopupMenuItem(
                                        value: 'transfer',
                                        child: Text('Transfer warehouse'),
                                      ),
                                    if (status != 'USED' &&
                                        status != 'SCRAPPED')
                                      const PopupMenuItem(
                                        value: 'scrap',
                                        child: Text('Scrap'),
                                      ),
                                  ],
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

  Future<void> _create() async {
    await showReceiveSheetsPopup(context, vm);
  }

  Widget _number(TextEditingController c, String label) => TextFormFieldWidget(
    controller: c,
    labelText: label,
    hintText: '0',
    keyboardType: TextInputType.number,
    isRequired: true,
    validator: (v) {
      final n = num.tryParse(v ?? '');
      return n == null || n <= 0 ? 'Enter a value greater than zero.' : null;
    },
  );

  double _dialogHeight(BuildContext context, ScreenType screenType) {
    final size = MediaQuery.sizeOf(context);
    final available =
        (size.height - MediaQuery.viewInsetsOf(context).vertical - 32).clamp(
          320.0,
          size.height,
        );
    return math.min(
      ResponsiveHelper.determineDialogHeight(screenType),
      available,
    );
  }

  Future<void> _runAction(PhysicalSheetModel sheet, String action) async {
    String? error;
    if (action == 'offcut') {
      error = await _createOffcut(sheet);
    } else if (action == 'transfer') {
      String? warehouseId = vm.warehouses
          .where((w) => w.id != sheet.warehouseId)
          .firstOrNull
          ?.id;
      if (warehouseId == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('No destination warehouse available.')),
        );
        return;
      }
      error = await vm.transfer(sheet.id, warehouseId);
    } else {
      error = await vm.action(sheet.id, action);
    }
    if (mounted && error != null) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(error)));
    }
  }

  Future<String?> _createOffcut(PhysicalSheetModel sheet) async {
    final width = TextEditingController();
    final height = TextEditingController();
    final form = GlobalKey<FormState>();
    final screenType = ResponsiveHelper.getScreenType(context);
    final isSmall = screenType != ScreenType.desktop;
    final submitted = await PhysicalSheetFormPageRoute(
      (ctx) => Scaffold(
        backgroundColor: AppColors.transparent,
        body: Center(
          child: Container(
            width: isSmall ? double.maxFinite : AppSize.dialogWidth,
            height: _dialogHeight(ctx, screenType),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppColors.surface,
              borderRadius: BorderRadius.circular(AppSize.borderRadius),
            ),
            child: Form(
              key: form,
              child: Column(
                children: [
                  const DialogHeaderWidget(title: 'Record Offcut'),
                  const SizedBox(height: 12),
                  Expanded(
                    child: SingleChildScrollView(
                      child: isSmall
                          ? Column(
                              children: [
                                _number(width, 'Offcut width (mm)'),
                                const SizedBox(height: 12),
                                _number(height, 'Offcut height (mm)'),
                              ],
                            )
                          : Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: _number(width, 'Offcut width (mm)'),
                                ),
                                const SizedBox(width: 16),
                                Expanded(
                                  child: _number(height, 'Offcut height (mm)'),
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
                        onPressed: () => Navigator.pop(ctx, false),
                      ),
                      const SizedBox(width: 10),
                      ButtonWidget.primary(
                        label: 'Save offcut',
                        onPressed: () {
                          if (form.currentState!.validate()) {
                            Navigator.pop(ctx, true);
                          }
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    ).push<bool>(context);
    String? error;
    if (submitted == true) {
      error = await vm.createOffcut({
        'parentId': sheet.id,
        'width': double.parse(width.text),
        'height': double.parse(height.text),
      });
    }
    width.dispose();
    height.dispose();
    return error;
  }
}

class _SheetTableSource extends DataTableSource {
  _SheetTableSource({
    required this.rows,
    required this.total,
    required this.page,
    required this.limit,
    required this.buildRow,
  });

  final List<PhysicalSheetModel> rows;
  final int total, page, limit;
  final DataRow Function(PhysicalSheetModel) buildRow;

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
