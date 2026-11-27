import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../sheet_viewer.dart';
import '../controllers/viewport_transform.dart';
import 'cache/render_cache.dart';

@immutable
final class RenderContext {
  const RenderContext({
    required this.size,
    required this.controller,
    required this.theme,
    required this.transform,
    required this.cache,
  });

  /// Size of the CustomPaint.
  final Size size;

  /// Viewer controller.
  final SheetViewerController controller;

  /// Active theme.
  final SheetViewerThemeData theme;

  /// Coordinate transformer.
  final ViewportTransform transform;

  /// Rendering caches.
  final RenderCache cache;

  //--------------------------------------------------------------------------
  // Convenience Getters
  //--------------------------------------------------------------------------
  String? get selectedPiece => controller.selectedPiece;

  Sheet get sheet => controller.currentSheet;

  double get scale => controller.viewport.scale;

  Offset get offset => controller.viewport.offset;

  Piece? get hoveredPiece => controller.hoveredPiece;

  PieceStatus statusOf(Piece piece) {
    return controller.status.statusOf(piece);
  }

  Color statusColorOf(Piece piece) {
    return controller.status.colorById(piece.id) ??
        theme.statusTheme.colorOf(statusOf(piece));
  }

  bool isSelected(Piece piece) {
    return selectedPiece == piece.id;
  }

  //--------------------------------------------------------------------------
  // Coordinate Helpers
  //--------------------------------------------------------------------------

  Offset toScreen(Offset point) {
    return transform.toScreen(point);
  }

  Offset toWorld(Offset point) {
    return transform.toWorld(point);
  }

  PieceBounds toScreenBounds(PieceBounds bounds) {
    return transform.toScreenBounds(bounds);
  }

  PieceBounds toWorldBounds(PieceBounds bounds) {
    return transform.toWorldBounds(bounds);
  }

  double toScreenLength(double value) {
    return transform.toScreenLength(value);
  }

  double toWorldLength(double value) {
    return transform.toWorldLength(value);
  }

  //--------------------------------------------------------------------------
  // Sheet Helpers
  //--------------------------------------------------------------------------

  Rect get sheetRect {
    return toScreenBounds(
      PieceBounds(x: 0, y: 0, width: sheet.width, height: sheet.height),
    ).rect;
  }

  //--------------------------------------------------------------------------
  // Material Helpers
  //--------------------------------------------------------------------------

  SheetMaterial? materialFor(Piece piece) {
    return controller.layout.materialById(piece.materialId);
  }

  //--------------------------------------------------------------------------
  // Hover Helpers
  //--------------------------------------------------------------------------

  bool isHovered(Piece piece) {
    return hoveredPiece?.id == piece.id;
  }
}
