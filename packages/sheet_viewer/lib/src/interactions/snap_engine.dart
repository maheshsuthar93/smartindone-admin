import '../../sheet_viewer.dart';

final class SnapEngine {
  const SnapEngine._();

  static PieceBounds snap(PieceBounds bounds, {double gridSize = 10}) {
    double snapValue(double value) {
      return (value / gridSize).round() * gridSize;
    }

    return PieceBounds(
      x: snapValue(bounds.x),
      y: snapValue(bounds.y),
      width: snapValue(bounds.width),
      height: snapValue(bounds.height),
    );
  }
}
