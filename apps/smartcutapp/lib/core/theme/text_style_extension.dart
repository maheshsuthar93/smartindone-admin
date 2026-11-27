import 'package:flutter/material.dart';

extension TextStyleExtension on TextStyle {
  //--------------------------------------------------------------------------
  // Font Weights
  //--------------------------------------------------------------------------

  TextStyle get thin => copyWith(fontWeight: FontWeight.w100);

  TextStyle get extraLight => copyWith(fontWeight: FontWeight.w200);

  TextStyle get light => copyWith(fontWeight: FontWeight.w300);

  TextStyle get regular => copyWith(fontWeight: FontWeight.w400);

  TextStyle get medium => copyWith(fontWeight: FontWeight.w500);

  TextStyle get semiBold => copyWith(fontWeight: FontWeight.w600);

  TextStyle get bold => copyWith(fontWeight: FontWeight.w700);

  TextStyle get extraBold => copyWith(fontWeight: FontWeight.w800);

  TextStyle get black => copyWith(fontWeight: FontWeight.w900);

  //--------------------------------------------------------------------------
  // Colors
  //--------------------------------------------------------------------------

  TextStyle color(Color color) => copyWith(color: color);

  //--------------------------------------------------------------------------
  // Font Size
  //--------------------------------------------------------------------------

  TextStyle size(double size) => copyWith(fontSize: size);

  //--------------------------------------------------------------------------
  // Line Height
  //--------------------------------------------------------------------------

  TextStyle height(double height) => copyWith(height: height);

  //--------------------------------------------------------------------------
  // Letter Spacing
  //--------------------------------------------------------------------------

  TextStyle letterSpacing(double value) => copyWith(letterSpacing: value);

  //--------------------------------------------------------------------------
  // Font Family
  //--------------------------------------------------------------------------

  TextStyle family(String family) => copyWith(fontFamily: family);

  //--------------------------------------------------------------------------
  // Font Style
  //--------------------------------------------------------------------------

  TextStyle get italic => copyWith(fontStyle: FontStyle.italic);

  TextStyle get normal => copyWith(fontStyle: FontStyle.normal);

  //--------------------------------------------------------------------------
  // Decorations
  //--------------------------------------------------------------------------

  TextStyle get underline => copyWith(decoration: TextDecoration.underline);

  TextStyle get lineThrough => copyWith(decoration: TextDecoration.lineThrough);

  TextStyle get overline => copyWith(decoration: TextDecoration.overline);

  TextStyle get noDecoration => copyWith(decoration: TextDecoration.none);
}
