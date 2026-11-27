import 'package:flutter/widgets.dart';

import '../../sheet_viewer.dart';

@immutable
final class PieceTapEvent {
  const PieceTapEvent({
    required this.piece,
    required this.localPosition,
    required this.globalPosition,
  });

  /// Piece that was tapped.
  final Piece piece;

  /// Position inside the SheetViewer.
  final Offset localPosition;

  /// Global screen position.
  final Offset globalPosition;
}
