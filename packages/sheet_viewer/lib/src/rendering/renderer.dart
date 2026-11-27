import 'package:flutter/material.dart';

import 'render_context.dart';
import 'render_scene.dart';

/// Base interface for all renderers.
///
/// Each renderer is responsible for drawing one aspect of the viewer
/// (background, sheet, pieces, labels, grain, hover, etc.).
abstract interface class Renderer {
  const Renderer();

  void paint(Canvas canvas, RenderContext context, RenderScene scene);
}
