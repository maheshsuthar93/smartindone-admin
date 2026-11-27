import 'package:flutter/material.dart';

import '../../models/sheet_material.dart';

final class MaterialPaintCache {
  MaterialPaintCache();

  final Map<int, Paint> _cache = {};

  Paint paintFor(SheetMaterial? material) {
    final color = material?.color ?? Colors.grey;
    final opacity = material?.opacity ?? 1.0;

    final key = Object.hash(color.toARGB32(), opacity);

    return _cache.putIfAbsent(
      key,
      () => Paint()
        ..color = color.withValues(alpha: opacity)
        ..style = PaintingStyle.fill,
    );
  }

  void clear() {
    _cache.clear();
  }
}
