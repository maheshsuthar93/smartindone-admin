import 'package:flutter/material.dart';

import '../models/piece_status.dart';

@immutable
final class PieceStatusTheme {
  const PieceStatusTheme({
    this.pending = const Color(0xFF9E9E9E),
    this.cutting = const Color(0xFF2196F3),
    this.edgeBanding = const Color(0xFFFF9800),
    this.drilling = const Color(0xFF9C27B0),
    this.cnc = const Color(0xFF3F51B5),
    this.qualityCheck = const Color(0xFF00BCD4),
    this.completed = const Color(0xFF4CAF50),
    this.rejected = const Color(0xFFF44336),
  });

  final Color pending;
  final Color cutting;
  final Color edgeBanding;
  final Color drilling;
  final Color cnc;
  final Color qualityCheck;
  final Color completed;
  final Color rejected;

  Color colorOf(PieceStatus status) {
    switch (status) {
      case PieceStatus.pending:
        return pending;

      case PieceStatus.cutting:
        return cutting;

      case PieceStatus.edgeBanding:
        return edgeBanding;

      case PieceStatus.drilling:
        return drilling;

      case PieceStatus.cnc:
        return cnc;

      case PieceStatus.qualityCheck:
        return qualityCheck;

      case PieceStatus.completed:
        return completed;

      case PieceStatus.rejected:
        return rejected;
    }
  }
}
