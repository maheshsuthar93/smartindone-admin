// import 'dart:math';
//
// //
// import 'package:flutter/material.dart';
//
// import 'package:board_cut/shared/shared.dart';
//
// class BoardWidget extends CustomPainter {
//   final double sheetW;
//   final double sheetH;
//   final List<PlacementModel> pieces;
//   final bool isHorizontal;
//
//   BoardWidget(
//     this.sheetW,
//     this.sheetH,
//     this.pieces, {
//     this.isHorizontal = true,
//   });
//
//   late double _scale;
//   late Offset _origin;
//
//   static const double padding = 20;
//
//   @override
//   void paint(Canvas canvas, Size size) {
//     final boardW = isHorizontal ? sheetH : sheetW;
//     final boardH = isHorizontal ? sheetW : sheetH;
//
//     final usableW = size.width - padding * 2;
//     final usableH = size.height - padding * 2;
//
//     _scale = min(usableW / boardW, usableH / boardH);
//
//     // _origin = Offset(
//     //   padding + (usableW - boardW * _scale) / 2,
//     //   padding + (usableH - boardH * _scale) / 2,
//     // );
//     _origin = const Offset(padding, padding);
//     // ---------- GEOMETRY (SCALED) ----------
//     canvas.save();
//     canvas.translate(_origin.dx, _origin.dy);
//     canvas.scale(_scale);
//
//     _drawSheet(canvas, boardW, boardH);
//
//     for (final p in pieces) {
//       _drawPiece(canvas, p);
//     }
//
//     canvas.restore();
//
//     // ---------- TEXT (UNSCALED) ----------
//     for (final p in pieces) {
//       _drawPieceText(canvas, p);
//     }
//
//     _drawBoardDimensions(canvas, boardW, boardH);
//   }
//
//   // ================= GEOMETRY =================
//
//   void _drawSheet(Canvas canvas, double w, double h) {
//     canvas.drawRect(
//       Rect.fromLTWH(0, 0, w, h),
//       Paint()
//         ..color = const Color(0xffF7F7F7)
//         ..style = PaintingStyle.fill,
//     );
//
//     canvas.drawRect(
//       Rect.fromLTWH(0, 0, w, h),
//       Paint()
//         ..color = Colors.black
//         ..style = PaintingStyle.stroke
//         ..strokeWidth = 3,
//     );
//   }
//
//   void _drawPiece(Canvas canvas, PlacementModel p) {
//     final x = isHorizontal ? p.y : p.x;
//     final y = isHorizontal ? p.x : p.y;
//     final w = isHorizontal ? p.height : p.width;
//     final h = isHorizontal ? p.width : p.height;
//
//     final rect = Rect.fromLTWH(x, y, w, h);
//
//     canvas.drawRect(
//       rect,
//       Paint()
//         ..color = p.color.withOpacity(0.3)
//         ..style = PaintingStyle.fill,
//     );
//
//     canvas.drawRect(
//       rect,
//       Paint()
//         ..color = Colors.black
//         ..style = PaintingStyle.stroke
//         ..strokeWidth = 2,
//     );
//   }
//
//   // ================= TEXT =================
//
//   void _drawPieceText(Canvas canvas, PlacementModel p) {
//     final x = isHorizontal ? p.y : p.x;
//     final y = isHorizontal ? p.x : p.y;
//     final w = isHorizontal ? p.height : p.width;
//     final h = isHorizontal ? p.width : p.height;
//
//     final pixelW = w * _scale;
//     final pixelH = h * _scale;
//
//     // Hide only if EXTREMELY small
//     if (pixelW < 12 || pixelH < 10) return;
//
//     // Dynamic font size
//     final double fontSize = min(
//       max(pixelW / 6, 8), // minimum readable
//       14, // max size
//     );
//
//     final centerMm = Offset(x + w / 2, y + h / 2);
//
//     _drawTextPx(canvas, '${w.toInt()} × ${h.toInt()}', centerMm, fontSize);
//   }
//
//   void _drawBoardDimensions(Canvas canvas, double w, double h) {
//     _drawTextPx(canvas, '${w.toInt()} mm', Offset(w / 2, -25));
//
//     _drawVerticalTextPx(canvas, '${h.toInt()} mm', Offset(-25, h / 2));
//   }
//
//   // ================= TEXT HELPERS =================
//
//   void _drawTextPx(
//     Canvas canvas,
//     String text,
//     Offset mm, [
//     double fontSize = 14,
//   ]) {
//     final px = _mmToPx(mm);
//
//     final tp = TextPainter(
//       text: TextSpan(
//         text: text,
//         style: TextStyle(
//           color: Colors.black,
//           fontSize: fontSize,
//           fontWeight: FontWeight.bold,
//         ),
//       ),
//       textDirection: TextDirection.ltr,
//     );
//
//     tp.layout();
//     tp.paint(canvas, px - Offset(tp.width / 2, tp.height / 2));
//   }
//
//   void _drawVerticalTextPx(Canvas canvas, String text, Offset mm) {
//     final px = _mmToPx(mm);
//
//     canvas.save();
//     canvas.translate(px.dx, px.dy);
//     canvas.rotate(-pi / 2);
//
//     final tp = TextPainter(
//       text: TextSpan(
//         text: text,
//         style: const TextStyle(
//           color: Colors.black,
//           fontSize: 14,
//           fontWeight: FontWeight.bold,
//         ),
//       ),
//       textDirection: TextDirection.ltr,
//     );
//
//     tp.layout();
//     tp.paint(canvas, Offset(-tp.width / 2, -tp.height / 2));
//     canvas.restore();
//   }
//
//   Offset _mmToPx(Offset mm) {
//     return Offset(_origin.dx + mm.dx * _scale, _origin.dy + mm.dy * _scale);
//   }
//
//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
// }
