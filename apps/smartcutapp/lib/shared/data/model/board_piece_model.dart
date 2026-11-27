import 'dart:ui';

class BoardPieceModel {
  final String id;
  final String boardId;
  final String pieceId;
  final double x;
  final double y;
  final double width;
  final double height;
  final bool rotated;
  final bool isOffcut;
  final Color color;
  bool isSelected;

  BoardPieceModel({
    required this.id,
    required this.boardId,
    required this.pieceId,
    required this.x,
    required this.y,
    required this.width,
    required this.height,
    required this.rotated,
    this.isOffcut = false,
    required this.color,
    this.isSelected = false,
  });
}
