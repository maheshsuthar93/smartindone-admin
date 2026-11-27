import '../../theme/sheet_viewer_theme_data.dart';
import 'material_paint_cache.dart';
import 'paint_cache.dart';
import 'text_cache.dart';

final class RenderCache {
  RenderCache({required SheetViewerThemeData theme})
    : paint = PaintCache(theme);

  final PaintCache paint;

  final MaterialPaintCache material = MaterialPaintCache();
  final TextCache text = TextCache();
  void updateTheme(SheetViewerThemeData theme) {
    paint.updateTheme(theme);

    // Theme changed → text style may have changed.
    text.clear();
  }

  void clear() {
    material.clear();
    text.clear();
  }
}
