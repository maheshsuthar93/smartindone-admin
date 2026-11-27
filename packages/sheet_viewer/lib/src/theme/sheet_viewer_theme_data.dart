import 'package:flutter/material.dart';
import 'package:sheet_viewer/src/theme/piece_status_theme.dart';

import '../models/label_mode.dart';

@immutable
class SheetViewerThemeData {
  const SheetViewerThemeData({
    this.sheetBorderWidth = 1,
    // Background
    this.backgroundColor = Colors.white,

    // Sheet
    this.sheetColor = Colors.white,
    this.sheetBorderColor = const Color(0xFFBDBDBD),
    this.showSheetShadow = true,
    this.sheetShadowColor = const Color(0x33000000),

    // Grid
    this.showGrid = true,
    this.gridColor = const Color(0xFFE0E0E0),
    this.gridSpacing = 50,
    this.gridLineWidth = 1,

    // Pieces
    this.pieceBorderColor = const Color(0xFF424242),
    this.pieceBorderWidth = 1,

    // Hover & Selection
    this.hoverColor = const Color(0x33007AFF),

    // Labels
    this.showLabels = true,
    this.labelStyle = const TextStyle(fontSize: 12, color: Colors.black87),
    this.titleStyle = const TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w600,
    ),
    this.subtitleStyle = const TextStyle(fontSize: 11, color: Colors.black54),

    // Edge Band
    this.edgeBandThickness = 4,
    this.hoverBorderColor = const Color(0xff1976D2),

    this.pieceCornerRadius = 4,
    this.showPieceShadow = true,
    this.pieceShadowColor = const Color(0x22000000),
    this.pieceShadowElevation = 2,
    this.hoverOpacity = 0.15,

    this.labelMode = LabelMode.name,

    this.minLabelSize = 20,
    this.compactLabelSize = 40,
    this.detailedLabelSize = 80,

    // Grain
    this.showGrain = true,
    this.grainColor = const Color(0x55000000),
    this.grainSpacing = 12,
    this.grainStrokeWidth = 1,
    this.edgeBandWidth = 3,
    this.edgeBandColor = const Color(0xFF1565C0),
    this.showEdgeBand = true,
    this.showDimensions = true,
    this.dimensionStyle = const TextStyle(fontSize: 10, color: Colors.black54),
    this.selectionColor = const Color(0xFF1976D2),
    this.selectionStrokeWidth = 2.5,
    this.selectionHandleColor = Colors.white,
    this.statusTheme = const PieceStatusTheme(),
  });

  final PieceStatusTheme statusTheme;

  final Color selectionHandleColor;
  final bool showDimensions;

  final TextStyle dimensionStyle;

  final bool showEdgeBand;

  final double edgeBandWidth;

  final Color edgeBandColor;

  final double selectionStrokeWidth;

  //--------------------------------------------------------------------------
  // Background
  //--------------------------------------------------------------------------

  final Color backgroundColor;

  final double sheetBorderWidth;

  //--------------------------------------------------------------------------
  // Sheet
  //--------------------------------------------------------------------------

  final Color sheetColor;
  final Color sheetBorderColor;

  final bool showSheetShadow;
  final Color sheetShadowColor;

  //--------------------------------------------------------------------------
  // Grid
  //--------------------------------------------------------------------------

  final bool showGrid;
  final Color gridColor;
  final double gridSpacing;
  final double gridLineWidth;

  //--------------------------------------------------------------------------
  // Pieces
  //--------------------------------------------------------------------------

  final Color pieceBorderColor;
  final double pieceBorderWidth;

  //--------------------------------------------------------------------------
  // Hover & Selection
  //--------------------------------------------------------------------------

  final Color hoverColor;
  final Color selectionColor;

  //--------------------------------------------------------------------------
  // Grain
  //--------------------------------------------------------------------------

  final bool showGrain;
  final Color grainColor;
  final double grainStrokeWidth;
  final double grainSpacing;
  final Color hoverBorderColor;

  //--------------------------------------------------------------------------
  // Labels
  //--------------------------------------------------------------------------

  final bool showLabels;
  final TextStyle labelStyle;
  final TextStyle titleStyle;
  final TextStyle subtitleStyle;

  //--------------------------------------------------------------------------
  // Edge Band
  //--------------------------------------------------------------------------

  final double edgeBandThickness;

  final double pieceCornerRadius;

  final bool showPieceShadow;

  final Color pieceShadowColor;

  final double pieceShadowElevation;

  final double hoverOpacity;
  final LabelMode labelMode;
  final double minLabelSize;
  final double compactLabelSize;
  final double detailedLabelSize;

  SheetViewerThemeData copyWith({
    Color? backgroundColor,
    Color? sheetColor,
    Color? sheetBorderColor,
    bool? showSheetShadow,
    Color? sheetShadowColor,
    bool? showGrid,
    Color? gridColor,
    double? gridSpacing,
    double? gridLineWidth,
    Color? pieceBorderColor,
    double? pieceBorderWidth,
    Color? hoverColor,
    Color? selectionColor,
    bool? showGrain,
    Color? grainColor,
    double? grainStrokeWidth,
    bool? showLabels,
    TextStyle? labelStyle,
    TextStyle? titleStyle,
    TextStyle? subtitleStyle,
    TextStyle? dimensionStyle,
    Color? edgeBandColor,
    double? edgeBandThickness,
  }) {
    return SheetViewerThemeData(
      backgroundColor: backgroundColor ?? this.backgroundColor,
      sheetColor: sheetColor ?? this.sheetColor,
      sheetBorderColor: sheetBorderColor ?? this.sheetBorderColor,
      showSheetShadow: showSheetShadow ?? this.showSheetShadow,
      sheetShadowColor: sheetShadowColor ?? this.sheetShadowColor,
      showGrid: showGrid ?? this.showGrid,
      gridColor: gridColor ?? this.gridColor,
      gridSpacing: gridSpacing ?? this.gridSpacing,
      gridLineWidth: gridLineWidth ?? this.gridLineWidth,
      pieceBorderColor: pieceBorderColor ?? this.pieceBorderColor,
      pieceBorderWidth: pieceBorderWidth ?? this.pieceBorderWidth,
      hoverColor: hoverColor ?? this.hoverColor,
      selectionColor: selectionColor ?? this.selectionColor,
      showGrain: showGrain ?? this.showGrain,
      grainColor: grainColor ?? this.grainColor,
      grainStrokeWidth: grainStrokeWidth ?? this.grainStrokeWidth,
      showLabels: showLabels ?? this.showLabels,
      labelStyle: labelStyle ?? this.labelStyle,
      titleStyle: titleStyle ?? this.titleStyle,
      subtitleStyle: subtitleStyle ?? this.subtitleStyle,
      dimensionStyle: dimensionStyle ?? this.dimensionStyle,
      edgeBandColor: edgeBandColor ?? this.edgeBandColor,
      edgeBandThickness: edgeBandThickness ?? this.edgeBandThickness,
    );
  }

  // Color statusColor(PieceStatus status) {
  //   switch (status) {
  //     case PieceStatus.pending:
  //       return pendingStatusColor;
  //
  //     case PieceStatus.cutting:
  //       return cuttingStatusColor;
  //
  //     case PieceStatus.edgeBanding:
  //       return edgeBandingStatusColor;
  //
  //     case PieceStatus.drilling:
  //       return drillingStatusColor;
  //
  //     case PieceStatus.cnc:
  //       return cncStatusColor;
  //
  //     case PieceStatus.qualityCheck:
  //       return qualityCheckStatusColor;
  //
  //     case PieceStatus.completed:
  //       return completedStatusColor;
  //
  //     case PieceStatus.rejected:
  //       return rejectedStatusColor;
  //   }
  // }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SheetViewerThemeData &&
          runtimeType == other.runtimeType &&
          backgroundColor == other.backgroundColor &&
          sheetColor == other.sheetColor &&
          sheetBorderColor == other.sheetBorderColor &&
          showSheetShadow == other.showSheetShadow &&
          sheetShadowColor == other.sheetShadowColor &&
          showGrid == other.showGrid &&
          gridColor == other.gridColor &&
          gridSpacing == other.gridSpacing &&
          gridLineWidth == other.gridLineWidth &&
          pieceBorderColor == other.pieceBorderColor &&
          pieceBorderWidth == other.pieceBorderWidth &&
          hoverColor == other.hoverColor &&
          selectionColor == other.selectionColor &&
          showGrain == other.showGrain &&
          grainColor == other.grainColor &&
          grainStrokeWidth == other.grainStrokeWidth &&
          showLabels == other.showLabels &&
          labelStyle == other.labelStyle &&
          titleStyle == other.titleStyle &&
          subtitleStyle == other.subtitleStyle &&
          dimensionStyle == other.dimensionStyle &&
          edgeBandColor == other.edgeBandColor &&
          edgeBandThickness == other.edgeBandThickness;

  @override
  int get hashCode => Object.hashAll([
    backgroundColor,
    sheetColor,
    sheetBorderColor,
    showSheetShadow,
    sheetShadowColor,
    showGrid,
    gridColor,
    gridSpacing,
    gridLineWidth,
    pieceBorderColor,
    pieceBorderWidth,
    hoverColor,
    selectionColor,
    showGrain,
    grainColor,
    grainStrokeWidth,
    showLabels,
    labelStyle,
    titleStyle,
    subtitleStyle,
    dimensionStyle,
    edgeBandColor,
    edgeBandThickness,
  ]);
}
