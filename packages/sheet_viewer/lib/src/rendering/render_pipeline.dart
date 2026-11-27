import 'package:flutter/material.dart';

import 'render_context.dart';
import 'render_scene.dart';
import 'renderer.dart';

/// Executes all renderers in order.
///
/// The order of [renderers] determines the drawing order.
final class RenderPipeline {
  const RenderPipeline({required this.renderers});

  final List<Renderer> renderers;

  void paint(Canvas canvas, RenderContext context, RenderScene scene) {
    for (final renderer in renderers) {
      renderer.paint(canvas, context, scene);
    }
  }
}
