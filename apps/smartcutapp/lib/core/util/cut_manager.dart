import 'dart:ui';

import 'package:board_cut/shared/shared.dart';

abstract class CutManager {
  static const double sheetWidth = 2440.0;
  static const double sheetHeight = 1220.0;
  static const double bladeThickness = 4.0; // Kerf width

  /// Sort pieces by area in descending order e.g. largest area first
  static List<PieceModelOld> sortPiecesByArea(List<PieceModelOld> pieces) {
    pieces.sort((a, b) => (b.width * b.height).compareTo(a.width * a.height));
    return pieces;
  }

  /// Calculate the cut width after accounting for bands on the left edge and right edge
  /// Write example: If Original Width is 100, leftEdge is 2, rightEdge is 1, then the cut width is 100 - 2 - 1 = 97
  static double calculateCutWidth({
    required double finalWidth,
    double leftEdgeThickness = 0,
    double rightEdgeThickness = 0,
    double trimAllowance = 0, // optional
  }) {
    return finalWidth - leftEdgeThickness - rightEdgeThickness + trimAllowance;
  }

  /// Calculate the cut height after accounting for bands on the top edge and bottom edge
  /// Write example: If Original Height is 100, topEdge is 2, bottomEdge is 1, then the cut height is 100 - 2 - 1 = 97
  static double calculateCutHeight({
    required double finalHeight,
    double topEdgeThickness = 0,
    double bottomEdgeThickness = 0,
    double trimAllowance = 0, // optional extra cutting tolerance
  }) {
    final cutHeight =
        finalHeight - topEdgeThickness - bottomEdgeThickness + trimAllowance;

    if (cutHeight <= 0) {
      throw ArgumentError(
        "Calculated cut height is invalid (<= 0). Check band thickness.",
      );
    }

    return cutHeight;
  }

  static CutResult cutList(
    String boardId,
    List<PieceModelOld> pieces,
    bool isHorizontal,
  ) {
    final sortedPieces = CutManager.sortPiecesByArea(pieces);

    final sheetW = isHorizontal ? sheetHeight : sheetWidth;
    final sheetH = isHorizontal ? sheetWidth : sheetHeight;
    List<FreeRect> free = [FreeRect(0, 0, sheetW, sheetH)];
    List<BoardPieceModel> placed = [];
    List<BoardPieceModel> offCutPlaced = [];

    List<PieceModelOld> unplaced = [];

    for (final piece in sortedPieces) {
      bool done = false;

      for (int i = 0; i < free.length && !done; i++) {
        final f = free[i];

        for (final rotated in [false, true]) {
          if (rotated && !piece.canRotate) continue;

          final pw = (rotated ? piece.height : piece.width) + bladeThickness;
          final ph = (rotated ? piece.width : piece.height) + bladeThickness;

          // This fits in the free rectangle
          if (pw <= f.width && ph <= f.height) {
            placed.add(
              BoardPieceModel(
                id: piece.id,
                pieceId: piece.id,
                boardId: boardId,
                x: f.x,
                y: f.y,
                width: pw,
                height: ph,
                rotated: rotated,
                color: piece.color,
              ),
            );

            // Update free rectangles
            free.removeAt(i);

            // Create new free rectangles from the remaining space
            // Please draw this out to understand why this works
            free.add(FreeRect(f.x + pw, f.y, f.width - pw, ph));
            free.add(FreeRect(f.x, f.y + ph, f.width, f.height - ph));

            free.removeWhere((r) => r.width <= 0 || r.height <= 0);
            done = true;
            break;
          }
        }
      }

      if (!done) {
        unplaced.add(piece);
      }
    }
    for (final f in free) {
      offCutPlaced.add(
        BoardPieceModel(
          pieceId: 'free',
          id: 'free',
          boardId: boardId,
          x: f.x,
          y: f.y,
          width: f.width,
          height: f.height,
          rotated: false,
          color: const Color(0xffffffff),
          isOffcut: true,
        ),
      );
    }

    return CutResult(
      placements: placed,
      unplacedPieces: unplaced,
      offCutPlacements: offCutPlaced,
    );
  }

  static List<BoardModel> cutIntoMultipleBoards(
    List<PieceModelOld> pieces,
    bool isHorizontal,
  ) {
    List<BoardModel> boards = [];
    List<PieceModelOld> remaining = List.from(pieces);

    int safety = 0; // prevent infinite loop
    int boardId = 1;
    while (remaining.isNotEmpty && safety < 100) {
      final bId = 'Board_$boardId';
      final result = cutList(bId, remaining, isHorizontal);

      if (result.placements.isEmpty) {
        throw Exception('Some pieces are larger than the sheet size');
      }

      final placements = result.placements + result.offCutPlacements;

      boards.add(
        BoardModel(
          id: bId,
          materialCode: '',
          sheetWidth: sheetWidth,
          sheetHeight: sheetHeight,
          placements: placements,
        ),
      );
      //boards.add(result.offCutPlacements);
      remaining = result.unplacedPieces;
      boardId++;
      safety++;
    }

    return boards;
  }

  static double calculateWastePercent({
    required double sheetWidth,
    required double sheetHeight,
    required int totalBoards,
    required List<BoardPieceModel> pieces,
  }) {
    final sheetArea = sheetWidth * sheetHeight;
    final totalSheetArea = sheetArea * totalBoards;

    double usedArea = 0;

    for (final p in pieces) {
      if (!p.isOffcut) {
        usedArea += p.width * p.height;
      }
    }

    final wasteArea = totalSheetArea - usedArea;

    return (wasteArea / totalSheetArea) * 100;
  }
}
