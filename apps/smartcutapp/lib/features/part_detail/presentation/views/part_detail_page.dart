import 'package:board_cut/core/core.dart';
import 'package:board_cut/core/core_injection.dart';
import 'package:board_cut/features/part_detail/presentation/widgets/print_piece_label.dart';
import 'package:board_cut/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../piece_detail/presentation/views/piece_detail.dart';
import '../../../piece_detail/presentation/view_models/piece_detail_view_model.dart';
import '../../../piece_detail/data/model/selected_piece_model.dart';
import '../../data/model/part_detail_piece_model.dart';
import '../viewmodels/part_detail_view_model.dart';

class PartDetailPage extends BaseStatefulScreen {
  const PartDetailPage({
    super.key,
    required this.partId,
    required this.itemId,
    required this.orderId,
  });

  final String partId;
  final String itemId;
  final String orderId;

  @override
  BaseState<PartDetailPage> createState() => _PartDetailPageState();
}

class _PartDetailPageState extends BaseState<PartDetailPage> {
  late final PartDetailViewModel _vm;

  @override
  void initState() {
    super.initState();
    _vm = sl<PartDetailViewModel>();
    _vm.partId = widget.partId;
  }

  @override
  Widget buildResponsive(BuildContext context, ScreenType screenType) {
    return ChangeNotifierProvider(
      create: (_) => _vm
        ..fetchPartDetail()
        ..fetchPiecesByPartId(),

      child: Consumer<PartDetailViewModel>(
        builder: (context, vm, child) {
          if (vm.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          return Scaffold(
            backgroundColor: AppColors.backgroundColor,
            body: SingleChildScrollView(
              primary: true,
              child: switch (screenType) {
                ScreenType.mobile => _buildDesktopLayout(vm),
                ScreenType.tablet => _buildDesktopLayout(vm),
                ScreenType.desktop => _buildDesktopLayout(vm),
              },
            ),
          );
        },
      ),
    );
  }

  Widget _buildDesktopLayout(PartDetailViewModel vm) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 5),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            spacing: 10,
            children: [
              SubHeader(
                title: _vm.part?.name ?? '',
                subtitle: _vm.part?.material.name ?? '',
                desc: '${_vm.part?.width} x ${_vm.part?.height}',
              ),
              IntrinsicHeight(
                child: Row(
                  children: [
                    Expanded(flex: 1, child: partDetailCard()),
                    Expanded(flex: 1, child: _cutDetailCard()),
                    Expanded(flex: 1, child: _noteCard()),
                  ],
                ),
              ),
              Divider(color: Colors.grey.withAlpha(100)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Pieces',
                    style: AppTextStyle.labelLarge.bold.copyWith(
                      color: AppColors.textPrimary,
                    ),
                  ),

                  _buildActions(),
                ],
              ),
              _pieces(vm),
            ],
          ),
        ],
      ),
    );
  }

  Widget partDetailCard() {
    return Card(
      color: AppColors.surfaceColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSize.borderRadius),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          spacing: 6,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _header("Part Details"),
            const SizedBox(height: 10),
            ItemSectionWidget(
              label: "Material",
              value: _vm.part?.material.name ?? '',
            ),
            ItemSectionWidget(
              label: "Thickness",
              value: _vm.part?.thickness.toString() ?? '',
            ),

            ItemSectionWidget(
              label: "Quantity",
              value: _vm.part?.quantity.toString() ?? '',
            ),

            ItemSectionWidget(
              label: "Dimension",
              value: "${_vm.part?.width} x ${_vm.part?.height}",
            ),
          ],
        ),
      ),
    );
  }

  Widget _cutDetailCard() {
    final edges = [
      _vm.part?.edgeBandLeft,
      _vm.part?.edgeBandTop,
      _vm.part?.edgeBandRight,
      _vm.part?.edgeBandBottom,
    ];
    final edgeDisplay = edges.every((edge) => edge == null)
        ? 'None'
        : edges.map((edge) => edge?.toString() ?? '—').join(' - ');

    return Card(
      color: AppColors.surfaceColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSize.borderRadius),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          spacing: 6,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _header("Cut Details"),
            const SizedBox(height: 10),

            ItemSectionWidget(
              label: "Grain",
              value: _vm.part?.grain == true ? 'Yes' : 'No',
            ),

            ItemSectionWidget(label: "Edges(LTRB)", value: edgeDisplay),

            ItemSectionWidget(
              label: "Grain Direction",
              value: _vm.part?.grainDirection?.label ?? 'Not specified',
            ),
            ItemSectionWidget(label: "", value: ''),
          ],
        ),
      ),
    );
  }

  void _printLabel(PartDetailPieceModel piece) {
    final part = _vm.part;
    if (part == null) return;

    showDialog<void>(
      context: context,
      builder: (BuildContext context) =>
          PrintPieceLabel(piece: piece, part: part, orderId: widget.orderId),
    );
  }

  Widget _noteCard() {
    return Card(
      color: AppColors.surfaceColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSize.borderRadius),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 6,
          children: [
            _header("Remarks"),
            const SizedBox(height: 10),
            Text(
              maxLines: 6,
              overflow: TextOverflow.ellipsis,
              '',
              style: AppTextStyle.labelSmall.regular.copyWith(
                color: AppColors.textPrimary,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActions() {
    return Row(
      spacing: 10,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        FilterChip(
          label: Row(
            children: [
              Icon(Icons.add, size: 16, color: AppColors.white),
              SizedBox(width: 4),
              Text("Generate Pieces"),
            ],
          ),
          backgroundColor: AppColors.primaryColor,
          labelStyle: TextStyle(color: AppColors.white),
          onSelected: (selected) {
            _vm.generatePieces();
          },
        ),
        // FilterChip(
        //   label: Row(
        //     children: [
        //       Icon(Icons.add, size: 16, color: AppColors.white),
        //       SizedBox(width: 4),
        //       Text(
        //         "Generate Pieces",
        //         style: AppTextStyle.mediumBlackRegular.copyWith(
        //           color: AppColors.white,
        //         ),
        //       ),
        //     ],
        //   ),
        //   backgroundColor: AppColors.primaryColor,
        //   labelStyle: TextStyle(color: AppColors.white),
        //   onSelected: (selected) {},
        // ),
        // FilterChip(
        //   label: Row(
        //     children: [
        //       Icon(
        //         Icons.developer_board_outlined,
        //         size: 16,
        //         color: AppColors.white,
        //       ),
        //       SizedBox(width: 4),
        //       Text(
        //         "View Boards",
        //         // style: AppTextStyle.mediumBlackRegular.copyWith(
        //         //   color: AppColors.white,
        //         // ),
        //       ),
        //     ],
        //   ),
        //   backgroundColor: AppColors.primaryColor,
        //   labelStyle: TextStyle(color: AppColors.white),
        //   onSelected: (selected) {},
        // ),
      ],
    );
  }

  Widget _header(String label) {
    return Text(
      label,
      style: AppTextStyle.labelLarge
          .responsive(context)
          .bold
          .copyWith(color: AppColors.textPrimary),
    );
  }

  Widget _pieces(PartDetailViewModel vm) {
    if (vm.pieces.isEmpty) {
      return const EmptyStateWidget(
        title: 'No pieces generated',
        description: 'Generate pieces to see them listed here.',
        icon: Icons.view_list_outlined,
      );
    }
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          width: double.infinity,
          child: DataTableWidget(
            rowsPerPage: vm.pageSize,
            showEmptyRows: false,
            sortAscending: true,
            columns: const <DataColumn>[
              DataColumn(label: TableHeader(label: 'PIECE ID')),
              DataColumn(label: TableHeader(label: 'PART NAME')),
              DataColumn(label: TableHeader(label: 'MATERIAL')),
              DataColumn(label: TableHeader(label: 'DIMENSION')),
              DataColumn(label: TableHeader(label: 'STATUS')),
              DataColumn(label: TableHeader(label: 'ACTIONS')),
            ],
            dataSource: PiecesDataSource(
              vm: vm,
              onShowProcesses: _showProcesses,
              onView: _onView,
              onPrint: _onPrint,
            ),
          ),
        ),
        if (vm.totalPages > 1)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text('Page ${vm.currentPage} of ${vm.totalPages}'),
                IconButton(
                  tooltip: 'Previous page',
                  onPressed: vm.currentPage > 1
                      ? () => _changePiecesPage(vm.currentPage - 1)
                      : null,
                  icon: const Icon(Icons.chevron_left),
                ),
                IconButton(
                  tooltip: 'Next page',
                  onPressed: vm.currentPage < vm.totalPages
                      ? () => _changePiecesPage(vm.currentPage + 1)
                      : null,
                  icon: const Icon(Icons.chevron_right),
                ),
              ],
            ),
          ),
      ],
    );
  }

  void _showProcesses(PartDetailPieceModel piece) {
    showDialog<void>(
      context: context,
      builder: (_) => PieceProcessesDialog(piece: piece),
    );
  }

  Future<void> _changePiecesPage(int page) async {
    await _vm.fetchPiecesByPartId(page: page);
  }

  void _onPrint(PartDetailPieceModel data) {
    _printLabel(data);
  }

  void _onView(PartDetailPieceModel data) {
    showModalBottomSheet(
      context: context,
      useSafeArea: true,
      backgroundColor: Colors.white,
      isScrollControlled: true,
      showDragHandle: true,
      builder: (_) {
        final part = _vm.part;
        if (part == null) return const SizedBox.shrink();
        return PieceDetail(
          pieceId: data.id,
          part: part,
          piece: data,
          orderId: widget.orderId,
        );
      },
    );
  }

  // void _sort<T>(
  //   Comparable<T> Function(Map<String, dynamic> data) getField,
  //   int columnIndex,
  //   bool ascending,
  // ) {
  //   _dataSource.sort<T>(getField, ascending);
  //
  //   setState(() {
  //     _sortColumnIndex = columnIndex;
  //     _sortAscending = ascending;
  //   });
  // }
}

