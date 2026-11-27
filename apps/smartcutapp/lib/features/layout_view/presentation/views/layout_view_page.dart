import 'package:board_cut/core/core.dart' hide PieceStatus;
import 'package:board_cut/core/core_injection.dart';
import 'package:board_cut/features/layout_view/data/model/optimization_material_group_model.dart';
import 'package:board_cut/features/layout_view/presentation/extensions/optimization_material_group_mapper.dart';
import 'package:board_cut/features/layout_view/presentation/view_models/layout_view_view_model.dart';
import 'package:board_cut/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sheet_viewer/sheet_viewer.dart';

import '../../../piece_detail/presentation/views/piece_detail.dart';

class LayoutViewPage extends BaseStatefulScreen {
  const LayoutViewPage({super.key, required this.optimizationMaterialGroupId});

  final String optimizationMaterialGroupId;

  @override
  BaseState<LayoutViewPage> createState() => _LayoutViewPageState();
}

class _LayoutViewPageState extends BaseState<LayoutViewPage> {
  late LayoutViewViewModel _vm;

  // 1220, 2440
  @override
  void initState() {
    super.initState();
    _vm = sl<LayoutViewViewModel>();
    _vm.optimizationMaterialGroupId = widget.optimizationMaterialGroupId;
  }

  bool _isTablet = false;
  bool _isMobile = false;
  @override
  Widget buildResponsive(BuildContext context, ScreenType screenType) {
    _isTablet = screenType == ScreenType.tablet;
    _isMobile = screenType == ScreenType.mobile;

    return ChangeNotifierProvider(
      create: (_) => _vm
        ..fetchMaterialGroupById()
        ..fetchPieceProcessTypes(),
      child: Consumer<LayoutViewViewModel>(
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

  // Create tab view with 2 tabs Details and Operations of the Pieces with selected under score

  Widget _buildDesktopLayout(LayoutViewViewModel vm) {
    final viewerHeight = (context.safeHeight * 0.65).clamp(420.0, 760.0);
    final layout = vm.selectedLayout;

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 5),
          _layouts(vm),
          if (layout == null) ...[
            const SizedBox(height: 16),
            const EmptyStateWidget(
              title: 'No sheet layouts available',
              description:
                  'Generate an optimization layout to view its sheets here.',
              icon: Icons.grid_view_outlined,
            ),
          ] else if (layout.sheets.isEmpty) ...[
            const SizedBox(height: 16),
            const EmptyStateWidget(
              title: 'No sheets in this layout',
              description: 'Select another layout or generate a new one.',
              icon: Icons.crop_landscape_outlined,
            ),
          ] else ...[
            const SizedBox(height: 16),
            _selectedSheetInfo(vm),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              height: viewerHeight,
              child: ViewerPage(
                key: ValueKey(layout.id),
                isMobile: _isMobile,
                isTablet: _isTablet,
                vm: vm,
                layout: layout,
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _layouts(LayoutViewViewModel vm) {
    final layouts = vm.materialGroup?.layouts ?? [];

    if (layouts.isEmpty) {
      return const SizedBox.shrink();
    }

    return SizedBox(
      height: 156,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: layouts.length,
        separatorBuilder: (_, _) => const SizedBox(width: 12),
        itemBuilder: (context, index) {
          final layout = layouts[index];
          final isSelected = layout.id == _vm.selectedLayout?.id;
          final utilization =
              (double.tryParse(layout.efficiencyPercent.toString()) ?? 0.0)
                  .clamp(0.0, 100.0);

          final status = layout.status.label;
          final statusColor = _optimizationStatusColor(status);

          return SizedBox(
            width: 280,
            child: Material(
              color: isSelected
                  ? AppColors.primaryColor.withValues(alpha: 0.06)
                  : AppColors.surfaceColor,
              borderRadius: BorderRadius.circular(AppSize.borderRadius),
              child: InkWell(
                borderRadius: BorderRadius.circular(AppSize.borderRadius),
                onTap: () async {
                  if (layout.status != LayoutStatus.generated ||
                      _vm.isUpdatingLayout) {
                    return;
                  }
                  await _selectLayout(layout.id, index);
                },
                child: Container(
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(AppSize.borderRadius),
                    border: Border.all(
                      color: isSelected
                          ? AppColors.primaryColor
                          : AppColors.dividerColor,
                      width: isSelected ? 1.5 : 0.8,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              '#V${index + 1}',
                              style: AppTextStyle.labelLarge
                                  .responsive(context)
                                  .semiBold
                                  .copyWith(color: AppColors.primaryColor),
                            ),
                          ),
                          if (isSelected)
                            Icon(
                              Icons.check_circle,
                              color: AppColors.primaryColor,
                              size: 18,
                            )
                          else
                            _optimizationStatus(status, statusColor),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Layout utilization',
                                style: AppTextStyle.labelSmall
                                    .responsive(context)
                                    .regular
                                    .copyWith(color: AppColors.textSecondary),
                              ),
                              Text(
                                '${utilization.toStringAsFixed(1)}%',
                                style: AppTextStyle.labelSmall
                                    .responsive(context)
                                    .semiBold
                                    .copyWith(color: AppColors.black),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(
                              AppSize.borderRadius,
                            ),
                            child: LinearProgressIndicator(
                              value: utilization / 100,
                              minHeight: 5,
                              backgroundColor: AppColors.dividerColor,
                              color: AppColors.primaryColor,
                            ),
                          ),
                        ],
                      ),
                      _layoutActions(layout, index, vm),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _layoutActions(
    OptimizationLayoutModel layout,
    int index,
    LayoutViewViewModel vm,
  ) {
    final canCancel = {
      LayoutStatus.generated,
      LayoutStatus.selected,
      LayoutStatus.inProduction,
    }.contains(layout.status);
    final canComplete =
        layout.status == LayoutStatus.selected ||
        layout.status == LayoutStatus.inProduction;
    final canSelect = layout.status == LayoutStatus.generated;

    if (!canCancel && !canComplete && !canSelect) {
      return const SizedBox(height: 28);
    }

    return SizedBox(
      height: 28,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          if (vm.isUpdatingLayout)
            const SizedBox.square(
              dimension: 18,
              child: CircularProgressIndicator(strokeWidth: 2),
            )
          else ...[
            if (canCancel)
              TextButton(
                onPressed: () => _cancelLayout(layout.id, index),
                style: TextButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  minimumSize: const Size(0, 28),
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
                child: const Text('Cancel'),
              ),
            if (canSelect)
              TextButton.icon(
                onPressed: () => _selectLayout(layout.id, index),
                style: TextButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  minimumSize: const Size(0, 28),
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
                icon: const Icon(Icons.check_circle_outline, size: 16),
                label: const Text('Select'),
              ),
            if (canComplete)
              TextButton.icon(
                onPressed: () => _completeProduction(layout.id, index),
                style: TextButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  minimumSize: const Size(0, 28),
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
                icon: const Icon(Icons.done_all, size: 16),
                label: const Text('Complete'),
              ),
          ],
        ],
      ),
    );
  }

  Future<void> _selectLayout(String layoutId, int index) async {
    final confirmed = await _confirmLayoutAction(
      title: 'Select layout?',
      message: 'Confirm #V${index + 1} as the layout for production?',
      confirmLabel: 'Select',
    );
    if (confirmed && mounted) {
      await _vm.selectOptimizationLayoutById(layoutId);
    }
  }

  Future<void> _cancelLayout(String layoutId, int index) async {
    final confirmed = await _confirmLayoutAction(
      title: 'Cancel layout?',
      message:
          'Cancel layout #V${index + 1}? This action may not be reversible.',
      confirmLabel: 'Cancel layout',
    );
    if (confirmed && mounted) {
      await _vm.cancelOptimizationLayoutById(layoutId);
    }
  }

  Future<void> _completeProduction(String layoutId, int index) async {
    final confirmed = await _confirmLayoutAction(
      title: 'Complete production?',
      message: 'Mark production for layout #V${index + 1} as complete?',
      confirmLabel: 'Complete',
    );
    if (confirmed && mounted) {
      await _vm.completeOptimizationProductionById(layoutId);
    }
  }

  Future<bool> _confirmLayoutAction({
    required String title,
    required String message,
    required String confirmLabel,
  }) async =>
      await showDialog<bool>(
        context: context,
        builder: (dialogContext) => AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(dialogContext, false),
              child: const Text('Back'),
            ),
            FilledButton(
              onPressed: () => Navigator.pop(dialogContext, true),
              child: Text(confirmLabel),
            ),
          ],
        ),
      ) ??
      false;

  Color _optimizationStatusColor(String? status) {
    return AppColors.statusColor(status ?? 'unknown');
  }

  Widget _optimizationStatus(String? status, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: color.withAlpha(30),
        borderRadius: BorderRadius.circular(AppSize.borderRadius),
      ),
      child: Text(
        status ?? 'Unknown',
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: AppTextStyle.labelSmall
            .responsive(context)
            .regular
            .copyWith(color: color),
      ),
    );
  }

  Widget _selectedSheetInfo(LayoutViewViewModel vm) {
    final selectedSheet = vm.selectedSheet;
    if (selectedSheet == null) return const SizedBox.shrink();
    final utilization = selectedSheet.utilizationPercent?.clamp(0.0, 100.0);
    final unusedPercent = utilization == null ? null : 100 - utilization;

    return Card(
      color: AppColors.surfaceColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSize.borderRadius),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 10,
          children: [
            Row(
              spacing: 10,
              children: [
                Text(
                  'Sheet ${selectedSheet.sheetNo}',
                  style: AppTextStyle.labelLarge.responsive(context).bold,
                ),
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const CustomPaint(
                  size: Size(24, 8),
                  painter: _KerfLegendLinePainter(),
                ),
                const SizedBox(width: 4),
                Text(
                  'Orange dashed lines mark kerf gaps',
                  style: AppTextStyle.labelSmall
                      .responsive(context)
                      .regular
                      .copyWith(color: AppColors.textSecondary),
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              spacing: 6,
              children: [
                _sheetInfoItem(
                  label: 'Material',
                  value: vm.materialGroup?.material.name ?? '',
                  hasDivider: false,
                ),
                _sheetInfoItem(
                  label: 'Sheet Size',
                  value: '${selectedSheet.width} x ${selectedSheet.height} mm',
                ),
                _sheetInfoItem(
                  label: 'Utilization',
                  value: utilization == null
                      ? '—'
                      : '${utilization.toStringAsFixed(1)}%',
                ),
                _sheetInfoItem(
                  label: 'Unused',
                  value: unusedPercent == null
                      ? '—'
                      : '${unusedPercent.toStringAsFixed(1)}%',
                ),
                _sheetInfoItem(
                  label: 'Pieces',
                  value: '${selectedSheet.layoutItems.length}',
                ),
                _sheetInfoItem(
                  label: 'Created At',
                  value: selectedSheet.createdAt.toDdMMMyyyy(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _sheetInfoItem({
    required String label,
    required String value,
    bool hasDivider = true,
  }) {
    return IntrinsicHeight(
      child: Row(
        spacing: 10,
        children: [
          if (hasDivider)
            VerticalDivider(
              color: AppColors.dividerColor,
              // Line color
              thickness: 1,
              // Thickness of the line
              width: 3,
            ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: AppTextStyle.labelSmall
                    .responsive(context)
                    .semiBold
                    .copyWith(color: AppColors.textSecondary),
              ),
              Text(
                value,
                overflow: TextOverflow.ellipsis,
                style: AppTextStyle.labelSmall
                    .responsive(context)
                    .semiBold
                    .copyWith(color: AppColors.black),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _KerfLegendLinePainter extends CustomPainter {
  const _KerfLegendLinePainter();

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFFE4572E)
      ..strokeWidth = 2;
    for (var x = 0.0; x < size.width; x += 7) {
      canvas.drawLine(
        Offset(x, size.height / 2),
        Offset(x + 4, size.height / 2),
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class ViewerPage extends StatefulWidget {
  const ViewerPage({
    super.key,
    required this.isMobile,
    required this.isTablet,
    required this.vm,
    required this.layout,
  });

  final bool isMobile, isTablet;
  final LayoutViewViewModel vm;
  final OptimizationLayoutModel layout;

  @override
  State<ViewerPage> createState() => _ViewerPageState();
}

class _ViewerPageState extends State<ViewerPage> {
  late final SheetViewerController controller;

  @override
  void initState() {
    super.initState();

    controller = SheetViewerController(
      layout: widget.vm.materialGroup!.toSheetLayout(widget.layout),
    );
    _syncPieceStatuses();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) controller.fitToScreen();
    });
  }

  @override
  void didUpdateWidget(covariant ViewerPage oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.layout != widget.layout) {
      controller.setLayout(
        widget.vm.materialGroup!.toSheetLayout(widget.layout),
      );
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) controller.fitToScreen();
      });
    }
    _syncPieceStatuses();
  }

  void _syncPieceStatuses() {
    controller.status.setStatuses(
      widget.layout.sheets
          .expand((sheet) => sheet.layoutItems)
          .map(
            (item) => item.optimizationPiece.sheetStatusUpdateFor(
              widget.vm.processTypes,
            ),
          )
          .whereType<PieceStatusUpdate>(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SheetViewer(
      controller: controller,
      padding: EdgeInsets.zero,
      processTypes: widget.vm.processTypes
          .map((processType) => processType.legendItem)
          .toList(),
      theme: const SheetViewerThemeData(
        showLabels: true,
        showGrain: true,
        pieceCornerRadius: 0,
        showPieceShadow: false,
      ),
      callbacks: SheetViewerCallbacks(
        onPieceTap: (event) {
          final piece = event.piece;

          switch (piece.type) {
            case PieceType.normal:
              showModalBottomSheet(
                context: context,
                useSafeArea: true,
                backgroundColor: Colors.white,
                isScrollControlled: true,
                showDragHandle: true,
                builder: (_) => PieceDetail(pieceId: piece.id),
              );
              break;

            case PieceType.unused:
              final area = piece.data;

              if (area is! RemainingArea) {
                debugPrint('Remaining area data is missing or invalid.');
                return;
              }

              // Already classified areas cannot be classified again.
              if (area.status != RemainingAreaStatus.pending) {
                return;
              }
              showRemainingAreaPopup(
                context: context,
                width: piece.bounds.width,
                height: piece.bounds.height,
                onSelected: (isOffcut) => widget.vm.classifyRemainingArea(
                  remainingAreaId: area.id,
                  status: isOffcut
                      ? RemainingAreaStatus.offcut
                      : RemainingAreaStatus.scrap,
                ),
              );
              break;
          }
        },
        onBackgroundTap: () {
          debugPrint('Background tapped');
        },
        onSheetChanged: (event) {
          widget.vm.fetchSelectedSheet(event.sheet.id);
        },
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}

Future<void> showRemainingAreaPopup({
  required BuildContext context,
  required double width,
  required double height,
  required Future<void> Function(bool isOffcut) onSelected,
}) async {
  await showModalBottomSheet<void>(
    context: context,
    useSafeArea: true,
    isScrollControlled: true,
    showDragHandle: true,
    backgroundColor: Colors.white,
    builder: (sheetContext) {
      return Padding(
        padding: const EdgeInsets.fromLTRB(20, 8, 20, 24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Remaining Area',
              style: Theme.of(sheetContext).textTheme.titleLarge
                  ?.copyWith(fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 8),
            Text(
              'Classify this leftover material after inspecting the cut sheet.',
              style: Theme.of(sheetContext).textTheme.bodyMedium
                  ?.copyWith(color: Colors.grey.shade600),
            ),
            const SizedBox(height: 20),

            // Dimensions
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(AppSize.borderRadius),
              ),
              child: Row(
                children: [
                  const Icon(Icons.straighten),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Remaining dimensions',
                          style: TextStyle(color: Colors.grey),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          '${width.toStringAsFixed(0)} × '
                          '${height.toStringAsFixed(0)} mm',
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Reusable offcut
            SizedBox(
              width: double.infinity,
              child: OutlinedButton.icon(
                onPressed: () async {
                  Navigator.pop(sheetContext);
                  await onSelected(true);
                },
                icon: const Icon(
                  Icons.inventory_2_outlined,
                  color: Colors.green,
                ),
                label: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 14),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Reusable Offcut',
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                      SizedBox(height: 4),
                      Text(
                        'Save usable material back to inventory.',
                        style: TextStyle(fontSize: 12),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 12),

            // Scrap
            SizedBox(
              width: double.infinity,
              child: OutlinedButton.icon(
                onPressed: () async {
                  Navigator.pop(sheetContext);
                  await onSelected(false);
                },
                icon: const Icon(Icons.delete_outline, color: Colors.red),
                label: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 14),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Scrap',
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                      SizedBox(height: 4),
                      Text(
                        'Mark as unusable material.',
                        style: TextStyle(fontSize: 12),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    },
  );
}
