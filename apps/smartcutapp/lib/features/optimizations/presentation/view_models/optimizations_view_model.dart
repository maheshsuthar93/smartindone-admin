import 'package:board_cut/features/optimizations/data/model/model.dart';
import 'package:board_cut/features/optimizations/domain/usecases/create_order_optimization.dart';
import 'package:flutter/material.dart';

import '../../data/model/material_group_model.dart';
import '../../domain/usecases/get_material_groups_by_optimization_id.dart';
import '../../domain/usecases/get_optimizations_by_order_id.dart';
import '../../domain/usecases/run_optimization_material_group.dart';

class OptimizationsViewModel extends ChangeNotifier {
  OptimizationsViewModel({
    required this.getOptimizationsByOrderId,
    required this.getMaterialGroupsByOptimizationId,
    required this.createOrderOptimization,
    required this.runOptimizationMaterialGroup,
  });

  final CreateOrderOptimization createOrderOptimization;
  final GetOptimizationsByOrderId getOptimizationsByOrderId;
  final GetMaterialGroupsByOptimizationId getMaterialGroupsByOptimizationId;
  final RunOptimizationMaterialGroup runOptimizationMaterialGroup;
  List<OptimizationModel> _optimizations = [];
  List<MaterialGroupModel> _materialGroups = [];

  bool _isLoading = false;
  bool _isLoadingMaterialGroups = false;
  String? _error;
  String? _orderId;
  String? _selectedOptimizationId;
  int _materialGroupRequestId = 0;

  String? get selectedOptimizationId => _selectedOptimizationId;

  int _totalCount = 0;

  final _limit = 10;

  set orderId(String id) {
    _orderId = id;
  }

  List<OptimizationModel> get optimizations => _optimizations;

  OptimizationModel? get selectedOptimization {
    for (final optimization in _optimizations) {
      if (optimization.id == _selectedOptimizationId) return optimization;
    }
    return null;
  }

  List<MaterialGroupModel> get materialGroups => _materialGroups;

  bool get isLoading => _isLoading;
  bool get isLoadingMaterialGroups => _isLoadingMaterialGroups;

  String? get error => _error;

  int get totalCount => _totalCount;

  void clearError() {
    _error = null;
  }

  Future<void> fetchOptimizationsByOrderId() async {
    _isLoading = true;
    _isLoadingMaterialGroups = false;
    _materialGroupRequestId++;
    _error = null;
    notifyListeners();
    final result = await getOptimizationsByOrderId(orderId: _orderId!);

    result.match(
      (failure) {
        _error = failure.message;
        _optimizations = [];
        _selectedOptimizationId = null;
        _materialGroups = [];
      },
      (response) {
        _optimizations = response;
        if (!_optimizations.any((item) => item.id == _selectedOptimizationId)) {
          _selectedOptimizationId = _optimizations.isNotEmpty
              ? _optimizations.first.id
              : null;
        }
        if (_selectedOptimizationId == null) _materialGroups = [];
      },
    );

    _isLoading = false;
    notifyListeners();

    if (_selectedOptimizationId != null) {
      await fetchMaterialGroupsByOptimizationId();
    }
  }

  Future<void> selectOptimizationById(String optimizationId) async {
    if (_selectedOptimizationId == optimizationId ||
        !_optimizations.any((item) => item.id == optimizationId)) {
      return;
    }
    _selectedOptimizationId = optimizationId;
    _materialGroups = [];
    notifyListeners();
    await fetchMaterialGroupsByOptimizationId();
  }

  Future<void> fetchMaterialGroupsByOptimizationId({int page = 1}) async {
    final optimizationId = _selectedOptimizationId;
    if (optimizationId == null || optimizationId.isEmpty) {
      _materialGroups = [];
      _isLoadingMaterialGroups = false;
      notifyListeners();
      return;
    }

    final requestId = ++_materialGroupRequestId;
    _isLoadingMaterialGroups = true;
    _error = null;
    notifyListeners();
    final result = await getMaterialGroupsByOptimizationId(
      optimizationId: optimizationId,
      page: page,
      limit: _limit,
    );

    if (requestId != _materialGroupRequestId ||
        optimizationId != _selectedOptimizationId) {
      return;
    }

    result.match((failure) => _error = failure.message, (response) {
      _materialGroups = response.items;
      _totalCount = response.total;
    });

    _isLoadingMaterialGroups = false;
    _isLoading = false;
    notifyListeners();
  }

  Future<void> createOptimization() async {
    _isLoading = true;
    _error = null;
    notifyListeners();
    final result = await createOrderOptimization(orderId: _orderId!);

    var created = false;
    result.match((failure) => _error = failure.message, (response) {
      if (response.isNotEmpty) {
        _selectedOptimizationId = response.first.id;
        _materialGroups = [];
        created = true;
      }
    });

    _isLoading = false;
    notifyListeners();
    if (created) {
      // Refresh the complete run history and then load groups for the new run.
      await fetchOptimizationsByOrderId();
    }
  }

  Future<void> runOptimizationMaterialGroupById(String materialGroupId) async {
    notifyListeners();
    final result = await runOptimizationMaterialGroup(
      materialGroupId: materialGroupId,
    );

    var completed = false;
    result.match((failure) {
      _error = failure.message;
    }, (_) => completed = true);

    _isLoading = false;
    notifyListeners();

    if (completed) await fetchOptimizationsByOrderId();
  }
}
