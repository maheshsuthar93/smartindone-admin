import 'dart:math';

import 'package:board_cut/core/theme/app_text_style.dart';
import 'package:board_cut/shared/shared.dart';
import 'package:flutter/material.dart';

class BoardPainter extends CustomPainter {
  final double sheetW;
  final double sheetH;
  final BoardModel boardModel;
  final bool isHorizontal;

  BoardPainter(
    this.sheetW,
    this.sheetH,
    this.boardModel, {
    this.isHorizontal = true,
  });

  late double _scale;
  late Offset _origin;

  static const double padding = 20;

  List<BoardPieceModel> get pieces => boardModel.placements;

  @override
  void paint(Canvas canvas, Size size) {
    final boardW = isHorizontal ? sheetH : sheetW;
    final boardH = isHorizontal ? sheetW : sheetH;

    final usableW = size.width - padding * 2;
    final usableH = size.height - padding * 2;

    _scale = min(usableW / boardW, usableH / boardH);

    _origin = const Offset(padding, padding);

    canvas.save();
    canvas.translate(_origin.dx, _origin.dy);
    canvas.scale(_scale);

    _drawSheet(canvas, boardW, boardH);

    for (final p in pieces) {
      _drawPiece(canvas, p);
    }

    canvas.restore();

    for (final p in pieces) {
      _drawPieceText(canvas, p);
    }

    _drawBoardDimensions(canvas, boardW, boardH);
  }

  void _drawSheet(Canvas canvas, double w, double h) {
    debugPrint("Drawing sheet isSelected: ${boardModel.isSelected}");
    canvas.drawRect(
      Rect.fromLTWH(0, 0, w, h),
      Paint()
        ..color = const Color(0xffF7F7F7)
        ..style = PaintingStyle.fill,
    );

    canvas.drawRect(
      Rect.fromLTWH(0, 0, w, h),
      Paint()
        ..color = Colors.black
        ..style = PaintingStyle.stroke
        ..strokeWidth = boardModel.isSelected ? 6 : 3,
    );
  }

  void _drawPiece(Canvas canvas, BoardPieceModel p) {
    final r = _resolvePlacement(p);

    final isSelected = p.isSelected;
    final rect = Rect.fromLTWH(r.x, r.y, r.w, r.h);

    if (p.isOffcut == true) {
      _drawOffcutStyle(canvas, rect);
    } else {
      _drawCutPieceStyle(canvas, rect, p.color, isSelected);
    }
  }

  void _drawCutPieceStyle(
    Canvas canvas,
    Rect rect,
    Color color,
    bool isSelected,
  ) {
    canvas.drawRect(
      rect,
      Paint()
        ..color = color.withValues(alpha: 200)
        ..style = PaintingStyle.fill,
    );

    canvas.drawRect(
      rect,
      Paint()
        ..color = Colors.black
        ..style = PaintingStyle.stroke
        ..strokeWidth = isSelected ? 10 : 2,
    );
  }

  void _drawOffcutStyle(Canvas canvas, Rect rect) {
    // Fill
    canvas.drawRect(
      rect,
      Paint()
        ..color = const Color(0xffE0E0E0).withValues(alpha: 0.5)
        ..style = PaintingStyle.fill,
    );

    // Dashed Border
    final dashPaint = Paint()
      ..color = Colors.grey.shade700
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    const dashWidth = 15.0;
    const dashSpace = 8.0;

    Path dashedPath = Path();

    // Top
    _addDashedLine(
      dashedPath,
      Offset(rect.left, rect.top),
      Offset(rect.right, rect.top),
      dashWidth,
      dashSpace,
    );

    // Right
    _addDashedLine(
      dashedPath,
      Offset(rect.right, rect.top),
      Offset(rect.right, rect.bottom),
      dashWidth,
      dashSpace,
    );

    // Bottom
    _addDashedLine(
      dashedPath,
      Offset(rect.right, rect.bottom),
      Offset(rect.left, rect.bottom),
      dashWidth,
      dashSpace,
    );

    // Left
    _addDashedLine(
      dashedPath,
      Offset(rect.left, rect.bottom),
      Offset(rect.left, rect.top),
      dashWidth,
      dashSpace,
    );

    canvas.drawPath(dashedPath, dashPaint);
  }

