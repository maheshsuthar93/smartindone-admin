import 'package:flutter/cupertino.dart';

import '../enums/enums.dart';

extension ResponsiveExt on BuildContext {
  double get safeHeight {
    // Highly efficient approach in modern Flutter
    final double totalHeight = MediaQuery.sizeOf(this).height;

    // Calculate padding (status bar & system navigation bar)
    final double topPadding = MediaQuery.paddingOf(this).top;
    final double bottomPadding = MediaQuery.paddingOf(this).bottom;

    // Remaining usable height
    final double safeHeight = totalHeight - topPadding - bottomPadding;

    return safeHeight;
  }

  ScreenType get screnType {
    final size = MediaQuery.sizeOf(this);

    // Desktop
    if (size.width >= 1200) {
      return ScreenType.desktop;
    }

    // Tablet
    if (size.shortestSide >= 600) {
      return ScreenType.tablet;
    }

    return ScreenType.mobile;
  }
}
