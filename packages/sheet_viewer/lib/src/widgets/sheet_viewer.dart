import 'package:flutter/material.dart';
import 'package:sheet_viewer/src/widgets/sheet_viewer_status_bar.dart';

import '../../sheet_viewer.dart';
import '../theme/sheet_viewer_theme.dart';
import 'viewer_card.dart';

class SheetViewer extends StatelessWidget {
  const SheetViewer({
    super.key,
    required this.controller,
    this.theme = const SheetViewerThemeData(),
    this.callbacks = SheetViewerCallbacks.empty,
    this.showToolbar = true,
    this.padding = const EdgeInsets.all(16),
    this.processTypes,
  });

  final SheetViewerController controller;
  final SheetViewerThemeData theme;
  final SheetViewerCallbacks callbacks;

  /// Shows the top toolbar.
  final bool showToolbar;
  final EdgeInsetsGeometry padding;
  final List<ProcessTypeLegendItem>? processTypes;

  @override
  Widget build(BuildContext context) {
    final fontFamily = Theme.of(context).textTheme.bodyMedium?.fontFamily;

    return SheetViewerTheme(
      data: theme.copyWith(
        labelStyle: _inheritFontFamily(theme.labelStyle, fontFamily),
        titleStyle: _inheritFontFamily(theme.titleStyle, fontFamily),
        subtitleStyle: _inheritFontFamily(theme.subtitleStyle, fontFamily),
        dimensionStyle: _inheritFontFamily(theme.dimensionStyle, fontFamily),
      ),
      child: Padding(
        padding: padding,
        child: Column(
          children: [
            if (showToolbar)
              ViewerCard(
                child: SheetViewerToolbar(
                  controller: controller,
                  callbacks: callbacks,
                ),
              ),

            if (showToolbar) const SizedBox(height: 12),

            Expanded(
              child: ViewerCard(
                child: SheetView(controller: controller, callbacks: callbacks),
              ),
            ),
            const SizedBox(height: 12),

            ViewerCard(
              child: SheetViewerStatusBar(
                controller: controller,
                processTypes: processTypes,
              ),
            ),
          ],
        ),
      ),
    );
  }

  TextStyle _inheritFontFamily(TextStyle style, String? fontFamily) =>
      style.fontFamily == null && fontFamily != null
      ? style.copyWith(fontFamily: fontFamily)
      : style;
}
