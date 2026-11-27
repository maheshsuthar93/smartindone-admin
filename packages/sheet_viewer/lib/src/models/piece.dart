import 'package:flutter/foundation.dart';
import 'package:sheet_viewer/src/enums/enums.dart';

import 'edge_side.dart';
import 'piece_bounds.dart';

@immutable
class Piece {
  const Piece({
    required this.id,
    required this.label,
    required this.bounds,
    required this.materialId,
    this.quantity = 1,
    this.rotation = PieceRotation.none,
    this.grainDirection = GrainDirection.none,
    this.edgeBands = const <EdgeSide>{},
    this.data,
    this.partNo,
    this.materialName,
    this.thickness,
    this.remarks,
    required this.type,
  });

  final String? partNo;

  final String? materialName;

  final double? thickness;

  final String? remarks;
  final String id;

  final String label;

  final PieceBounds bounds;

  final String materialId;

  /// Number of identical parts represented by this piece.
  ///
  /// Defaults to 1.
  final int quantity;

  final PieceRotation rotation;

  final GrainDirection grainDirection;

  final Set<EdgeSide> edgeBands;

  final Object? data;
  final PieceType type;

  bool hasEdgeBand(EdgeSide side) => edgeBands.contains(side);

  String get sizeLabel => '${bounds.width.toInt()} × ${bounds.height.toInt()}';

  Piece copyWith({
    String? id,
    String? label,
    PieceBounds? bounds,
    String? materialId,
    int? quantity,
    PieceRotation? rotation,
    GrainDirection? grainDirection,
    Set<EdgeSide>? edgeBands,
    Object? data = _sentinel,
  }) {
    return Piece(
      id: id ?? this.id,
      label: label ?? this.label,
      bounds: bounds ?? this.bounds,
      materialId: materialId ?? this.materialId,
      quantity: quantity ?? this.quantity,
      rotation: rotation ?? this.rotation,
      grainDirection: grainDirection ?? this.grainDirection,
      edgeBands: edgeBands ?? this.edgeBands,
      data: identical(data, _sentinel) ? this.data : data,
      type: type,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Piece &&
          id == other.id &&
          label == other.label &&
          bounds == other.bounds &&
          materialId == other.materialId &&
          quantity == other.quantity &&
          rotation == other.rotation &&
          grainDirection == other.grainDirection &&
          setEquals(edgeBands, other.edgeBands) &&
          data == other.data &&
          type == other.type;

  @override
  int get hashCode => Object.hash(
    id,
    label,
    bounds,
    materialId,
    quantity,
    rotation,
    grainDirection,
    Object.hashAll(edgeBands),
    data,
    type,
  );
}

const _sentinel = Object();

enum PieceRotation { none, clockwise90, clockwise180, clockwise270 }

enum GrainDirection { none, horizontal, vertical }