class PieceProcessesDialog extends StatefulWidget {
  const PieceProcessesDialog({super.key, required this.piece});

  final PartDetailPieceModel piece;

  @override
  State<PieceProcessesDialog> createState() => _PieceProcessesDialogState();
}

class _PieceProcessesDialogState extends State<PieceProcessesDialog> {
  late final PieceDetailViewModel _detailViewModel;
  bool _loading = false;
  bool _loaded = false;

  @override
  void initState() {
    super.initState();
    _detailViewModel = sl<PieceDetailViewModel>();
    WidgetsBinding.instance.addPostFrameCallback((_) => _loadProcesses());
  }

  Future<void> _loadProcesses() async {
    if (_loaded || _loading) return;
    setState(() => _loading = true);
    await _detailViewModel.fetchPieceById(widget.piece.id);
    if (!mounted) return;
    setState(() {
      _loading = false;
      _loaded = _detailViewModel.selectedPiece != null;
    });
  }

  @override
  void dispose() {
    _detailViewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final piece = widget.piece;
    return AlertDialog(
      title: Text('Processes · ${piece.pieceCode}'),
      content: SizedBox(
        width: 480,
        child: SingleChildScrollView(
          child: _loading
              ? const Padding(
                  padding: EdgeInsets.all(20),
                  child: Center(child: CircularProgressIndicator()),
                )
              : _detailViewModel.error != null && !_loaded
              ? Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(_detailViewModel.error!),
                    const SizedBox(height: 8),
                    TextButton(
                      onPressed: _loadProcesses,
                      child: const Text('Retry'),
                    ),
                  ],
                )
              : _processList(_detailViewModel.selectedPiece?.processes ?? []),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Close'),
        ),
      ],
    );
  }

  Widget _processList(List<PieceProcess> processes) {
    if (processes.isEmpty) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Text(
          _loaded
              ? 'No processes recorded for this piece.'
              : 'No processes available.',
          style: AppTextStyle.labelSmall.regular.copyWith(
            color: AppColors.textSecondary,
          ),
        ),
      );
    }
    final ordered = [...processes]
      ..sort(
        (a, b) =>
            a.processType.sequenceOrder.compareTo(b.processType.sequenceOrder),
      );
    return Column(
      children: ordered.map((process) {
        final timestamps = [
          if (process.startedAt != null)
            'Started ${process.startedAt!.toLocal().toString().substring(0, 16)}',
          if (process.completedAt != null)
            'Completed ${process.completedAt!.toLocal().toString().substring(0, 16)}',
        ].join(' · ');
        return Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            border: Border(top: BorderSide(color: Colors.grey.withAlpha(35))),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(child: Text(process.processType.name)),
                  ProcessStatusWidget(status: process.status.label),
                ],
              ),
              if (timestamps.isNotEmpty ||
                  process.remarks?.isNotEmpty == true) ...[
                const SizedBox(height: 5),
                Text(
                  [
                    if (timestamps.isNotEmpty) timestamps,
                    if (process.remarks?.isNotEmpty == true) process.remarks!,
                  ].join('\n'),
                  style: AppTextStyle.labelSmall.regular.copyWith(
                    color: AppColors.textSecondary,
                  ),
                ),
              ],
            ],
          ),
        );
      }).toList(),
    );
  }
}

