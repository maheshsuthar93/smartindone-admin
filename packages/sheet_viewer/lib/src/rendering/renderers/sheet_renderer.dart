import 'package:flutter/material.dart';

import '../render_context.dart';
import '../render_scene.dart';
import '../renderer.dart';

final class SheetRenderer implements Renderer {
  const SheetRenderer();

  @override
  void paint(Canvas canvas, RenderContext context, RenderScene scene) {
    final rect = context.sheetRect;

    if (context.theme.showSheetShadow) {
      canvas.drawShadow(
        Path()..addRect(rect),
        context.theme.sheetShadowColor,
        6,
        false,
      );
    }

    canvas.drawRect(rect, context.cache.paint.sheet);

    canvas.drawRect(rect, context.cache.paint.sheetBorder);
  }
}
