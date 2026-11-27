import 'package:flutter/material.dart';

import '../../../sheet_viewer.dart';
import '../render_context.dart';
import '../render_scene.dart';
import '../renderer.dart';

final class GrainRenderer implements Renderer {
  const GrainRenderer();

  @override
  void paint(Canvas canvas, RenderContext context, RenderScene scene) {
    if (!context.theme.showGrain) {
      return;
    }

    final paint = context.cache.paint.grain;

    for (final renderPiece in scene.pieces) {
      final piece = renderPiece.piece;

      if (piece.grainDirection == GrainDirection.none) {
        continue;
      }

      final rect = renderPiece.bounds.rect;

      canvas.save();
      canvas.clipRect(rect);

      switch (piece.grainDirection) {
        case GrainDirection.horizontal:
          _drawHorizontal(canvas, rect, context.theme.grainSpacing, paint);
          break;

        case GrainDirection.vertical:
          _drawVertical(canvas, rect, context.theme.grainSpacing, paint);
          break;

        case GrainDirection.none:
          break;
      }

      canvas.restore();
    }
  }

  void _drawHorizontal(Canvas canvas, Rect rect, double spacing, Paint paint) {
    for (double y = rect.top; y < rect.bottom; y += spacing) {
      canvas.drawLine(Offset(rect.left, y), Offset(rect.right, y), paint);
    }
  }

  void _drawVertical(Canvas canvas, Rect rect, double spacing, Paint paint) {
    for (double x = rect.left; x < rect.right; x += spacing) {
      canvas.drawLine(Offset(x, rect.top), Offset(x, rect.bottom), paint);
    }
  }
}
