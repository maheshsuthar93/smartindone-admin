import 'package:flutter/material.dart';

import '../render_context.dart';
import '../render_scene.dart';
import '../renderer.dart';

final class HoverRenderer implements Renderer {
  const HoverRenderer();

  @override
  void paint(
      Canvas canvas,
      RenderContext context,
      RenderScene scene,
      ) {
    final hovered = context.hoveredPiece;

    if (hovered == null) {
      return;
    }

    for (final renderPiece in scene.pieces) {
      if (renderPiece.piece.id != hovered.id) {
        continue;
      }

      final rect = renderPiece.bounds.rect;

      // Fill
      canvas.drawRect(
        rect,
        context.cache.paint.hover,
      );

      // Border
      final border = Paint()
        ..color = context.theme.hoverBorderColor
        ..style = PaintingStyle.stroke
        ..strokeWidth = 2;

      canvas.drawRect(
        rect,
        border,
      );

      break;
    }
  }
}