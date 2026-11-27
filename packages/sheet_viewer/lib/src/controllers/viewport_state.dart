import 'package:flutter/widgets.dart';

@immutable
final class ViewportState {
  const ViewportState({
    this.scale = 1.0,
    this.offset = Offset.zero,
    this.minScale = 0.1,
    this.maxScale = 10.0,
  });

  /// Current zoom level.
  final double scale;

  /// Current pan offset in screen coordinates.
  final Offset offset;

  /// Minimum allowed zoom.
  final double minScale;

  /// Maximum allowed zoom.
  final double maxScale;

  ViewportState copyWith({
    double? scale,
    Offset? offset,
    double? minScale,
    double? maxScale,
  }) {
    return ViewportState(
      scale: scale ?? this.scale,
      offset: offset ?? this.offset,
      minScale: minScale ?? this.minScale,
      maxScale: maxScale ?? this.maxScale,
    );
  }

  /// Returns a new state with the scale clamped
  /// between [minScale] and [maxScale].
  ViewportState clampScale() {
    return copyWith(scale: scale.clamp(minScale, maxScale).toDouble());
  }

  /// Resets pan while keeping the current zoom.
  ViewportState resetOffset() {
    return copyWith(offset: Offset.zero);
  }

  /// Resets the entire viewport.
  ViewportState reset() {
    return ViewportState(minScale: minScale, maxScale: maxScale);
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ViewportState &&
          runtimeType == other.runtimeType &&
          scale == other.scale &&
          offset == other.offset &&
          minScale == other.minScale &&
          maxScale == other.maxScale;

  @override
  int get hashCode => Object.hash(scale, offset, minScale, maxScale);
}
