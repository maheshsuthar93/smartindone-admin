import 'package:flutter/foundation.dart';

import 'piece.dart';

@immutable
final class Sheet {
  const Sheet({
    required this.id,
    required this.name,
    required this.width,
    required this.height,
    this.pieces = const <Piece>[],
    this.data,
  });

  /// Unique sheet identifier.
  final String id;

  /// Display name.
  ///
  /// Example:
  /// "Sheet 1"
  /// "Board A"
  final String name;

  /// Sheet width (mm).
  final double width;

  /// Sheet height (mm).
  final double height;

  /// Pieces placed on this sheet.
  final List<Piece> pieces;

  /// Optional application-specific object.
  final Object? data;

  //--------------------------------------------------------------------------
  // Derived properties
  //--------------------------------------------------------------------------

  double get area => width * height;

  bool get isEmpty => pieces.isEmpty;

  int get pieceCount => pieces.length;

  Sheet copyWith({
    String? id,
    String? name,
    double? width,
    double? height,
    List<Piece>? pieces,
    Object? data = _sentinel,
  }) {
    return Sheet(
      id: id ?? this.id,
      name: name ?? this.name,
      width: width ?? this.width,
      height: height ?? this.height,
      pieces: pieces ?? this.pieces,
      data: identical(data, _sentinel) ? this.data : data,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is Sheet &&
              id == other.id &&
              name == other.name &&
              width == other.width &&
              height == other.height &&
              listEquals(pieces, other.pieces) &&
              data == other.data;

  @override
  int get hashCode => Object.hash(
    id,
    name,
    width,
    height,
    Object.hashAll(pieces),
    data,
  );
}

const _sentinel = Object();