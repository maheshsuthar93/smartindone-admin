import 'dart:math' as math;
import 'dart:ui';

import '../../sheet_viewer.dart';
import 'resize_handle.dart';

/// Calculates resized bounds for a piece.
///
/// This class contains no interaction logic.
/// It only converts:
///
/// - original bounds
/// - resize handle
/// - pointer delta
///
/// into a new immutable [PieceBounds].
final class PieceResizer {
  const PieceResizer._();

  static PieceBounds resize({
    required PieceBounds original,
    required ResizeHandle handle,
    required Offset delta,
    required Size sheetSize,
    double minWidth = 20,
    double minHeight = 20,
  }) {
    double left = original.x;
    double top = original.y;
    double right = original.right;
    double bottom = original.bottom;

    switch (handle) {
      case ResizeHandle.topLeft:
        left += delta.dx;
        top += delta.dy;
        break;

      case ResizeHandle.top:
        top += delta.dy;
        break;

      case ResizeHandle.topRight:
        right += delta.dx;
        top += delta.dy;
        break;

      case ResizeHandle.right:
        right += delta.dx;
        break;

      case ResizeHandle.bottomRight:
        right += delta.dx;
        bottom += delta.dy;
        break;

      case ResizeHandle.bottom:
        bottom += delta.dy;
        break;

      case ResizeHandle.bottomLeft:
        left += delta.dx;
        bottom += delta.dy;
        break;

      case ResizeHandle.left:
        left += delta.dx;
        break;

      case ResizeHandle.none:
        return original;
    }

    // ------------------------------------------------------------
    // Minimum size
    // ------------------------------------------------------------

    if (right - left < minWidth) {
      switch (handle) {
        case ResizeHandle.left:
        case ResizeHandle.topLeft:
        case ResizeHandle.bottomLeft:
          left = right - minWidth;
          break;

        default:
          right = left + minWidth;
      }
    }

    if (bottom - top < minHeight) {
      switch (handle) {
        case ResizeHandle.top:
        case ResizeHandle.topLeft:
        case ResizeHandle.topRight:
          top = bottom - minHeight;
          break;

        default:
          bottom = top + minHeight;
      }
    }

    // ------------------------------------------------------------
    // Clamp to sheet
    // ------------------------------------------------------------

    left = left.clamp(0.0, sheetSize.width - minWidth);
    top = top.clamp(0.0, sheetSize.height - minHeight);

    right = right.clamp(left + minWidth, sheetSize.width);
    bottom = bottom.clamp(top + minHeight, sheetSize.height);

    // Final safety pass.
    final width = math.max(minWidth, right - left);
    final height = math.max(minHeight, bottom - top);

    return PieceBounds(
      x: left,
      y: top,
      width: width,
      height: height,
    );
  }
}