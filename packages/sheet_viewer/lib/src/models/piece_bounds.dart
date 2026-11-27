import 'package:flutter/foundation.dart';

import 'dart:ui';

@immutable
final class PieceBounds {
  const PieceBounds({
    required this.x,
    required this.y,
    required this.width,
    required this.height,
  });

  final double x;
  final double y;
  final double width;
  final double height;

  //--------------------------------------------------------------------------
  // Derived properties
  //--------------------------------------------------------------------------

  double get left => x;

  double get top => y;

  double get right => x + width;

  double get bottom => y + height;

  double get centerX => x + width / 2;

  double get centerY => y + height / 2;

  Offset get center => Offset(centerX, centerY);

  Size get size => Size(width, height);

  Rect get rect => Rect.fromLTWH(x, y, width, height);

  bool get isEmpty => width <= 0 || height <= 0;

  double get area => width * height;

  //--------------------------------------------------------------------------
  // Geometry
  //--------------------------------------------------------------------------

  bool contains(Offset point) {
    return point.dx >= left &&
        point.dx <= right &&
        point.dy >= top &&
        point.dy <= bottom;
  }

  bool intersects(PieceBounds other) {
    return !(other.left >= right ||
        other.right <= left ||
        other.top >= bottom ||
        other.bottom <= top);
  }

  PieceBounds translate(double dx, double dy) {
    return PieceBounds(x: x + dx, y: y + dy, width: width, height: height);
  }

  PieceBounds inflate(double delta) {
    return PieceBounds(
      x: x - delta,
      y: y - delta,
      width: width + delta * 2,
      height: height + delta * 2,
    );
  }

  PieceBounds deflate(double delta) => inflate(-delta);

  PieceBounds copyWith({double? x, double? y, double? width, double? height}) {
    return PieceBounds(
      x: x ?? this.x,
      y: y ?? this.y,
      width: width ?? this.width,
      height: height ?? this.height,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PieceBounds &&
          x == other.x &&
          y == other.y &&
          width == other.width &&
          height == other.height;

  @override
  int get hashCode => Object.hash(x, y, width, height);
}
