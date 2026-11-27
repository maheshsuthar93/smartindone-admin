import 'package:flutter/widgets.dart';

enum ViewerLayout { mobile, tablet, desktop }

extension ViewerLayoutExtension on BuildContext {
  ViewerLayout get viewerLayout {
    final size = MediaQuery.sizeOf(this);
    final shortestSide = size.shortestSide;

    if (shortestSide < 600) {
      return ViewerLayout.mobile;
    }

    if (shortestSide < 1024) {
      return ViewerLayout.tablet;
    }

    return ViewerLayout.desktop;
  }

  bool get isMobile => viewerLayout == ViewerLayout.mobile;

  bool get isTablet => viewerLayout == ViewerLayout.tablet;

  bool get isDesktop => viewerLayout == ViewerLayout.desktop;

  bool get isLandscape =>
      MediaQuery.orientationOf(this) == Orientation.landscape;
}