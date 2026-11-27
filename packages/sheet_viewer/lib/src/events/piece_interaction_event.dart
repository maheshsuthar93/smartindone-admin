import 'package:flutter/gestures.dart';
import 'package:flutter/widgets.dart';

import '../../sheet_viewer.dart';

@immutable
final class PieceInteractionEvent {
  const PieceInteractionEvent({
    required this.piece,
    required this.localPosition,
    required this.globalPosition,
    required this.kind,
    required this.buttons,
  });

  /// The interacted piece.
  final Piece piece;

  /// Position inside the SheetViewer.
  final Offset localPosition;

  /// Global screen position.
  final Offset globalPosition;

  /// Mouse, touch, stylus...
  final PointerDeviceKind kind;

  /// Pointer buttons bitmask.
  final int buttons;

  bool get isMouse => kind == PointerDeviceKind.mouse;

  bool get isTouch => kind == PointerDeviceKind.touch;

  bool get isStylus => kind == PointerDeviceKind.stylus;

  bool get isPrimaryButton => (buttons & kPrimaryButton) != 0;

  bool get isSecondaryButton => (buttons & kSecondaryButton) != 0;

  bool get isMiddleButton => (buttons & kMiddleMouseButton) != 0;
}
