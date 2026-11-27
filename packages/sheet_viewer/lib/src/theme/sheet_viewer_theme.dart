import 'package:flutter/material.dart';
import 'package:sheet_viewer/src/theme/sheet_viewer_theme_data.dart';

/// Provides theme data for the Sheet Viewer.
///
/// Wrap your viewer with [SheetViewerTheme] to customize its appearance.
class SheetViewerTheme extends InheritedWidget {
  const SheetViewerTheme({super.key, required this.data, required super.child});

  final SheetViewerThemeData data;

  static SheetViewerThemeData of(BuildContext context) {
    return context
            .dependOnInheritedWidgetOfExactType<SheetViewerTheme>()
            ?.data ??
        const SheetViewerThemeData();
  }

  @override
  bool updateShouldNotify(covariant SheetViewerTheme oldWidget) {
    return oldWidget.data != data;
  }
}
