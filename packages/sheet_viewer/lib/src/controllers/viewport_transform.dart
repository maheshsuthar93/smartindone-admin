import 'package:flutter/widgets.dart';

import '../../sheet_viewer.dart';
import 'viewport_state.dart';

@immutable
final class ViewportTransform {
  const ViewportTransform(this.viewport);

  final ViewportState viewport;

  //--------------------------------------------------------------------------
  // Point conversion
  //--------------------------------------------------------------------------

  Offset toScreen(Offset world) {
    return Offset(
      world.dx * viewport.scale + viewport.offset.dx,
      world.dy * viewport.scale + viewport.offset.dy,
    );
  }

  Offset toWorld(Offset screen) {
    return Offset(
      (screen.dx - viewport.offset.dx) / viewport.scale,
      (screen.dy - viewport.offset.dy) / viewport.scale,
    );
  }

  //--------------------------------------------------------------------------
  // Bounds conversion
  //--------------------------------------------------------------------------

  PieceBounds toScreenBounds(PieceBounds bounds) {
    return PieceBounds(
      x: bounds.x * viewport.scale + viewport.offset.dx,
      y: bounds.y * viewport.scale + viewport.offset.dy,
      width: bounds.width * viewport.scale,
      height: bounds.height * viewport.scale,
    );
  }

  PieceBounds toWorldBounds(PieceBounds bounds) {
    return PieceBounds(
      x: (bounds.x - viewport.offset.dx) / viewport.scale,
      y: (bounds.y - viewport.offset.dy) / viewport.scale,
      width: bounds.width / viewport.scale,
      height: bounds.height / viewport.scale,
    );
  }

  //--------------------------------------------------------------------------
  // Distance conversion
  //--------------------------------------------------------------------------

  double toScreenLength(double length) {
    return length * viewport.scale;
  }

  double toWorldLength(double length) {
    return length / viewport.scale;
  }
}
