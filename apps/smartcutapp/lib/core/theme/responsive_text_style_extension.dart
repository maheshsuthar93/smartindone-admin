import 'package:flutter/material.dart';

import 'app_typography_scale.dart';

extension ResponsiveTextStyleExtension on TextStyle {
  TextStyle responsive(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;

    final scale = switch (width) {
      < 600 => AppTypographyScale.mobile,
      < 1024 => AppTypographyScale.tablet,
      < 1440 => AppTypographyScale.desktop,
      _ => AppTypographyScale.largeDesktop,
    };

    return copyWith(
      fontSize: (fontSize ?? 14) * scale,
    );
  }
}