import 'package:flutter/foundation.dart';

import '../../sheet_viewer.dart';

final class SelectionController extends ChangeNotifier {
  String? _selectedPieceId;

  String? get selectedPieceId => _selectedPieceId;

  bool get hasSelection => _selectedPieceId != null;

  bool isSelected(Piece piece) => piece.id == selectedPieceId;

  void select(Piece? piece) {
    if (_selectedPieceId == piece?.id) {
      return;
    }

    _selectedPieceId = piece?.id;
    notifyListeners();
  }

  void clear() {
    if (_selectedPieceId == null) {
      return;
    }

    _selectedPieceId = null;
    notifyListeners();
  }
}
