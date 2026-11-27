import 'package:board_cut/core/core.dart';
import 'package:board_cut/features/layout_view/data/model/sheet_detail_model.dart';
import 'package:dio/dio.dart';

import '../../model/optimization_material_group_model.dart';
import 'layout_view_remote_data_source.dart';

class LayoutViewRemoteDataSourceImpl implements LayoutViewRemoteDataSource {
  LayoutViewRemoteDataSourceImpl(this.apiClient);

  final ApiClient apiClient;

  @override
  Future<OptimizationMaterialGroupModel> getMaterialGroupById({
    required String materialGroupId,
  }) async {
    try {
      final response = await apiClient.get(
        '/api/optimization-material-groups/$materialGroupId',
      );

      final apiResponse = ApiResponse<OptimizationMaterialGroupModel>.fromJson(
        response.data,
        (data) => OptimizationMaterialGroupModel.fromJson(
          data as Map<String, dynamic>,
        ),
      );

      if (!apiResponse.success) {
        throw Exception(apiResponse.message);
      }

      return apiResponse.data!;
    } on DioException {
      rethrow;
    }
  }

  @override
  Future<List<OptimizationProcessType>> getPieceProcessTypes() async {
    try {
      final response = await apiClient.get('/api/piece-process-types');
      final apiResponse = ApiResponse<List<OptimizationProcessType>>.fromJson(
        response.data,
        (data) => (data as List<dynamic>)
            .map(
              (item) => OptimizationProcessType.fromJson(
                item as Map<String, dynamic>,
              ),
            )
            .toList(),
      );

      if (!apiResponse.success) {
        throw Exception(apiResponse.message);
      }

      return apiResponse.data!;
    } on DioException {
      rethrow;
    }
  }

  @override
  Future<SheetDetailModel> getSheetById({required String sheetId}) async {
    try {
      final response = await apiClient.get('/api/sheets/$sheetId');

      final apiResponse = ApiResponse<SheetDetailModel>.fromJson(
        response.data,
        (data) => SheetDetailModel.fromJson(data as Map<String, dynamic>),
      );

      if (!apiResponse.success) {
        throw Exception(apiResponse.message);
      }

      return apiResponse.data!;
    } on DioException {
      rethrow;
    }
  }

  @override
  Future<ApiResponse> selectOptimizationLayout({
    required String layoutId,
  }) async {
    try {
      final response = await apiClient.post(
        '/api/optimization-layouts/$layoutId/select',
      );

      return ApiResponse.fromJson(response.data, (data) => data);
    } on DioException {
      rethrow;
    }
  }

  @override
  Future<OptimizationLayoutModel> getOptimizationLayoutById({
    required String layoutId,
  }) async {
    try {
      final response = await apiClient.get(
        '/api/optimization-layouts/$layoutId',
      );
      final apiResponse = ApiResponse<OptimizationLayoutModel>.fromJson(
        response.data,
        (data) =>
            OptimizationLayoutModel.fromJson(data as Map<String, dynamic>),
      );
      if (!apiResponse.success) throw Exception(apiResponse.message);
      return apiResponse.data!;
    } on DioException {
      rethrow;
    }
  }

  @override
  Future<ApiResponse> cancelOptimizationLayout({
    required String layoutId,
  }) async {
    try {
      final response = await apiClient.post(
        '/api/optimization-layouts/$layoutId/cancel',
      );
      return ApiResponse.fromJson(response.data, (data) => data);
    } on DioException {
      rethrow;
    }
  }

  @override
  Future<ApiResponse> completeOptimizationProduction({
    required String layoutId,
  }) async {
    try {
      final response = await apiClient.post(
        '/api/optimization-layouts/$layoutId/complete-production',
      );
      return ApiResponse.fromJson(response.data, (data) => data);
    } on DioException {
      rethrow;
    }
  }

  @override
  Future<ApiResponse> classifyRemainingArea({
    required String remainingAreaId,
    required RemainingAreaStatus status,
  }) async {
    try {
      final response = await apiClient.patch(
        '/api/optimizations/remaining-areas/$remainingAreaId/classify',
        data: {'status': status.name.toUpperCase()},
      );
      return ApiResponse.fromJson(response.data, (data) => data);
    } on DioException {
      rethrow;
    }
  }
}
