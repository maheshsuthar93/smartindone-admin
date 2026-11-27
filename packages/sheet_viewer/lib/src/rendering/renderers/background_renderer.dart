import 'package:flutter/material.dart';

import '../render_context.dart';
import '../render_scene.dart';
import '../renderer.dart';

final class BackgroundRenderer implements Renderer {
  const BackgroundRenderer();

  @override
  void paint(Canvas canvas, RenderContext context, RenderScene scene) {
    canvas.drawRect(Offset.zero & context.size, context.cache.paint.background);
  }
}
