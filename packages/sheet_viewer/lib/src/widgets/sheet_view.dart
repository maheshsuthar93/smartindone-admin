import 'package:flutter/material.dart';

import '../../sheet_viewer.dart';
import '../rendering/render_pipeline.dart';
import '../rendering/renderers/background_renderer.dart';
import '../rendering/renderers/edge_band_renderer.dart';
import '../rendering/renderers/grain_renderer.dart';
import '../rendering/renderers/hover_renderer.dart';
import '../rendering/renderers/kerf_renderer.dart';
import '../rendering/renderers/label_renderer.dart';
import '../rendering/renderers/piece_renderer.dart';
import '../rendering/renderers/remaining_area_renderer.dart';
import '../rendering/renderers/selection_renderer.dart';
import '../rendering/renderers/sheet_renderer.dart';
import '../rendering/sheet_painter.dart';
import '../theme/sheet_viewer_theme.dart';
import 'gesture_layer.dart';

class SheetView extends StatefulWidget {
  const SheetView({
    super.key,
    required this.controller,
    required this.callbacks,
    this.showZoomControls = true,
  });

  final SheetViewerController controller;
  final SheetViewerCallbacks callbacks;
  final bool showZoomControls;

  @override
  State<SheetView> createState() => _SheetViewState();
}

class _SheetViewState extends State<SheetView>
    with SingleTickerProviderStateMixin {
  late final RenderPipeline _pipeline;

  @override
  void initState() {
    super.initState();

    _pipeline = const RenderPipeline(
      renderers: [
        BackgroundRenderer(),
        SheetRenderer(),
        RemainingAreaRenderer(),
        PieceRenderer(),
        KerfRenderer(),
        GrainRenderer(),
        EdgeBandRenderer(),
        LabelRenderer(),
        HoverRenderer(),
        SelectionRenderer(),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = SheetViewerTheme.of(context);

    return LayoutBuilder(
      builder: (context, constraints) {
        final size = Size(constraints.maxWidth, constraints.maxHeight);

        widget.controller.setViewportSize(size);

        return GestureLayer(
          controller: widget.controller,
          callbacks: widget.callbacks,
          child: RepaintBoundary(
            child: CustomPaint(
              painter: SheetPainter(
                controller: widget.controller,
                theme: theme,
                pipeline: _pipeline,
              ),
              size: size,
            ),
          ),
        );
      },
    );
  }
}
