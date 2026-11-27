import 'package:flutter/material.dart';

import '../render_context.dart';
import '../render_scene.dart';
import '../renderer.dart';

final class SelectionRenderer implements Renderer {
  const SelectionRenderer();

  static const double _handleRadius = 3.5;

  @override
  void paint(Canvas canvas, RenderContext context, RenderScene scene) {
    final selected = context.selectedPiece;

    if (selected == null) {
      return;
    }

    for (final renderPiece in scene.pieces) {
      if (renderPiece.piece.id != selected) {
        continue;
      }

      final rect = renderPiece.bounds.rect;

      _drawOutline(canvas, rect, context);

      _drawHandles(canvas, rect, context);

      break;
    }
  }

  void _drawOutline(Canvas canvas, Rect rect, RenderContext context) {
    canvas.drawRect(rect, context.cache.paint.selection);
  }

  void _drawHandles(Canvas canvas, Rect rect, RenderContext context) {
    final paint = context.cache.paint.selectionHandle;

    final points = <Offset>[
      rect.topLeft,
      rect.topCenter,
      rect.topRight,
      rect.centerLeft,
      rect.centerRight,
      rect.bottomLeft,
      rect.bottomCenter,
      rect.bottomRight,
    ];

    for (final point in points) {
      canvas.drawCircle(point, _handleRadius, paint);
    }
  }
}
