import 'board_piece_model.dart';

class BoardModel {
  final String id;
  final String materialCode;
  final double sheetWidth;
  final double sheetHeight;
  final List<BoardPieceModel> placements;
  bool isSelected;

  BoardModel({
    required this.id,
    required this.materialCode,
    this.sheetWidth = 1220,
    this.sheetHeight = 2440,
    required this.placements,
    this.isSelected = false,
  });
}
