import 'dart:ui';

import 'package:flutter/foundation.dart';

import '../events/piece_interaction_event.dart';
import '../events/sheet_changed_event.dart';

@immutable
final class SheetViewerCallbacks {
  const SheetViewerCallbacks({
    this.onPieceTap,
    this.onPieceDoubleTap,
    this.onPieceHover,
    this.onBackgroundTap,
    this.onZoomChanged,
    this.onPanChanged,
    this.onSheetChanged,
  });

  /// Called when a piece is clicked.
  final ValueChanged<PieceInteractionEvent>? onPieceTap;

  /// Called when a piece is double-clicked.
  final ValueChanged<PieceInteractionEvent>? onPieceDoubleTap;

  /// Called when the hovered piece changes.
  final ValueChanged<PieceInteractionEvent?>? onPieceHover;

  /// Called when empty sheet area is clicked.
  final VoidCallback? onBackgroundTap;

  /// Current zoom factor.
  final ValueChanged<double>? onZoomChanged;

  /// Current pan offset.
  final ValueChanged<Offset>? onPanChanged;
  final ValueChanged<SheetChangedEvent>? onSheetChanged;
  static const empty = SheetViewerCallbacks();
}
