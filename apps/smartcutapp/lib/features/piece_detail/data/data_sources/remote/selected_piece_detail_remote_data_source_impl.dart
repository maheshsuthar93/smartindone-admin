import 'package:board_cut/core/core.dart';
import 'package:dio/dio.dart';

import '../../model/selected_piece_model.dart';
import '../../model/update_status_response_model.dart';
import 'selected_piece_detail_remote_data_source.dart';

class SelectedPieceDetailRemoteDataSourceImpl
    implements SelectedPieceDetailRemoteDataSource {
  SelectedPieceDetailRemoteDataSourceImpl(this.apiClient);

  final ApiClient apiClient;

  @override
  Future<SelectedPieceModel> getPieceById({required String pieceId}) async {
    try {
      final response = await apiClient.get('/api/order-part-pieces/$pieceId');

      final apiResponse = ApiResponse<SelectedPieceModel>.fromJson(
        response.data,
        (data) => SelectedPieceModel.fromJson(data as Map<String, dynamic>),
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
  Future<SelectedPieceModel> getPieceByCode({required String pieceCode}) async {
    try {
      final response = await apiClient.get(
        '/api/order-part-pieces/by-code/${Uri.encodeComponent(pieceCode)}',
      );

      final apiResponse = ApiResponse<SelectedPieceModel>.fromJson(
        response.data,
        (data) => SelectedPieceModel.fromJson(data as Map<String, dynamic>),
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
  Future<ApiResponse<UpdateStatusResponseModel>> updatePieceProcessStatus({
    required Map<String, dynamic> data,
  }) async {
    try {
      final response = await apiClient.post(
        '/api/order-part-pieces/update-process-status/${data['pieceId']}',
        data: data,
      );

      final apiResponse = ApiResponse<UpdateStatusResponseModel>.fromJson(
        response.data,
        (data) =>
            UpdateStatusResponseModel.fromJson(data as Map<String, dynamic>),
      );

      if (!apiResponse.success) {
        throw Exception(apiResponse.message);
      }

      return apiResponse;
    } on DioException {
      rethrow;
    }
  }
}
