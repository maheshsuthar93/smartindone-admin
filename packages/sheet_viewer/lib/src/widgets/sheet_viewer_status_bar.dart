import 'package:flutter/material.dart';
import 'package:sheet_viewer/sheet_viewer.dart';
import 'package:sheet_viewer/src/widgets/status_legend.dart';

import '../utils/viewer_breakpoints.dart';

class SheetViewerStatusBar extends StatelessWidget {
  const SheetViewerStatusBar({
    super.key,
    required this.controller,
    this.processTypes,
  });

  final SheetViewerController controller;
  final List<ProcessTypeLegendItem>? processTypes;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final layout = context.viewerLayout;

    return AnimatedBuilder(
      animation: controller,
      builder: (_, _) {
        debugPrint('Layout is :${layout.name}');
        switch (layout) {
          case ViewerLayout.mobile:
            return _buildMobile(theme);

          case ViewerLayout.tablet:
            return _buildTablet(theme);

          case ViewerLayout.desktop:
            return _buildDesktop(theme);
        }
      },
    );
  }

  Widget _buildDesktop(ThemeData theme) {
    return SizedBox(
      height: 52,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          children: [
            _sheetChip(),
            const SizedBox(width: 8),
            _pieceChip(),
            const SizedBox(width: 20),

            SizedBox(
              width: 180,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: LinearProgressIndicator(
                  value: controller.utilization,
                  minHeight: 8,
                ),
              ),
            ),

            const SizedBox(width: 10),

            Text(
              '${(controller.utilization * 100).toStringAsFixed(1)}%',
              style: theme.textTheme.labelLarge,
            ),

            const Spacer(),

            _statusLegend(),
          ],
        ),
      ),
    );
  }

  Widget _buildTablet(ThemeData theme) {
    return SizedBox(
      height: 100,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                _sheetChip(),
                const SizedBox(width: 8),
                _pieceChip(),

                const Spacer(),

                Text(
                  'Used ${(controller.utilization * 100).toStringAsFixed(1)}%',
                  style: theme.textTheme.labelLarge,
                ),
              ],
            ),
            const Spacer(),

            _statusLegend(),
          ],
        ),
      ),
    );
  }

  Widget _buildMobile(ThemeData theme) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _statusLegend(),
          const SizedBox(height: 6),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [_sheetChip(), _pieceChip()],
          ),

          const SizedBox(height: 10),

          LinearProgressIndicator(value: controller.utilization, minHeight: 8),

          const SizedBox(height: 6),

          Text(
            'Used ${(controller.utilization * 100).toStringAsFixed(1)}%',
            style: theme.textTheme.labelMedium,
          ),
        ],
      ),
    );
  }

  Widget _sheetChip() {
    return Chip(
      avatar: const Icon(Icons.crop_square, size: 16),
      label: Text(
        '${controller.currentSheet.width.toInt()} × '
        '${controller.currentSheet.height.toInt()}',
      ),
    );
  }

  Widget _pieceChip() {
    return Chip(
      avatar: const Icon(Icons.grid_view, size: 16),
      label: Text('${controller.currentSheet.pieces.length} Pieces'),
    );
  }

  Widget _statusLegend() {
    return StatusLegend(statuses: processTypes);
  }
}
