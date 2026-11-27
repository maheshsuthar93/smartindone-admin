import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../data/model/selected_piece_model.dart';
import '../../domain/usecases/get_piece_by_id.dart';
import '../../domain/usecases/update_piece_process_status.dart';

class PieceDetailViewModel extends ChangeNotifier {
  PieceDetailViewModel({
    required this.getPieceById,
    required this.updatePieceProcessStatus,
  });

  final GetPieceById getPieceById;
  final UpdatePieceProcessStatus updatePieceProcessStatus;

  SelectedPieceModel? _selectedPiece;

  SelectedPieceModel? get selectedPiece => _selectedPiece;

  bool _isLoading = false;
  bool _isStatusUpdating = false;
  String? _error;
  String? pieceId;

  bool get isLoading => _isLoading;

  bool get isStatusUpdating => _isStatusUpdating;

  String? get error => _error;

  Future<void> fetchPieceById(String pieceId) async {
    notifyListeners();
    final result = await getPieceById(pieceId: pieceId);

    result.match(
      (failure) {
        return _error = failure.message;
      },
      (response) {
        _selectedPiece = response;
      },
    );

    _isLoading = false;
    notifyListeners();
  }

  Future<void> updatePieceProcessStatusById({
    required String status,
    required String processTypeId,
  }) async {
    _isStatusUpdating = true;
    notifyListeners();
    final result = await updatePieceProcessStatus(
      data: {
        'pieceId': _selectedPiece?.id,
        'status': status,
        'processTypeId': processTypeId,
      },
    );

    result.match(
      (failure) {
        return _error = failure.message;
      },
      (response) {
        fetchPieceById(_selectedPiece?.id ?? '');
      },
    );
    _isStatusUpdating = false;
    notifyListeners();
  }
}
