import 'package:flutter/material.dart';
import 'package:sheet_viewer/src/rendering/render_context.dart';
import 'package:sheet_viewer/src/rendering/render_scene_builder.dart';

import '../../sheet_viewer.dart';
import '../controllers/viewport_transform.dart';
import 'cache/render_cache.dart';
import 'render_pipeline.dart';

final class SheetPainter extends CustomPainter {
  SheetPainter({
    required this.controller,
    required this.theme,
    required this.pipeline,
  }) : _cache = RenderCache(theme: theme),
       _sceneBuilder = const RenderSceneBuilder(),
       super(repaint: controller);

  final SheetViewerController controller;

  final SheetViewerThemeData theme;

  final RenderPipeline pipeline;

  final RenderCache _cache;

  final RenderSceneBuilder _sceneBuilder;

  @override
  void paint(Canvas canvas, Size size) {
    // Update caches if the theme changes.
    _cache.updateTheme(theme);

    // Build render context.
    final context = RenderContext(
      size: size,
      controller: controller,
      theme: theme,
      transform: ViewportTransform(controller.viewport),
      cache: _cache,
    );

    // Build the visible render scene.
    final scene = _sceneBuilder.build(context);

    // Make the scene available to interaction layer.
    controller.updateRenderScene(scene);

    // Execute rendering pipeline.
    pipeline.paint(canvas, context, scene);
  }

  @override
  bool shouldRepaint(covariant SheetPainter oldDelegate) {
    return controller != oldDelegate.controller ||
        theme != oldDelegate.theme ||
        pipeline != oldDelegate.pipeline;
  }
}
