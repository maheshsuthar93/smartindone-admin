import 'package:board_cut/core/core.dart';
import 'package:board_cut/features/customers/data/models/customer_analytics_model.dart';
import 'package:dio/dio.dart';

import '../../models/customer_model.dart';
import 'customer_remote_data_source.dart';

class CustomerRemoteDataSourceImpl implements CustomerRemoteDataSource {
  CustomerRemoteDataSourceImpl(this.apiClient);

  final ApiClient apiClient;

  @override
  Future<PaginatedResult<CustomerModel>> getCustomers({
    required int page,
    required int limit,
  }) async {
    try {
      final response = await apiClient.get(
        '/api/customers',
        queryParameters: {"page": page, "limit": limit},
      );

      final apiResponse = ApiResponse<List<CustomerModel>>.fromJson(
        response.data,
        (data) => (data as List).map((e) => CustomerModel.fromJson(e)).toList(),
      );

      if (!apiResponse.success) {
        throw Exception(apiResponse.message);
      }

      final meta = apiResponse.pagination!;

      return PaginatedResult<CustomerModel>(
        items: apiResponse.data ?? [],
        page: meta.page,
        total: meta.total,
        totalPages: meta.totalPages,
      );
    } on DioException {
      rethrow;
    }
  }

  @override
  Future<CustomerModel> getCustomerById({required String customerId}) async {
    try {
      final response = await apiClient.get('/api/customers/$customerId');
      final apiResponse = ApiResponse<CustomerModel>.fromJson(
        response.data,
        (data) => CustomerModel.fromJson(data as Map<String, dynamic>),
      );
      if (!apiResponse.success) throw Exception(apiResponse.message);
      return apiResponse.data!;
    } on DioException {
      rethrow;
    }
  }

  @override
  Future<CustomerAnalyticsModel> getCustomerAnalytics() async {
    try {
      final response = await apiClient.get('/api/customers/analytics');

      final apiResponse = ApiResponse<CustomerAnalyticsModel>.fromJson(
        response.data,
        (data) => CustomerAnalyticsModel.fromJson(data as Map<String, dynamic>),
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
  Future<ApiResponse> createCustomer({
    required Map<String, dynamic> data,
  }) async {
    try {
      final response = await apiClient.post('/api/customers', data: data);
      return ApiResponse.fromJson(response.data, (data) => data);
    } on DioException {
      rethrow;
    }
  }

  @override
  Future<ApiResponse> updateCustomer({
    required String customerId,
    required Map<String, dynamic> data,
  }) async {
    try {
      final response = await apiClient.put(
        '/api/customers/$customerId',
        data: data,
      );
      return ApiResponse.fromJson(response.data, (data) => data);
    } on DioException {
      rethrow;
    }
  }
}
