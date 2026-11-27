import 'dart:ui';

import 'oriented_piece_model.dart';

class PieceModelOld {
  final String id;
  final double width;
  final double height;

  // Allow rotation of the piece to fit better in the sheet e.g. 10x20 can be rotated to 20x10
  final bool canRotate;
  final Color color;

  PieceModelOld(
    this.id,
    this.width,
    this.height, {
    this.canRotate = true,
    required this.color,
  });

  List<OrientedPiece> get orientations {
    if (!canRotate || width == height) {
      return [OrientedPiece(id, width, height, false)];
    }
    return [
      OrientedPiece(id, width, height, false),
      OrientedPiece(id, height, width, true),
    ];
  }
}
