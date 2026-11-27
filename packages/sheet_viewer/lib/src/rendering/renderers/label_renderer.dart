import 'package:flutter/material.dart';

import '../layout/piece_info_layout.dart';
import '../render_context.dart';
import '../render_scene.dart';
import '../renderer.dart';

final class LabelRenderer implements Renderer {
  const LabelRenderer();

  @override
  void paint(Canvas canvas, RenderContext context, RenderScene scene) {
    if (!context.theme.showLabels) {
      return;
    }

    for (final renderPiece in scene.pieces) {
      final rect = renderPiece.bounds.rect;

      final info = PieceInfoLayout.build(
        piece: renderPiece.piece,
        width: rect.width,
        height: rect.height,
      );

      if (info.isEmpty) {
        continue;
      }

      final painter = context.cache.text.painter(
        text: info.text,
        style: context.theme.labelStyle,
        textAlign: TextAlign.center,
        maxLines: info.lines.length,
      );

      final dx = rect.center.dx - painter.width / 2;
      final dy = rect.center.dy - painter.height / 2;

      painter.paint(canvas, Offset(dx, dy));
    }
  }
}
