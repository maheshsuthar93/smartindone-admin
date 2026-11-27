import 'package:flutter/material.dart';

import 'render_context.dart';
import 'render_scene.dart';

/// Builds the render scene for the current frame.
///
/// Responsibilities:
/// - Transform world coordinates to screen coordinates.
/// - Cull pieces outside the viewport.
/// - Prepare screen-space geometry for renderers.
final class RenderSceneBuilder {
  const RenderSceneBuilder();

  RenderScene build(RenderContext context) {
    final viewport = Offset.zero & context.size;

    final pieces = <RenderPiece>[];

    for (final piece in context.sheet.pieces) {
      final bounds = context.toScreenBounds(piece.bounds);

      // Skip pieces outside the viewport.
      if (!bounds.rect.overlaps(viewport)) {
        continue;
      }

      pieces.add(
        RenderPiece(
          piece: piece,
          bounds: bounds,
        ),
      );
    }

    return RenderScene(
      pieces: pieces,
    );
  }
}