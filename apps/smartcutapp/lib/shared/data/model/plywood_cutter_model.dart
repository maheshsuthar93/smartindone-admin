// import 'dart:ui';
//
// import 'package:board_cut/core/util/cut_manager.dart';
// import 'package:board_cut/shared/shared.dart';
// import 'package:flutter/cupertino.dart';
//
// import 'free_rect_model.dart';
//
// class PlywoodCutter {
//   final double sheetWidth;
//   final double sheetHeight;
//   final double kerf;
//
//   PlywoodCutter({
//     required this.sheetWidth,
//     required this.sheetHeight,
//     this.kerf = 4.0,
//   });
//
//   // Kerf = the width of material lost due to the saw blade
//
//   // Algorithm: Guillotine Cutting
//   // 1. Sort pieces by area (largest first)
//   // 2. For each piece, try to fit it into the first free rectangle
//   // 3. If it fits, place it and split the free rectangle into two smaller ones
//   // 4. If it doesn't fit, try the next free rectangle until all pieces are placed or no more fit
//
//   List<PlacementModel> cutList(List<PieceModel> pieces) {
//     final sortedPieces = CutManager.sortPiecesByArea(pieces);
//
//     List<FreeRect> free = [FreeRect(0, 0, sheetWidth, sheetHeight)];
//     List<PlacementModel> placed = [];
//
//     for (final piece in sortedPieces) {
//       bool done = false;
//
//       for (int i = 0; i < free.length && !done; i++) {
//         final f = free[i];
//
//         for (final rotated in [false, true]) {
//           if (rotated && !piece.canRotate) continue;
//
//           final pw = (rotated ? piece.height : piece.width) + kerf;
//           final ph = (rotated ? piece.width : piece.height) + kerf;
//
//           if (pw <= f.width && ph <= f.height) {
//             placed.add(
//               PlacementModel(
//                 pieceId: piece.id,
//                 x: f.x,
//                 y: f.y,
//                 width: pw,
//                 height: ph,
//                 rotated: rotated,
//                 color: piece.color,
//               ),
//             );
//
//             free.removeAt(i);
//
//             free.add(FreeRect(f.x + pw, f.y, f.width - pw, ph));
//             free.add(FreeRect(f.x, f.y + ph, f.width, f.height - ph));
//
//             free.removeWhere((r) => r.width <= 0 || r.height <= 0);
//             done = true;
//             break;
//           }
//         }
//       }
//     }
//     for (final f in free) {
//       placed.add(
//         PlacementModel(
//           pieceId: 'free',
//           x: f.x,
//           y: f.y,
//           width: f.width,
//           height: f.height,
//           rotated: false,
//           color: const Color(0xffffffff),
//           isOffcut: true,
//         ),
//       );
//     }
//     return placed;
//   }
// }
