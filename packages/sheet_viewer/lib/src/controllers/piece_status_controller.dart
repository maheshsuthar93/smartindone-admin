import 'dart:ui';

import 'package:flutter/foundation.dart';

import '../models/piece.dart';
import '../models/piece_status.dart';
import '../models/piece_status_update.dart';

final class PieceStatusController extends ChangeNotifier {
  final Map<String, PieceStatusUpdate> _statuses = {};

  /// Returns the status of a piece.
  PieceStatus statusOf(Piece piece) {
    return statusById(piece.id);
  }

  /// Returns the status by piece id.
  PieceStatus statusById(String pieceId) {
    return _statuses[pieceId]?.status ?? PieceStatus.pending;
  }

  String? labelById(String pieceId) {
    return _statuses[pieceId]?.label;
  }

  Color? colorById(String pieceId) {
    return _statuses[pieceId]?.color;
  }

  /// Updates one piece.
  void setStatus(String pieceId, PieceStatus status) {
    final current = _statuses[pieceId];
    if (current?.status == status &&
        current?.label == null &&
        current?.color == null) {
      return;
    }

    _statuses[pieceId] = PieceStatusUpdate(pieceId: pieceId, status: status);
    notifyListeners();
  }

  /// Updates multiple pieces at once.
  void setStatuses(Iterable<PieceStatusUpdate> updates) {
    var changed = false;

    for (final update in updates) {
      final current = _statuses[update.pieceId];
      if (current?.status != update.status ||
          current?.label != update.label ||
          current?.color != update.color ||
          current?.sequenceOrder != update.sequenceOrder) {
        _statuses[update.pieceId] = update;
        changed = true;
      }
    }

    if (changed) {
      notifyListeners();
    }
  }

  /// Removes a single status.
  void removeStatus(String pieceId) {
    if (_statuses.remove(pieceId) != null) {
      notifyListeners();
    }
  }

  /// Clears all statuses.
  void clear() {
    if (_statuses.isEmpty) {
      return;
    }

    _statuses.clear();
    notifyListeners();
  }

  bool contains(String pieceId) {
    return _statuses.containsKey(pieceId);
  }

  Map<String, PieceStatusUpdate> get statuses => Map.unmodifiable(_statuses);
}
