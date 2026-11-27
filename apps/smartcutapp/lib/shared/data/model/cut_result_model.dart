import 'package:board_cut/shared/shared.dart';


class CutResult {
  final List<BoardPieceModel> placements;
  final List<BoardPieceModel> offCutPlacements;
  final List<PieceModelOld> unplacedPieces;

  CutResult({
    required this.placements,
    required this.unplacedPieces,
    required this.offCutPlacements,
  });
}
