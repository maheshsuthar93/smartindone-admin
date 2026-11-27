import 'package:board_cut/core/core.dart';
import 'package:dio/dio.dart';

import 'physical_sheets_remote_data_source.dart';
import '../../models/physical_sheet_model.dart';

import 'package:board_cut/features/materials/data/models/material_model.dart';
import 'package:board_cut/features/warehouses/data/models/warehouse_model.dart';

class PhysicalSheetsRemoteDataSourceImpl
    implements PhysicalSheetsRemoteDataSource {
  PhysicalSheetsRemoteDataSourceImpl(this.api);

  final ApiClient api;

  Map<String, dynamic> _body(Response<dynamic> response) =>
      response.data as Map<String, dynamic>;

  List<Map<String, dynamic>> _list(Response<dynamic> response) {
    final body = _body(response);
    if (body['success'] != true) {
      throw Exception(body['message'] ?? 'Request failed');
    }
    return ((body['data'] as List?) ?? []).cast<Map<String, dynamic>>();
  }

  Future<ApiResponse> _mutate(
    Future<Response<dynamic>> Function() request,
  ) async {
    try {
      final response = await request();
      return ApiResponse.fromJson(response.data, (data) => data);
    } on DioException {
      rethrow;
    }
  }

  @override
  Future<PaginatedResult<PhysicalSheetModel>> getSheets({
    required int page,
    required int limit,
    String? search,
  }) async {
    try {
      final response = await api.get(
        '/api/sheets',
        queryParameters: {
          'page': page,
          'limit': limit,
          if (search?.isNotEmpty == true) 'search': search,
        },
      );
      final body = _body(response);
      if (body['success'] != true) {
        throw Exception(body['message'] ?? 'Could not load sheets');
      }
      final meta = body['pagination'] as Map<String, dynamic>;
      return PaginatedResult(
        items: ((body['data'] as List?) ?? [])
            .map(
              (row) => PhysicalSheetModel.fromJson(
                (row as Map).cast<String, dynamic>(),
              ),
            )
            .toList(),
        page: (meta['page'] as num).toInt(),
        total: (meta['total'] as num).toInt(),
        totalPages: (meta['totalPages'] as num).toInt(),
      );
    } on DioException {
      rethrow;
    }
  }

  @override
  Future<List<MaterialModel>> getMaterials() async {
    try {
      return _list(
        await api.get(
          '/api/materials',
          queryParameters: {'page': 1, 'limit': 100},
        ),
      ).map(MaterialModel.fromJson).toList();
    } on DioException {
      rethrow;
    }
  }

  @override
  Future<List<WarehouseModel>> getWarehouses() async {
    try {
      return _list(
        await api.get(
          '/api/warehouses',
          queryParameters: {'page': 1, 'limit': 100},
        ),
      ).map(WarehouseModel.fromJson).toList();
    } on DioException {
      rethrow;
    }
  }

  @override
  Future<ApiResponse> createFull(Map<String, dynamic> data) =>
      _mutate(() => api.post('/api/sheets/full', data: data));

  @override
  Future<ApiResponse> createOffcut(Map<String, dynamic> data) =>
      _mutate(() => api.post('/api/sheets/offcut', data: data));

  @override
  Future<ApiResponse> action(String id, String action) =>
      _mutate(() => api.post('/api/sheets/$id/$action', data: const {}));

  @override
  Future<ApiResponse> transfer(String id, String warehouseId) => _mutate(
    () => api.post(
      '/api/sheets/$id/transfer',
      data: {'warehouseId': warehouseId},
    ),
  );
}
