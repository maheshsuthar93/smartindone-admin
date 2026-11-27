import 'package:flutter/material.dart';

import '../../theme/sheet_viewer_theme_data.dart';

final class PaintCache {
  PaintCache(this._theme);

  late SheetViewerThemeData _theme;

  Paint? _background;
  Paint? _sheet;
  Paint? _sheetBorder;
  Paint? _grid;
  Paint? _pieceBorder;
  Paint? _grain;
  Paint? _hover;
  Paint? _selection;
  Paint? _edgeBand;
  Paint? _hoverBorder;
  Paint? _pieceShadow;
  Paint? _selectionHandle;

  Paint get selectionHandle => _selectionHandle ??= Paint()
    ..color = _theme.selectionHandleColor
    ..style = PaintingStyle.fill;

  Paint get pieceShadow => _pieceShadow ??= Paint()
    ..color = _theme.pieceShadowColor
    ..style = PaintingStyle.fill;

  Paint get background => _background ??= Paint()
    ..color = _theme.backgroundColor
    ..style = PaintingStyle.fill;

  Paint get sheet => _sheet ??= Paint()
    ..color = _theme.sheetColor
    ..style = PaintingStyle.fill;

  Paint get sheetBorder => _sheetBorder ??= Paint()
    ..color = _theme.sheetBorderColor
    ..strokeWidth = _theme.sheetBorderWidth
    ..style = PaintingStyle.stroke;

  Paint get grid => _grid ??= Paint()
    ..color = _theme.gridColor
    ..strokeWidth = _theme.gridLineWidth
    ..style = PaintingStyle.stroke;

  Paint get pieceBorder => _pieceBorder ??= Paint()
    ..color = _theme.pieceBorderColor
    ..strokeWidth = _theme.pieceBorderWidth
    ..style = PaintingStyle.stroke;

  Paint get grain => _grain ??= Paint()
    ..color = _theme.grainColor
    ..style = PaintingStyle.stroke
    ..strokeWidth = _theme.grainStrokeWidth;

  Paint get hover => _hover ??= Paint()
    ..color = _theme.hoverColor
    ..style = PaintingStyle.fill;

  Paint get selection => _selection ??= Paint()
    ..color = _theme.selectionColor
    ..style = PaintingStyle.stroke
    ..strokeWidth = _theme.selectionStrokeWidth;

  Paint get hoverBorder => _hoverBorder ??= Paint()
    ..color = _theme.hoverBorderColor
    ..style = PaintingStyle.stroke
    ..strokeWidth = 2;

  Paint get edgeBand => _edgeBand ??= Paint()
    ..color = _theme.edgeBandColor
    ..strokeWidth = _theme.edgeBandWidth
    ..style = PaintingStyle.stroke
    ..strokeCap = StrokeCap.square;

  void updateTheme(SheetViewerThemeData theme) {
    if (_theme == theme) return;

    _theme = theme;

    _background = null;
    _sheet = null;
    _sheetBorder = null;
    _grid = null;
    _pieceBorder = null;
    _grain = null;
    _hover = null;
    _selection = null;
    _edgeBand = null;
  }
}
