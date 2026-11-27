import 'package:board_cut/core/core.dart';
import 'package:board_cut/features/part_detail/data/model/part_detail_model.dart';
import 'package:dio/dio.dart';

import '../../models/part_material_option.dart';
import 'create_part_remote_data_source.dart';

class CreatePartRemoteDataSourceImpl implements CreatePartRemoteDataSource {
  CreatePartRemoteDataSourceImpl(this.apiClient);

  final ApiClient apiClient;

  @override
  Future<ApiResponse<PartDetailModel>> createPart({
    required Map<String, dynamic> data,
  }) async {
    try {
      final response = await apiClient.post(
        '/api/order-item-parts',
        data: data,
      );
      return ApiResponse<PartDetailModel>.fromJson(
        response.data,
        (value) => PartDetailModel.fromJson(value as Map<String, dynamic>),
      );
    } on DioException {
      rethrow;
    }
  }

  @override
  Future<ApiResponse<PartDetailModel>> updatePart({
    required String partId,
    required Map<String, dynamic> data,
  }) async {
    try {
      final response = await apiClient.put(
        '/api/order-item-parts/$partId',
        data: data,
      );
      return ApiResponse<PartDetailModel>.fromJson(
        response.data,
        (value) => PartDetailModel.fromJson(value as Map<String, dynamic>),
      );
    } on DioException {
      rethrow;
    }
  }

  @override
  Future<ApiResponse<List<PartMaterialOption>>> getMaterials() async {
    try {
      final response = await apiClient.get('/api/materials/dropdown');
      return ApiResponse<List<PartMaterialOption>>.fromJson(
        response.data,
        (value) => (value as List)
            .map(
              (item) =>
                  PartMaterialOption.fromJson(item as Map<String, dynamic>),
            )
            .toList(),
      );
    } on DioException {
      rethrow;
    }
  }
}
