import 'package:board_cut/core/enums/enums.dart';
import 'package:board_cut/core/extensions/process_status_ext.dart';
import 'package:board_cut/features/piece_detail/data/model/selected_piece_model.dart';
import 'package:board_cut/features/piece_detail/domain/usecases/get_piece_by_code.dart';
import 'package:board_cut/features/piece_detail/domain/usecases/get_piece_by_id.dart';
import 'package:board_cut/features/piece_detail/domain/usecases/update_piece_process_status.dart';
import 'package:flutter/foundation.dart';

class ShopFloorViewModel extends ChangeNotifier {
  ShopFloorViewModel({
    required this.getPieceByCode,
    required this.getPieceById,
    required this.updatePieceProcessStatus,
  });

  final GetPieceByCode getPieceByCode;
  final GetPieceById getPieceById;
  final UpdatePieceProcessStatus updatePieceProcessStatus;

  SelectedPieceModel? _piece;
  bool _isLookingUp = false;
  String? _error;
  String? _updatingProcessId;

  SelectedPieceModel? get piece => _piece;
  bool get isLookingUp => _isLookingUp;
  String? get error => _error;
  String? get updatingProcessId => _updatingProcessId;

  Future<void> findPiece(String code) async {
    final normalizedCode = code.trim();
    if (normalizedCode.isEmpty) {
      _error = 'Scan or enter a piece code.';
      notifyListeners();
      return;
    }

    _isLookingUp = true;
    _error = null;
    notifyListeners();

    final result = await getPieceByCode(pieceCode: normalizedCode);
    result.match(
      (failure) {
        _piece = null;
        _error = failure.message;
      },
      (piece) {
        _piece = piece;
      },
    );

    _isLookingUp = false;
    notifyListeners();
  }

  Future<void> updateProcess({
    required String processTypeId,
    required ProcessStatus status,
  }) async {
    final piece = _piece;
    if (piece == null) return;

    _updatingProcessId = processTypeId;
    _error = null;
    notifyListeners();

    final result = await updatePieceProcessStatus(
      data: {
        'pieceId': piece.id,
        'processTypeId': processTypeId,
        'status': status.value,
      },
    );

    var wasUpdated = false;
    result.match(
      (failure) => _error = failure.message,
      (_) => wasUpdated = true,
    );

    if (wasUpdated) {
      final refreshedPiece = await getPieceById(pieceId: piece.id);
      refreshedPiece.match(
        (failure) => _error = failure.message,
        (updatedPiece) => _piece = updatedPiece,
      );
    }

    _updatingProcessId = null;
    notifyListeners();
  }

  void clearPiece() {
    _piece = null;
    _error = null;
    notifyListeners();
  }
}