  void _drawPieceText(Canvas canvas, BoardPieceModel p) {
    final r = _resolvePlacement(p);

    final pixelW = r.w * _scale;
    final pixelH = r.h * _scale;

    // Hide only if EXTREMELY small
    if (pixelW < 12 || pixelH < 10) return;

    // Dynamic font size
    final double fontSize = min(
      max(pixelW / 6, 8), // minimum readable
      14, // max size
    );

    final centerMm = Offset(r.x + r.w / 2, r.y + r.h / 2);

    _drawTextPx(canvas, '${r.w.toInt()} × ${r.h.toInt()}', centerMm, fontSize);

    // if (p.isAvailable == true) {
    //   _drawTextPx(canvas, "OFFCUT\n${w.toInt()} × ${h.toInt()}",
    //       Offset(x + w / 2, y + h / 2), 10);
    //   return;
    // }
  }

  ({double x, double y, double w, double h}) _resolvePlacement(
    BoardPieceModel p,
  ) {
    return (
      x: isHorizontal ? p.y : p.x,
      y: isHorizontal ? p.x : p.y,
      w: isHorizontal ? p.height : p.width,
      h: isHorizontal ? p.width : p.height,
    );
  }

  void _drawBoardDimensions(Canvas canvas, double w, double h) {
    _drawTextPx(canvas, '${w.toInt()} mm', Offset(w / 2, -25));

    _drawVerticalTextPx(canvas, '${h.toInt()} mm', Offset(-25, h / 2));
  }

  void _drawTextPx(
    Canvas canvas,
    String text,
    Offset mm, [
    double fontSize = 14,
  ]) {
    final px = _mmToPx(mm);

    final tp = TextPainter(
      text: TextSpan(
        text: text,
        style: TextStyle(
          fontFamily: AppTextStyle.fontFamily,
          color: Colors.black,
          fontSize: fontSize,
          fontWeight: FontWeight.bold,
        ),
      ),
      textDirection: TextDirection.ltr,
    );

    tp.layout();
    tp.paint(canvas, px - Offset(tp.width / 2, tp.height / 2));
  }

  void _drawVerticalTextPx(Canvas canvas, String text, Offset mm) {
    final px = _mmToPx(mm);

    canvas.save();
    canvas.translate(px.dx, px.dy);
    canvas.rotate(-pi / 2);

    final tp = TextPainter(
      text: TextSpan(
        text: text,
        style: const TextStyle(
          fontFamily: AppTextStyle.fontFamily,
          color: Colors.black,
          fontSize: 14,
          fontWeight: FontWeight.bold,
        ),
      ),
      textDirection: TextDirection.ltr,
    );

    tp.layout();
    tp.paint(canvas, Offset(-tp.width / 2, -tp.height / 2));
    canvas.restore();
  }

  Offset _mmToPx(Offset mm) {
    return Offset(_origin.dx + mm.dx * _scale, _origin.dy + mm.dy * _scale);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

void _addDashedLine(
  Path path,
  Offset start,
  Offset end,
  double dashWidth,
  double dashSpace,
) {
  final totalLength = (end - start).distance;
  final direction = (end - start) / totalLength;

  double current = 0;

  while (current < totalLength) {
    final dashStart = start + direction * current;
    final dashEnd =
        start + direction * (current + dashWidth).clamp(0, totalLength);

    path.moveTo(dashStart.dx, dashStart.dy);
    path.lineTo(dashEnd.dx, dashEnd.dy);

    current += dashWidth + dashSpace;
  }
}
