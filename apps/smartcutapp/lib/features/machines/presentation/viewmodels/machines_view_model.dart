import 'package:board_cut/core/network/paginated_result_model.dart';
import 'package:board_cut/features/factories/data/models/factory_model.dart';
import 'package:board_cut/features/factories/domain/usecases/get_factories.dart';
import 'package:board_cut/features/machines/data/data_sources/machine_remote_data_source.dart';
import 'package:board_cut/features/machines/data/models/machine_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class MachinesViewModel extends ChangeNotifier {
  MachinesViewModel({
    required this.machineRemoteDataSource,
    required this.getFactories,
  });

  final MachineRemoteDataSource machineRemoteDataSource;
  final GetFactories getFactories;

  int _pageSize = 10;
  List<MachineModel> _machines = [];
  List<FactoryModel> _factories = [];
  int _currentPage = 1;
  int _totalCount = 0;
  int _totalPages = 1;
  String _search = '';
  bool _isLoading = false;
  bool _isSaving = false;
  String? _error;

  List<MachineModel> get machines => _machines;
  List<FactoryModel> get factories => _factories;
  int get currentPage => _currentPage;
  int get totalCount => _totalCount;
  int get totalPages => _totalPages;
  int get pageSize => _pageSize;
  String get search => _search;
  bool get isLoading => _isLoading;
  bool get isSaving => _isSaving;
  String? get error => _error;

  void setPageSize(int value) {
    if (value > 0) _pageSize = value;
  }

  Future<void> initialize() async {
    _isLoading = true;
    _error = null;
    notifyListeners();
    try {
      final factoriesResult = await getFactories();
      factoriesResult.match(
        (failure) => _error = failure.message,
        (factories) => _factories = factories,
      );
      await _loadMachines(page: 1);
    } on DioException catch (error) {
      _error = _dioMessage(error);
    } catch (error) {
      _error = error.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> fetchMachines({int page = 1, String? search}) async {
    _isLoading = true;
    _error = null;
    if (search != null) _search = search;
    notifyListeners();
    try {
      await _loadMachines(page: page);
    } on DioException catch (error) {
      _error = _dioMessage(error);
    } catch (error) {
      _error = error.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> _loadMachines({required int page}) async {
    final result = await machineRemoteDataSource.getMachines(
      page: page,
      limit: _pageSize,
      search: _search.isEmpty ? null : _search,
    );
    _applyPage(result);
  }

  void _applyPage(PaginatedResult<MachineModel> result) {
    _machines = result.items;
    _currentPage = result.page;
    _totalCount = result.total;
    _totalPages = result.totalPages;
  }

  Future<String?> saveMachine({
    String? machineId,
    required Map<String, dynamic> data,
  }) async {
    _isSaving = true;
    _error = null;
    notifyListeners();
    try {
      final response = machineId == null
          ? await machineRemoteDataSource.createMachine(data: data)
          : await machineRemoteDataSource.updateMachine(
              machineId: machineId,
              data: data,
            );
      if (!response.success) throw StateError(response.message);
      await fetchMachines(page: machineId == null ? 1 : _currentPage);
      return null;
    } on DioException catch (error) {
      return _error = _dioMessage(error);
    } catch (error) {
      return _error = error.toString();
    } finally {
      _isSaving = false;
      notifyListeners();
    }
  }

  Future<String?> deactivateMachine(String machineId) async {
    _isSaving = true;
    _error = null;
    notifyListeners();
    try {
      final response = await machineRemoteDataSource.deactivateMachine(
        machineId: machineId,
      );
      if (!response.success) throw StateError(response.message);
      final page = _currentPage > 1 && _machines.length == 1
          ? _currentPage - 1
          : _currentPage;
      await fetchMachines(page: page);
      return null;
    } on DioException catch (error) {
      return _error = _dioMessage(error);
    } catch (error) {
      return _error = error.toString();
    } finally {
      _isSaving = false;
      notifyListeners();
    }
  }

  String _dioMessage(DioException error) {
    final data = error.response?.data;
    if (data is Map<String, dynamic> && data['message'] is String) {
      return data['message'] as String;
    }
    return error.message ?? 'The machine request failed.';
  }
}
