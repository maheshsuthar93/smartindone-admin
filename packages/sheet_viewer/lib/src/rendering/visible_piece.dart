import 'package:flutter/foundation.dart';

import '../../sheet_viewer.dart';

@immutable
final class VisiblePiece {
  const VisiblePiece({required this.piece, required this.bounds});

  final Piece piece;

  /// Already transformed to screen space.
  final PieceBounds bounds;
}
