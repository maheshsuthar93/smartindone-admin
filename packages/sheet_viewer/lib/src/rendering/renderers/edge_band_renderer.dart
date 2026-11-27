import 'package:flutter/material.dart';

import '../../models/edge_side.dart';
import '../render_context.dart';
import '../render_scene.dart';
import '../renderer.dart';

final class EdgeBandRenderer implements Renderer {
  const EdgeBandRenderer();

  @override
  void paint(Canvas canvas, RenderContext context, RenderScene scene) {
    if (!context.theme.showEdgeBand) {
      return;
    }

    final paint = context.cache.paint.edgeBand;

    for (final renderPiece in scene.pieces) {
      final piece = renderPiece.piece;

      if (piece.edgeBands.isEmpty) {
        continue;
      }

      final rect = renderPiece.bounds.rect;

      if (piece.hasEdgeBand(EdgeSide.top)) {
        canvas.drawLine(rect.topLeft, rect.topRight, paint);
      }

      if (piece.hasEdgeBand(EdgeSide.right)) {
        canvas.drawLine(rect.topRight, rect.bottomRight, paint);
      }

      if (piece.hasEdgeBand(EdgeSide.bottom)) {
        canvas.drawLine(rect.bottomLeft, rect.bottomRight, paint);
      }

      if (piece.hasEdgeBand(EdgeSide.left)) {
        canvas.drawLine(rect.topLeft, rect.bottomLeft, paint);
      }
    }
  }
}
