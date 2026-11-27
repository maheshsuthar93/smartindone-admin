import 'package:flutter/foundation.dart';

import 'sheet.dart';
import 'sheet_material.dart';

@immutable
final class SheetLayout {
  const SheetLayout({
    this.sheets = const <Sheet>[],
    this.materials = const <SheetMaterial>[],
  });

  /// All sheets in the layout.
  final List<Sheet> sheets;

  /// Available materials.
  final List<SheetMaterial> materials;

  //--------------------------------------------------------------------------
  // Derived properties
  //--------------------------------------------------------------------------

  bool get isEmpty => sheets.isEmpty;

  int get sheetCount => sheets.length;

  int get pieceCount =>
      sheets.fold(0, (count, sheet) => count + sheet.pieces.length);

  double get totalSheetArea =>
      sheets.fold(0.0, (sum, sheet) => sum + sheet.area);

  Sheet? sheetById(String id) {
    for (final sheet in sheets) {
      if (sheet.id == id) {
        return sheet;
      }
    }
    return null;
  }

  SheetMaterial? materialById(String id) {
    for (final material in materials) {
      if (material.id == id) {
        return material;
      }
    }
    return null;
  }

  SheetLayout copyWith({
    List<Sheet>? sheets,
    List<SheetMaterial>? materials,
  }) {
    return SheetLayout(
      sheets: sheets ?? this.sheets,
      materials: materials ?? this.materials,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is SheetLayout &&
              listEquals(sheets, other.sheets) &&
              listEquals(materials, other.materials);

  @override
  int get hashCode => Object.hash(
    Object.hashAll(sheets),
    Object.hashAll(materials),
  );
}