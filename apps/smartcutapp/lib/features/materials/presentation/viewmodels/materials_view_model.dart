import 'package:board_cut/features/materials/data/models/material_model.dart';
import 'package:flutter/foundation.dart';

import '../../domain/usecases/create_material.dart';
import '../../domain/usecases/delete_material.dart';
import '../../domain/usecases/get_materials.dart';
import '../../domain/usecases/update_material.dart';

class MaterialsViewModel extends ChangeNotifier {
  MaterialsViewModel({
    required this.getMaterials,
    required this.createMaterial,
    required this.updateMaterial,
    required this.deleteMaterial,
  });

  final GetMaterials getMaterials;
  final CreateMaterial createMaterial;
  final UpdateMaterial updateMaterial;
  final DeleteMaterial deleteMaterial;

  int _pageSize = 10;
  List<MaterialModel> _materials = [];
  bool _isLoading = false;
  bool _isSaving = false;
  String? _error;
  int _currentPage = 1;
  int _totalCount = 0;
  int _totalPages = 0;
  String _search = '';

  List<MaterialModel> get materials => _materials;
  bool get isLoading => _isLoading;
  bool get isSaving => _isSaving;
  String? get error => _error;
  int get currentPage => _currentPage;
  int get pageSize => _pageSize;
  int get totalCount => _totalCount;
  int get totalPages => _totalPages;
  String get search => _search;

  void setPageSize(int value) {
    if (value < 1 || value == _pageSize) return;
    _pageSize = value;
  }

  Future<void> fetchMaterials({int page = 1, String? search}) async {
    _isLoading = true;
    _error = null;
    _currentPage = page;
    if (search != null) _search = search;
    notifyListeners();

    final result = await getMaterials(
      page: _currentPage,
      limit: _pageSize,
      search: _search.isEmpty ? null : _search,
    );
    result.match((failure) => _error = failure.message, (response) {
      _materials = response.items;
      _currentPage = response.page;
      _totalCount = response.total;
      _totalPages = response.totalPages;
    });

    _isLoading = false;
    notifyListeners();
  }

  Future<String?> saveMaterial({
    String? materialId,
    required Map<String, dynamic> data,
  }) async {
    _isSaving = true;
    _error = null;
    notifyListeners();

    final result = materialId == null
        ? await createMaterial(data: data)
        : await updateMaterial(materialId: materialId, data: data);
    var succeeded = false;
    result.match((failure) => _error = failure.message, (response) {
      if (response.success) {
        succeeded = true;
      } else {
        _error = response.message;
      }
    });

    final message = _error;
    _isSaving = false;
    notifyListeners();
    if (succeeded) {
      await fetchMaterials(page: materialId == null ? 1 : _currentPage);
    }
    return succeeded ? null : (message ?? 'Could not save material.');
  }

  Future<String?> removeMaterial(String materialId) async {
    _error = null;
    final result = await deleteMaterial(materialId: materialId);
    var succeeded = false;
    result.match((failure) => _error = failure.message, (response) {
      if (response.success) {
        succeeded = true;
      } else {
        _error = response.message;
      }
    });
    final message = _error;
    if (succeeded) {
      final page = _currentPage > 1 && _materials.length == 1
          ? _currentPage - 1
          : _currentPage;
      await fetchMaterials(page: page);
    } else {
      notifyListeners();
    }
    return succeeded ? null : (message ?? 'Could not delete material.');
  }
}
