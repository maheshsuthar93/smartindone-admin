// import 'dart:math';
//
// //
// import 'package:flutter/material.dart';
//
// import '../../../../features/piece_detail/data/models/placement_model.dart';
// class BoardWidget extends CustomPainter {
//   final double sheetW;
//   final double sheetH;
//   final List<PlacementModel> pieces;
//   final bool isHorizontal;
//
//   BoardWidget(
//       this.sheetW,
//       this.sheetH,
//       this.pieces, {
//         this.isHorizontal = true,
//       });
//   late double _scale;
//   @override
//   void paint(Canvas canvas, Size size) {
//     // Swap logical board size
//     final boardW = isHorizontal ? sheetH : sheetW;
//     final boardH = isHorizontal ? sheetW : sheetH;
//     _scale = min(size.width / boardW, size.height / boardH);
//     canvas.save();
//     canvas.scale(_scale);
//
//     _drawSheet(canvas);
//     for (final p in pieces) {
//       _drawPiece(canvas, p);
//     }
//
//     _drawSheetDimensions(canvas);
//
//     canvas.restore();
//   }
//
//   void _drawSheet(Canvas canvas) {
//     final boardW = isHorizontal ? sheetH : sheetW;
//     final boardH = isHorizontal ? sheetW : sheetH;
//     final sheetPaint = Paint()
//       ..color = Color(0xffF8F8F8)
//       ..style = PaintingStyle.fill;
//
//     final borderPaint = Paint()
//       ..color = Colors.black
//       ..style = PaintingStyle.stroke
//       ..strokeWidth = 3;
//
//     canvas.drawRect(Rect.fromLTWH(0, 0, boardW, boardH), sheetPaint);
//     canvas.drawRect(Rect.fromLTWH(0, 0, boardW, boardH), borderPaint);
//   }
//
//   void _drawPiece(Canvas canvas, PlacementModel p) {
//     // If horizontal, rotate piece coordinates
//     final x = isHorizontal ? p.y : p.x;
//     final y = isHorizontal ? p.x : p.y;
//     final w = isHorizontal ? p.height : p.width;
//     final h = isHorizontal ? p.width : p.height;
//
//     final rect = Rect.fromLTWH(x, y, w, h);
//
//     final paint = Paint()
//       ..color = Colors.black
//       ..style = PaintingStyle.stroke
//       ..strokeWidth = 2;
//
//     final paintBg = Paint()
//       ..color = p.color.withValues(alpha: 0.3)
//       ..style = PaintingStyle.fill;
//
//     // final paintBg = Paint()
//     //   ..shader = LinearGradient(
//     //     begin: Alignment.topLeft,
//     //     end: Alignment.bottomRight,
//     //     colors: [p.color.withOpacity(0.5), Color(0xffFFEBEE).withOpacity(0.8)],
//     //   ).createShader(rect);
//
//     canvas.drawRect(rect, paintBg);
//     canvas.drawRect(rect, paint);
//
//     _drawHorizontalDimension(canvas, Offset(x, y), w, '${w.toInt()}');
//     _drawVerticalDimension(canvas, Offset(x, y), h, '${h.toInt()}');
//   }
//
//   void _drawHorizontalDimension(
//       Canvas canvas,
//       Offset start,
//       double width,
//       String label,
//       ) {
//     final offset = Offset((width / 2) + start.dx, start.dy + 5);
//
//     _drawText(canvas, label, offset);
//   }
//
//   void _drawVerticalDimension(
//       Canvas canvas,
//       Offset start,
//       double height,
//       String label,
//       ) {
//     final offset = Offset(start.dx + 15, (height / 2 - 5) + start.dy);
//     _drawVerticalText(canvas, label, offset);
//   }
//
//   void _drawSheetDimensions(Canvas canvas) {
//     final boardW = isHorizontal ? sheetH : sheetW;
//     final boardH = isHorizontal ? sheetW : sheetH;
//     _drawSheetHorizontalDimension(
//       canvas,
//       Offset(0, -20),
//       boardW,
//       '${boardW.toInt()} mm',
//     );
//
//     _drawSheetVerticalDimension(
//       canvas,
//       Offset(-20, 0),
//       boardH,
//       '${boardH.toInt()} mm',
//     );
//   }
//
//   void _drawText(Canvas canvas, String text, Offset pos) {
//     final tp = TextPainter(
//       text: TextSpan(
//         text: text,
//         style: const TextStyle(
//           color: Colors.black,
//           fontSize: 17,
//           fontWeight: FontWeight.bold,
//         ),
//       ),
//       textDirection: TextDirection.ltr,
//     );
//     tp.layout();
//     tp.paint(canvas, pos);
//   }
//
//   void _drawVerticalText(Canvas canvas, String text, Offset position) {
//     canvas.save();
//
//     // Move origin to desired position
//     canvas.translate(position.dx, position.dy);
//
//     // Rotate 90° counter-clockwise
//     canvas.rotate(-pi / 2);
//
//     final tp = TextPainter(
//       text: TextSpan(
//         text: text,
//         style: const TextStyle(
//           color: Colors.black,
//           fontSize: 17,
//           fontWeight: FontWeight.bold,
//         ),
//       ),
//       textDirection: TextDirection.ltr,
//     );
//
//     tp.layout();
//     tp.paint(canvas, Offset((-tp.width / 2), -tp.height / 2));
//     canvas.restore();
//   }
//
//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) {
//     return true;
//   }
//
//   void _drawSheetHorizontalDimension(
//       Canvas canvas,
//       Offset start,
//       double length, //width
//       String label,
//       ) {
//     final paint = Paint()
//       ..color = Colors.black
//       ..strokeWidth = 2;
//
//     canvas.drawLine(start, start + Offset(length, 0), paint);
//     canvas.drawLine(start, start + const Offset(0, 10), paint);
//     canvas.drawLine(
//       start + Offset(length, 0),
//       start + Offset(length, 10),
//       paint,
//     );
//
//     _drawText(canvas, label, start + Offset(length / 2 - 30, -50));
//   }
//
//   void _drawSheetVerticalDimension(
//       Canvas canvas,
//       Offset start,
//       double length,
//       String label,
//       ) {
//     final paint = Paint()
//       ..color = Colors.black
//       ..strokeWidth = 2;
//
//     canvas.drawLine(start, start + Offset(0, length), paint);
//     canvas.drawLine(start, start + const Offset(10, 0), paint);
//     canvas.drawLine(
//       start + Offset(0, length),
//       start + Offset(10, length),
//       paint,
//     );
//
//     _drawText(canvas, label, start + Offset(-150, length / 2 - 10));
//   }
// }
