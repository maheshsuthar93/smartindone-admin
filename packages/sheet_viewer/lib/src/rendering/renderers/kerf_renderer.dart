import 'package:flutter/material.dart';

import '../../../sheet_viewer.dart';
import '../render_context.dart';
import '../render_scene.dart';
import '../renderer.dart';

/// Draws a subtle cut-allowance marker in the narrow gaps between pieces.
final class KerfRenderer implements Renderer {
  const KerfRenderer();

  static const Color _color = Color(0xFFE4572E);
  static const double _strokeWidth = 1.5;

  @override
  void paint(Canvas canvas, RenderContext context, RenderScene scene) {
    final pieces = scene.pieces
        .where((item) => item.piece.type == PieceType.normal)
        .toList(growable: false);
    final candidates = <_KerfGap>[];

    for (var i = 0; i < pieces.length; i++) {
      final first = pieces[i].bounds.rect;
      for (var j = i + 1; j < pieces.length; j++) {
        final second = pieces[j].bounds.rect;
        _addVerticalGap(candidates, first, second);
        _addHorizontalGap(candidates, first, second);
      }
    }

    if (candidates.isEmpty) return;

    final minimumGap = candidates
        .map((gap) => gap.width)
        .reduce((a, b) => a < b ? a : b);
    final paint = Paint()
      ..color = _color
      ..strokeWidth = _strokeWidth
      ..style = PaintingStyle.stroke;

    for (final gap in candidates) {
      if (gap.width > minimumGap + 0.75) continue;
      _drawDashedLine(canvas, gap.start, gap.end, paint);
    }
  }

  void _addVerticalGap(List<_KerfGap> gaps, Rect first, Rect second) {
    final firstIsLeft = first.center.dx <= second.center.dx;
    final left = firstIsLeft ? first : second;
    final right = firstIsLeft ? second : first;
    final width = right.left - left.right;
    final overlapTop = left.top > right.top ? left.top : right.top;
    final overlapBottom = left.bottom < right.bottom ? left.bottom : right.bottom;

    if (width > 0 && overlapBottom > overlapTop) {
      final x = (left.right + right.left) / 2;
      gaps.add(
        _KerfGap(Offset(x, overlapTop), Offset(x, overlapBottom), width),
      );
    }
  }

  void _addHorizontalGap(List<_KerfGap> gaps, Rect first, Rect second) {
    final firstIsTop = first.center.dy <= second.center.dy;
    final top = firstIsTop ? first : second;
    final bottom = firstIsTop ? second : first;
    final height = bottom.top - top.bottom;
    final overlapLeft = top.left > bottom.left ? top.left : bottom.left;
    final overlapRight = top.right < bottom.right ? top.right : bottom.right;

    if (height > 0 && overlapRight > overlapLeft) {
      final y = (top.bottom + bottom.top) / 2;
      gaps.add(
        _KerfGap(Offset(overlapLeft, y), Offset(overlapRight, y), height),
      );
    }
  }

  void _drawDashedLine(Canvas canvas, Offset start, Offset end, Paint paint) {
    final delta = end - start;
    final length = delta.distance;
    if (length <= 0) return;

    final direction = delta / length;
    const dashLength = 5.0;
    const gapLength = 3.0;
    var distance = 0.0;

    while (distance < length) {
      final dashEnd = (distance + dashLength).clamp(0.0, length).toDouble();
      canvas.drawLine(
        start + direction * distance,
        start + direction * dashEnd,
        paint,
      );
      distance += dashLength + gapLength;
    }
  }
}

final class _KerfGap {
  const _KerfGap(this.start, this.end, this.width);

  final Offset start;
  final Offset end;
  final double width;
}