class PiecesDataSource extends DataTableSource {
  PiecesDataSource({
    required this.vm,
    required this.onShowProcesses,
    required this.onView,
    required this.onPrint,
  });

  final PartDetailViewModel vm;
  final ValueChanged<PartDetailPieceModel> onShowProcesses;
  final ValueChanged<PartDetailPieceModel> onView;
  final ValueChanged<PartDetailPieceModel> onPrint;

  @override
  DataRow? getRow(int index) {
    if (index >= vm.pieces.length) return null;
    final piece = vm.pieces[index];
    return DataRow.byIndex(
      index: index,
      cells: [
        DataCell(TableValue(label: piece.pieceCode)),
        DataCell(TableValue(label: vm.part?.name ?? '—')),
        DataCell(TableValue(label: vm.part?.material.name ?? '—')),
        DataCell(TableValue(label: '${piece.width} × ${piece.height} mm')),
        const DataCell(TableValue(label: '—')),
        DataCell(
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                tooltip: 'View process statuses',
                icon: const Icon(Icons.account_tree_outlined),
                color: AppColors.textSecondary,
                onPressed: () => onShowProcesses(piece),
              ),
              IconButton(
                tooltip: 'View piece details',
                icon: const Icon(Icons.open_in_new_outlined, size: 20),
                color: AppColors.textSecondary,
                onPressed: () => onView(piece),
              ),
              IconButton(
                tooltip: 'Print label',
                icon: const Icon(Icons.print, size: 20),
                color: AppColors.textSecondary,
                onPressed: () => onPrint(piece),
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
  int get rowCount => vm.pieces.length;

  @override
  int get selectedRowCount => 0;
}
