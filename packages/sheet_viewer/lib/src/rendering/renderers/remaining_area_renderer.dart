import 'dart:ui';

import '../../../sheet_viewer.dart';
import '../render_context.dart';
import '../render_scene.dart';
import '../renderer.dart';


final class RemainingAreaRenderer implements Renderer {
  const RemainingAreaRenderer();

  @override
  void paint(Canvas canvas, RenderContext context, RenderScene scene) {
    for (final piece in scene.pieces) {
      if (piece.piece.type != PieceType.unused) {
        continue;
      }

      _drawUnusedArea(canvas, piece.bounds.rect, context);
    }
  }

  void _drawUnusedArea(Canvas canvas, Rect rect, RenderContext context) {
    if (rect.isEmpty) return;

    canvas.save();
    canvas.clipRect(rect);

    _drawHatch(canvas, rect);

    canvas.restore();
    canvas.drawRect(rect, context.cache.paint.pieceBorder);
  }

  void _drawHatch(Canvas canvas, Rect rect) {
    const double spacing = 18.0;

    final paint = Paint()
      ..color = const Color(0x14000000)
      ..strokeWidth = 1
      ..style = PaintingStyle.stroke;

    for (
    double x = rect.left - rect.height;
    x < rect.right;
    x += spacing
    ) {
      canvas.drawLine(
        Offset(x, rect.top),
        Offset(x + rect.height, rect.bottom),
        paint,
      );
    }
  }
}
