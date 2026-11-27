import 'package:board_cut/gen/fonts.gen.dart';
import 'package:flutter/material.dart';

import 'app_font_size.dart';

abstract final class AppTextStyle {
  static const String fontFamily = FontFamily.montserrat;

  //--------------------------------------------------------------------------
  // Display
  //--------------------------------------------------------------------------

  static const displayLarge = TextStyle(
    fontFamily: fontFamily,
    fontSize: AppFontSize.displayLarge,
    fontWeight: FontWeight.w700,
    height: 1.10,
    letterSpacing: -0.50,
  );

  static const displayMedium = TextStyle(
    fontFamily: fontFamily,
    fontSize: AppFontSize.displayMedium,
    fontWeight: FontWeight.w700,
    height: 1.15,
    letterSpacing: -0.30,
  );

  static const displaySmall = TextStyle(
    fontFamily: fontFamily,
    fontSize: AppFontSize.displaySmall,
    fontWeight: FontWeight.w700,
    height: 1.20,
  );

  //--------------------------------------------------------------------------
  // Headline
  //--------------------------------------------------------------------------

  static const headlineLarge = TextStyle(
    fontFamily: fontFamily,
    fontSize: AppFontSize.headlineLarge,
    fontWeight: FontWeight.w700,
    height: 1.20,
  );

  static const headlineMedium = TextStyle(
    fontFamily: fontFamily,
    fontSize: AppFontSize.headlineMedium,
    fontWeight: FontWeight.w700,
    height: 1.25,
  );

  static const headlineSmall = TextStyle(
    fontFamily: fontFamily,
    fontSize: AppFontSize.headlineSmall,
    fontWeight: FontWeight.w700,
    height: 1.30,
  );

  //--------------------------------------------------------------------------
  // Title
  //--------------------------------------------------------------------------

  static const titleLarge = TextStyle(
    fontFamily: fontFamily,
    fontSize: AppFontSize.titleLarge,
    fontWeight: FontWeight.w600,
    height: 1.30,
  );

  static const titleMedium = TextStyle(
    fontFamily: fontFamily,
    fontSize: AppFontSize.titleMedium,
    fontWeight: FontWeight.w600,
    height: 1.35,
  );

  static const titleSmall = TextStyle(
    fontFamily: fontFamily,
    fontSize: AppFontSize.titleSmall,
    fontWeight: FontWeight.w600,
    height: 1.35,
  );
  static const titleXSmall = TextStyle(
    fontFamily: fontFamily,
    fontSize: AppFontSize.titleXSmall,
    fontWeight: FontWeight.w600,
    height: 1.35,
  );
  //--------------------------------------------------------------------------
  // Body
  //--------------------------------------------------------------------------

  static const bodyLarge = TextStyle(
    fontFamily: fontFamily,
    fontSize: AppFontSize.bodyLarge,
    fontWeight: FontWeight.w400,
    height: 1.50,
  );

  static const bodyMedium = TextStyle(
    fontFamily: fontFamily,
    fontSize: AppFontSize.bodyMedium,
    fontWeight: FontWeight.w400,
    height: 1.50,
  );

  static const bodySmall = TextStyle(
    fontFamily: fontFamily,
    fontSize: AppFontSize.bodySmall,
    fontWeight: FontWeight.w400,
    height: 1.45,
  );
  static const bodyXSmall = TextStyle(
    fontFamily: fontFamily,
    fontSize: AppFontSize.bodyXSmall,
    fontWeight: FontWeight.w400,
    height: 1.45,
  );

  //--------------------------------------------------------------------------
  // Label
  //--------------------------------------------------------------------------

  static const labelLarge = TextStyle(
    fontFamily: fontFamily,
    fontSize: AppFontSize.labelLarge,
    fontWeight: FontWeight.w500,
    height: 1.20,
    letterSpacing: 0.10,
  );

  static const labelMedium = TextStyle(
    fontFamily: fontFamily,
    fontSize: AppFontSize.labelMedium,
    fontWeight: FontWeight.w500,
    height: 1.20,
    letterSpacing: 0.30,
  );

  static const labelSmall = TextStyle(
    fontFamily: fontFamily,
    fontSize: AppFontSize.labelSmall,
    fontWeight: FontWeight.w500,
    height: 1.20,
    letterSpacing: 0.50,
  );
}
