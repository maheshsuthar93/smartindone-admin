import 'package:flutter/material.dart';

import '../../../sheet_viewer.dart';
import '../render_context.dart';
import '../render_scene.dart';
import '../renderer.dart';

// final class PieceRenderer implements Renderer {
//   const PieceRenderer();
//
//   @override
//   void paint(Canvas canvas, RenderContext context, RenderScene scene) {
//     for (final renderPiece in scene.pieces) {
//       final piece = renderPiece.piece;
//       final rect = renderPiece.bounds.rect;
//
//       final material = context.materialFor(piece);
//
//       final fillPaint = context.cache.material.paintFor(material);
//
//       _drawPiece(canvas, rect, fillPaint, context);
//     }
//   }
//
//   void _drawPiece(
//     Canvas canvas,
//     Rect rect,
//     Paint fillPaint,
//     RenderContext context,
//   ) {
//     final rRect = RRect.fromRectAndRadius(
//       rect,
//       Radius.circular(context.theme.pieceCornerRadius),
//     );
//
//     if (context.theme.showPieceShadow) {
//       canvas.drawShadow(
//         Path()..addRRect(rRect),
//         context.theme.pieceShadowColor,
//         context.theme.pieceShadowElevation,
//         false,
//       );
//     }
//
//     canvas.drawRRect(rRect, fillPaint);
//
//     canvas.drawRRect(rRect, context.cache.paint.pieceBorder);
//   }
// }

final class PieceRenderer implements Renderer {
  const PieceRenderer();

  @override
  void paint(Canvas canvas, RenderContext context, RenderScene scene) {
    for (final renderPiece in scene.pieces) {
      final piece = renderPiece.piece;

      // Unused areas are rendered by RemainingAreaRenderer.
      if (piece.type == PieceType.unused) {
        continue;
      }

      final rect = renderPiece.bounds.rect;
      final fillPaint = Paint()
        ..color = context.statusColorOf(piece).withValues(alpha: 0.45)
        ..style = PaintingStyle.fill;

      _drawPiece(canvas, rect, fillPaint, context);
    }
  }

  void _drawPiece(
    Canvas canvas,
    Rect rect,
    Paint fillPaint,
    RenderContext context,
  ) {
    final rRect = RRect.fromRectAndRadius(
      rect,
      Radius.circular(
        context.theme.pieceCornerRadius,
      ),
    );

    if (context.theme.showPieceShadow) {
      canvas.drawShadow(
        Path()..addRRect(rRect),
        context.theme.pieceShadowColor,
        context.theme.pieceShadowElevation,
        false,
      );
    }

    canvas.drawRRect(
      rRect,
      fillPaint,
    );

    canvas.drawRRect(
      rRect,
      context.cache.paint.pieceBorder,
    );
  }
}
