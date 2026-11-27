import 'package:flutter/widgets.dart';

import '../rendering/render_scene.dart';

final class HitTestEngine {
  const HitTestEngine();

  RenderPiece? hitTest({required Offset position, required RenderScene scene}) {
    // Reverse iteration ensures the top-most piece wins.
    for (final renderPiece in scene.pieces.reversed) {
      if (renderPiece.bounds.contains(position)) {
        return renderPiece;
      }
    }

    return null;
  }
}
