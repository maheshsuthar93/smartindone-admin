import 'package:board_cut/core/core.dart';
import 'package:board_cut/features/create_shipment/data/models/create_shipment_order_model.dart';
import 'package:board_cut/features/create_shipment/data/models/create_shipment_project_model.dart';
import 'package:board_cut/features/create_shipment/data/models/shipment_driver_model.dart';
import 'package:dio/dio.dart';

import 'create_shipment_remote_data_source.dart';

class CreateShipmentRemoteDataSourceImpl
    implements CreateShipmentRemoteDataSource {
  CreateShipmentRemoteDataSourceImpl(this.apiClient);

  final ApiClient apiClient;

  @override
  Future<ApiResponse> createShipment({
    required Map<String, dynamic> data,
  }) async {
    try {
      final response = await apiClient.post('/api/shipments', data: data);

      return ApiResponse.fromJson(response.data, (data) => data);
    } on DioException {
      rethrow;
    }
  }

  @override
  Future<ApiResponse> updateShipment({
    required String shipmentId,
    required Map<String, dynamic> data,
  }) async {
    try {
      final response = await apiClient.put(
        '/api/shipments/$shipmentId',
        data: data,
      );
      return ApiResponse.fromJson(response.data, (data) => data);
    } on DioException {
      rethrow;
    }
  }

  @override
  Future<List<CreateShipmentProjectModel>> getProjects({
    required String companyId,
  }) async {
    try {
      final response = await apiClient.get('/api/projects/dropdown/$companyId');
      final apiResponse =
          ApiResponse<List<CreateShipmentProjectModel>>.fromJson(
            response.data,
            (data) => (data as List)
                .map(
                  (json) => CreateShipmentProjectModel.fromJson(
                    json as Map<String, dynamic>,
                  ),
                )
                .toList(),
          );

      if (!apiResponse.success) {
        throw Exception(apiResponse.message);
      }

      return apiResponse.data ?? [];
    } on DioException {
      rethrow;
    }
  }

  @override
  Future<List<CreateShipmentOrderModel>> getOrdersByProjectId({
    required String projectId,
  }) async {
    try {
      final response = await apiClient.get('/api/orders/dropdown/$projectId');

      final List<dynamic> data = response.data['data'] as List<dynamic>;
      return data
          .map((json) => CreateShipmentOrderModel.fromJson(json))
          .toList();
    } on DioException {
      rethrow;
    }
  }

  @override
  Future<List<ShipmentDriverModel>> getDriversByCompanyId({
    required String companyId,
  }) async {
    try {
      final response = await apiClient.get('/api/drivers');

      final List<dynamic> data = response.data['data'] as List<dynamic>;
      return data.map((json) => ShipmentDriverModel.fromJson(json)).toList();
    } on DioException {
      rethrow;
    }
  }
}
