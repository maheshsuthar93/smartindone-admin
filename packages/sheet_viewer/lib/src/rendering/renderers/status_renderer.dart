import 'package:flutter/material.dart';

import '../render_context.dart';
import '../render_scene.dart';
import '../renderer.dart';

final class StatusRenderer implements Renderer {
  const StatusRenderer();

  static const double _stripHeight = 4.0;

  @override
  void paint(Canvas canvas, RenderContext context, RenderScene scene) {
    for (final renderPiece in scene.pieces) {
      final status = context.statusOf(renderPiece.piece);

      debugPrint('${renderPiece.piece.id} -> $status');
      final rect = renderPiece.bounds.rect;

      // Skip tiny pieces
      if (rect.width < 20 || rect.height < 12) {
        continue;
      }

      final color = context.statusColorOf(renderPiece.piece);

      final stripRect = Rect.fromLTWH(
        rect.left,
        rect.top,
        rect.width,
        _stripHeight,
      );

      final rRect = RRect.fromRectAndCorners(
        stripRect,
        topLeft: Radius.circular(context.theme.pieceCornerRadius),
        topRight: Radius.circular(context.theme.pieceCornerRadius),
      );

      canvas.drawRRect(rRect, Paint()..color = color);
    }
  }
}
