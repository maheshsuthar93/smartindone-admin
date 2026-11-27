import 'package:flutter/material.dart';

import '../../sheet_viewer.dart';

@immutable
final class SheetMaterial {
  const SheetMaterial({
    required this.id,
    required this.name,
    required this.color,
    this.thickness = 18,
    this.grainDirection = GrainDirection.horizontal,
    this.texture,
    this.opacity = 1.0,
  });

  /// Unique material identifier.
  final String id;

  /// Display name.
  ///
  /// Example:
  /// MDF White
  /// Walnut
  /// Oak Veneer
  final String name;

  /// Fill color used by the viewer.
  final Color color;

  /// Thickness in millimetres.
  final double thickness;

  /// Default grain direction.
  final GrainDirection grainDirection;

  /// Optional texture asset or identifier.
  final String? texture;

  /// Material opacity.
  final double opacity;

  SheetMaterial copyWith({
    String? id,
    String? name,
    Color? color,
    double? thickness,
    GrainDirection? grainDirection,
    String? texture,
    double? opacity,
  }) {
    return SheetMaterial(
      id: id ?? this.id,
      name: name ?? this.name,
      color: color ?? this.color,
      thickness: thickness ?? this.thickness,
      grainDirection: grainDirection ?? this.grainDirection,
      texture: texture ?? this.texture,
      opacity: opacity ?? this.opacity,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SheetMaterial &&
          id == other.id &&
          name == other.name &&
          color == other.color &&
          thickness == other.thickness &&
          grainDirection == other.grainDirection &&
          texture == other.texture &&
          opacity == other.opacity;

  @override
  int get hashCode =>
      Object.hash(id, name, color, thickness, grainDirection, texture, opacity);
}
