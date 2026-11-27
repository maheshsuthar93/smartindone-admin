import 'package:flutter/widgets.dart';
import 'package:sheet_viewer/src/controllers/piece_status_controller.dart';
import 'package:sheet_viewer/src/controllers/selection_controller.dart';

import '../enums/piece_type.dart';
import '../models/piece.dart';
import '../models/sheet.dart';
import '../models/sheet_layout.dart';
import '../rendering/render_scene.dart';
import 'viewport_state.dart';

final class SheetViewerController extends ChangeNotifier {
  SheetViewerController({required this._layout});

  SheetLayout _layout;

  int _currentSheetIndex = 0;

  ViewportState _viewport = const ViewportState();

  Piece? _hoveredPiece;

  RenderScene _renderScene = const RenderScene(pieces: []);
  Size _viewportSize = Size.zero;
  final SelectionController selection = SelectionController();

  String? get selectedPiece => selection.selectedPieceId;

  final PieceStatusController status = PieceStatusController();

  void setViewportSize(Size size) {
    _viewportSize = size;
  }

  void selectPiece(Piece? piece) {
    selection.select(piece);
  }

  //--------------------------------------------------------------------------
  // Layout
  //--------------------------------------------------------------------------

  SheetLayout get layout => _layout;

  Sheet get currentSheet => _layout.sheets[_currentSheetIndex];

  int get currentSheetIndex => _currentSheetIndex;

  //--------------------------------------------------------------------------
  // Viewport
  //--------------------------------------------------------------------------

  ViewportState get viewport => _viewport;

  double get scale => _viewport.scale;

  Offset get offset => _viewport.offset;

  //--------------------------------------------------------------------------
  // Interaction
  //--------------------------------------------------------------------------

  Piece? get hoveredPiece => _hoveredPiece;

  RenderScene get renderScene => _renderScene;

  //--------------------------------------------------------------------------
  // Layout
  //--------------------------------------------------------------------------

  void setLayout(SheetLayout layout) {
    _layout = layout;

    if (_currentSheetIndex >= layout.sheets.length) {
      _currentSheetIndex = 0;
    }

    notifyListeners();
  }

  void showSheet(int index) {
    if (index < 0 || index >= _layout.sheets.length) {
      return;
    }

    if (_currentSheetIndex == index) {
      return;
    }

    _currentSheetIndex = index;

    notifyListeners();
  }

  void nextSheet() {
    if (_currentSheetIndex >= _layout.sheets.length - 1) {
      return;
    }

    _currentSheetIndex++;

    notifyListeners();
  }

  void previousSheet() {
    if (_currentSheetIndex <= 0) {
      return;
    }

    _currentSheetIndex--;

    notifyListeners();
  }

  //--------------------------------------------------------------------------
  // Viewport
  //--------------------------------------------------------------------------

  void setScale(double scale) {
    final next = _viewport.copyWith(scale: scale).clampScale();

    if (next == _viewport) {
      return;
    }

    _viewport = next;

    notifyListeners();
  }

  void setOffset(Offset offset) {
    final clamped = _clampOffset(offset, viewport.scale);

    if (clamped == viewport.offset) {
      return;
    }

    _viewport = _viewport.copyWith(offset: clamped);

    notifyListeners();
  }

  void translate(Offset delta) {
    setOffset(_viewport.offset + delta);
  }

  void resetView() {
    _viewport = const ViewportState();

    notifyListeners();
  }

  /// Fits the current sheet into the available viewport.
  //void fitToScreen(Size viewportSize, {double padding = 24}) {
  void fitToScreen({double padding = 24}) {
    final sheet = currentSheet;

    final availableWidth = _viewportSize.width - padding * 2;
    final availableHeight = _viewportSize.height - padding * 2;

    if (availableWidth <= 0 || availableHeight <= 0) {
      return;
    }

    final scaleX = availableWidth / sheet.width;
    final scaleY = availableHeight / sheet.height;

    final scale = scaleX < scaleY ? scaleX : scaleY;

    final offset = Offset(
      (_viewportSize.width - sheet.width * scale) / 2,
      (_viewportSize.height - sheet.height * scale) / 2,
    );

    _viewport = _viewport.copyWith(scale: scale, offset: offset);

    notifyListeners();
  }

  //--------------------------------------------------------------------------
  // Hover
  //--------------------------------------------------------------------------

  void setHoveredPiece(Piece? piece) {
    if (_hoveredPiece == piece) {
      return;
    }

    _hoveredPiece = piece;

    notifyListeners();
  }

  //--------------------------------------------------------------------------
  // Render Scene
  //--------------------------------------------------------------------------

  void updateRenderScene(RenderScene scene) {
    _renderScene = scene;
  }

  //--------------------------------------------------------------------------
  // Utilities
  //--------------------------------------------------------------------------

  void zoomAt({required Offset focalPoint, required double scaleFactor}) {
    final oldScale = viewport.scale;

    final newScale = (oldScale * scaleFactor)
        .clamp(viewport.minScale, viewport.maxScale)
        .toDouble();

    if (oldScale == newScale) {
      return;
    }

    // Convert screen → world
    final worldPoint = Offset(
      (focalPoint.dx - viewport.offset.dx) / oldScale,
      (focalPoint.dy - viewport.offset.dy) / oldScale,
    );

    // Compute new offset so the world point remains
    // under the mouse cursor.
    final newOffset = Offset(
      focalPoint.dx - worldPoint.dx * newScale,
      focalPoint.dy - worldPoint.dy * newScale,
    );

    _viewport = _viewport.copyWith(
      scale: newScale,
      offset: _clampOffset(newOffset, newScale),
    );

    notifyListeners();
  }

  Offset _clampOffset(Offset offset, double scale) {
    const double margin = 150.0;

    final sheet = currentSheet;

    final sheetWidth = sheet.width * scale;
    final sheetHeight = sheet.height * scale;

    final viewport = _viewportSize;

    if (viewport == Size.zero) {
      return offset;
    }

    final minX = viewport.width - sheetWidth - margin;
    final maxX = margin;

    final minY = viewport.height - sheetHeight - margin;
    final maxY = margin;

    return Offset(
      offset.dx.clamp(minX, maxX).toDouble(),
      offset.dy.clamp(minY, maxY).toDouble(),
    );
  }

  void zoomIn([double factor = 1.2]) {
    zoomAt(
      focalPoint: Offset(_viewportSize.width / 2, _viewportSize.height / 2),
      scaleFactor: factor,
    );
  }

  void zoomOut([double factor = 1.2]) {
    zoomAt(
      focalPoint: Offset(_viewportSize.width / 2, _viewportSize.height / 2),
      scaleFactor: 1 / factor,
    );
  }

  double get usedArea {
    return currentSheet.pieces
        .where((piece) => piece.type == PieceType.normal)
        .fold(
          0,
          (sum, piece) => sum + piece.bounds.width * piece.bounds.height,
        );
  }

  double get sheetArea {
    return currentSheet.width * currentSheet.height;
  }

  double get wasteArea {
    return sheetArea - usedArea;
  }

  double get utilization {
    if (sheetArea == 0) return 0;
    return usedArea / sheetArea;
  }
}
