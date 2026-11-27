import 'package:flutter/foundation.dart';

import 'dart:ui';

import 'piece_status.dart';

@immutable
final class PieceStatusUpdate {
  const PieceStatusUpdate({
    required this.pieceId,
    this.status,
    this.label,
    this.color,
    this.sequenceOrder,
  });

  final String pieceId;
  final PieceStatus? status;
  final String? label;
  final Color? color;
  final int? sequenceOrder;
}
