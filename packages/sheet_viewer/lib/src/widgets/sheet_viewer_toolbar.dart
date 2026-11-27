import 'package:flutter/material.dart';
import 'package:sheet_viewer/src/utils/viewer_breakpoints.dart';
import 'package:sheet_viewer/src/widgets/sheet_navigator.dart';

import '../../sheet_viewer.dart';

class SheetViewerToolbar extends StatelessWidget {
  const SheetViewerToolbar({
    super.key,
    required this.controller,
    required this.callbacks,
  });

  final SheetViewerController controller;
  final SheetViewerCallbacks callbacks;

  @override
  Widget build(BuildContext context) {
    final layout = context.viewerLayout;
    final theme = Theme.of(context);

    return AnimatedBuilder(
      animation: controller,
      builder: (_, _) {
        final current = controller.currentSheetIndex + 1;
        final total = controller.layout.sheets.length;
        final zoom = (controller.scale * 100).round();

        return SizedBox(
          height: layout == ViewerLayout.mobile ? 108 : 60,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: switch (layout) {
              ViewerLayout.mobile => _buildMobile(theme, current, total, zoom),
              ViewerLayout.tablet => _buildTablet(theme, current, total, zoom),
              ViewerLayout.desktop => _buildDesktop(
                theme,
                current,
                total,
                zoom,
              ),
            },
          ),
        );
      },
    );
  }

  //----------------------------------------------------------------------------
  // Desktop
  //----------------------------------------------------------------------------

  Widget _buildDesktop(ThemeData theme, int current, int total, int zoom) {
    return Row(
      children: [
        _sheetChip(current, total),

        const SizedBox(width: 8),

        _navigationButtons(current, total),

        const SizedBox(width: 8),

        Expanded(
          child: Align(
            alignment: Alignment.centerLeft,
            child: SheetNavigator(controller: controller),
          ),
        ),

        _zoomButtons(),

        const SizedBox(width: 8),

        _fitButton(),

        const SizedBox(width: 12),

        _zoomChip(theme, zoom),
      ],
    );
  }

  //----------------------------------------------------------------------------
  // Tablet
  //----------------------------------------------------------------------------

  Widget _buildTablet(ThemeData theme, int current, int total, int zoom) {
    return Row(
      children: [
        _sheetChip(current, total),

        const SizedBox(width: 8),

        _navigationButtons(current, total),

        const Spacer(),

        _zoomButtons(),

        const SizedBox(width: 8),

        _fitButton(),

        const SizedBox(width: 12),

        _zoomChip(theme, zoom),
      ],
    );
  }

  //----------------------------------------------------------------------------
  // Mobile
  //----------------------------------------------------------------------------

  Widget _buildMobile(ThemeData theme, int current, int total, int zoom) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _sheetChip(current, total),
            Row(
              children: [
                IconButton(
                  tooltip: 'Previous Sheet',
                  onPressed: current > 1 ? controller.previousSheet : null,
                  icon: const Icon(Icons.chevron_left),
                ),
                IconButton(
                  tooltip: 'Next Sheet',
                  onPressed: current < total ? controller.nextSheet : null,
                  icon: const Icon(Icons.chevron_right),
                ),
              ],
            ),
          ],
        ),

        const SizedBox(height: 8),

        Row(
          children: [
            _zoomButtons(),

            const SizedBox(width: 8),

            _fitButton(),

            const Spacer(),

            _zoomChip(theme, zoom),
          ],
        ),
      ],
    );
  }

  //----------------------------------------------------------------------------
  // Common Widgets
  //----------------------------------------------------------------------------

  Widget _sheetChip(int current, int total) {
    return Chip(
      avatar: const Icon(Icons.dashboard_outlined, size: 18),
      label: Text('Sheet $current / $total'),
    );
  }

  Widget _navigationButtons(int current, int total) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          tooltip: 'Previous Sheet',
          onPressed: current > 1
              ? () {
                  controller.previousSheet();

                  callbacks.onSheetChanged?.call(
                    SheetChangedEvent(
                      sheet: controller.currentSheet,
                      index: controller.currentSheetIndex,
                    ),
                  );
                }
              : null,
          icon: const Icon(Icons.chevron_left),
        ),
        IconButton(
          tooltip: 'Next Sheet',
          onPressed: current < total
              ? () {
                  controller.nextSheet();

                  callbacks.onSheetChanged?.call(
                    SheetChangedEvent(
                      sheet: controller.currentSheet,
                      index: controller.currentSheetIndex,
                    ),
                  );
                }
              : null,
          icon: const Icon(Icons.chevron_right),
        ),
      ],
    );
  }

  Widget _zoomButtons() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          tooltip: 'Zoom Out',
          onPressed: controller.zoomOut,
          icon: const Icon(Icons.remove),
        ),

        IconButton(
          tooltip: 'Zoom In',
          onPressed: controller.zoomIn,
          icon: const Icon(Icons.add),
        ),
      ],
    );
  }

  Widget _fitButton() {
    return FilledButton.icon(
      onPressed: controller.fitToScreen,
      icon: const Icon(Icons.fit_screen),
      label: const Text('Fit'),
    );
  }

  Widget _zoomChip(ThemeData theme, int zoom) {
    return Chip(label: Text('$zoom%', style: theme.textTheme.labelLarge));
  }
}
