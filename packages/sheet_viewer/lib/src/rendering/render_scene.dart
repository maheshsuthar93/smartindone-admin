import 'package:flutter/foundation.dart';

import '../../sheet_viewer.dart';

/// A piece prepared for rendering.
///
/// The bounds are already transformed into screen coordinates,
/// so renderers don't need to perform any viewport math.
@immutable
final class RenderPiece {
  const RenderPiece({required this.piece, required this.bounds});

  /// Original domain model.
  final Piece piece;

  /// Bounds in screen coordinates.
  final PieceBounds bounds;
}

/// Represents everything that will be rendered for the current frame.
///
/// It is rebuilt once per frame and shared between all renderers.
@immutable
final class RenderScene {
  const RenderScene({this.pieces = const <RenderPiece>[]});

  /// Visible pieces only.
  final List<RenderPiece> pieces;

  bool get isEmpty => pieces.isEmpty;

  int get pieceCount => pieces.length;
}
