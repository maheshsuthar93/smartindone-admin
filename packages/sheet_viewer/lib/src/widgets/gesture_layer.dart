import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../sheet_viewer.dart';
import '../interactions/hit_test_engine.dart';

class GestureLayer extends StatelessWidget {
  const GestureLayer({
    super.key,
    required this.controller,
    required this.child,
    required this.callbacks,
  });

  final SheetViewerController controller;
  final Widget child;
  final SheetViewerCallbacks callbacks;

  static const double _zoomFactor = 1.1;
  final HitTestEngine _hitTester = const HitTestEngine();

  @override
  Widget build(BuildContext context) {
    return Listener(
      behavior: HitTestBehavior.opaque,
      onPointerDown: _onPointerDown,
      onPointerSignal: _onPointerSignal,
      onPointerHover: _onPointerHover,
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onPanUpdate: (details) {
          controller.translate(details.delta);
        },

        child: child,
      ),
    );
  }

  void _onPointerSignal(PointerSignalEvent event) {
    if (event is! PointerScrollEvent) {
      return;
    }

    final factor = event.scrollDelta.dy < 0 ? _zoomFactor : 1 / _zoomFactor;

    controller.zoomAt(focalPoint: event.localPosition, scaleFactor: factor);
  }

  void _onPointerHover(PointerHoverEvent event) {
    final hit = _hitTester.hitTest(
      position: event.localPosition,
      scene: controller.renderScene,
    );

    controller.setHoveredPiece(hit?.piece);
  }

  void _onPointerDown(PointerDownEvent event) {
    final hit = _hitTester.hitTest(
      position: event.localPosition,
      scene: controller.renderScene,
    );

    // Update hover state
    controller.setHoveredPiece(hit?.piece);

    if (hit == null) {
      // Clear selection
      controller.selection.clear();

      callbacks.onBackgroundTap?.call();
      return;
    }

    // Update selection
    controller.selection.select(hit.piece);

    // Notify application
    callbacks.onPieceTap?.call(
      PieceInteractionEvent(
        piece: hit.piece,
        localPosition: event.localPosition,
        globalPosition: event.position,
        kind: event.kind,
        buttons: event.buttons,
      ),
    );
  }
}
