import 'package:flutter/material.dart';

import 'package:board_cut/core/enums/enums.dart';

abstract class ResponsiveHelper {
  static ScreenType getScreenType(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

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

  static double determineDialogHeight(ScreenType screenType) {
    switch (screenType) {
      case ScreenType.mobile:
        return 700.0;
      case ScreenType.tablet:
        return 550.0;
      case ScreenType.desktop:
        return 600.0;
    }
  }
}
