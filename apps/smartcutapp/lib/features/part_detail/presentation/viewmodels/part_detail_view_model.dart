import 'package:board_cut/features/part_detail/data/model/model.dart';
import 'package:board_cut/features/part_detail/domain/usecases/get_part_by_id.dart';
import 'package:board_cut/features/part_detail/domain/usecases/get_pieces_by_part_id.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../data/model/part_detail_model.dart';
import '../../domain/usecases/generate_pieces_by_part_id.dart';

class PartDetailViewModel extends ChangeNotifier {
  PartDetailViewModel({
    required this.getPartById,
    required this.getPiecesByPartId,
    required this.generatePiecesByPartId,
  });

  final GetPartById getPartById;
  final GetPiecesByPartId getPiecesByPartId;
  final GeneratePiecesByPartId generatePiecesByPartId;
  List<PartDetailPieceModel> _pieces = [];

  List<PartDetailPieceModel> get pieces => _pieces;

  String? _partId;
  PartDetailModel? _partDetailModel;
  bool _isLoading = false;
  String? _error;
  final _limit = 10;
  var _currentPage = 1;
  var _totalCount = 0;
  var _totalPages = 0;

  set partId(String id) {
    _partId = id;
  }

  PartDetailModel? get part => _partDetailModel;

  bool get isLoading => _isLoading;

  int get currentPage => _currentPage;

  int get totalCount => _totalCount;

  int get totalPages => _totalPages;

  int get pageSize => _limit;

  String? get error => _error;

  void clearError() {
    _error = null;
  }

  Future<void> fetchPartDetail() async {
    notifyListeners();
    final result = await getPartById(id: _partId!);

    result.match((failure) => _error = failure.message, (response) {
      _partDetailModel = response;
    });

    _isLoading = false;
    notifyListeners();
  }

  Future<void> fetchPiecesByPartId({int page = 1}) async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    _currentPage = page;

    final result = await getPiecesByPartId(
      page: page,
      limit: _limit,
      partId: _partId!,
    );

    result.match((failure) => _error = failure.message, (response) {
      _pieces = response.items;
      _currentPage = response.page;
      _totalCount = response.total;
      _totalPages = response.totalPages;
    });

    _isLoading = false;
    notifyListeners();
  }

  Future<void> generatePieces() async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    final result = await generatePiecesByPartId(partId: _partId!);

    var wasGenerated = false;
    result.match((failure) => _error = failure.message, (_) {
      wasGenerated = true;
    });

    if (wasGenerated) await fetchPiecesByPartId(page: 1);

    _isLoading = false;
    notifyListeners();
  }
}
