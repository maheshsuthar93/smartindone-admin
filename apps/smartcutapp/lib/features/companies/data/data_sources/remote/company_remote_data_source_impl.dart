import 'package:board_cut/core/core.dart';
import 'package:board_cut/shared/data/model/company_model.dart';
import 'package:dio/dio.dart';

import 'company_remote_data_source.dart';

class CompanyRemoteDataSourceImpl implements CompanyRemoteDataSource {
  CompanyRemoteDataSourceImpl(this.apiClient);

  final ApiClient apiClient;

  @override
  Future<List<CompanyModel>> getCompanies() async {
    try {
      final response = await apiClient.get('/api/companies');
      final result = ApiResponse<List<CompanyModel>>.fromJson(
        response.data,
        (data) => (data as List)
            .map((item) => CompanyModel.fromJson(item as Map<String, dynamic>))
            .toList(),
      );
      if (!result.success) throw Exception(result.message);
      return result.data ?? [];
    } on DioException {
      rethrow;
    }
  }

  @override
  Future<ApiResponse> createCompany({
    required Map<String, dynamic> data,
  }) async {
    try {
      final response = await apiClient.post('/api/companies', data: data);
      return ApiResponse.fromJson(response.data, (data) => data);
    } on DioException {
      rethrow;
    }
  }

  @override
  Future<ApiResponse> updateCompany({
    required String companyId,
    required Map<String, dynamic> data,
  }) async {
    try {
      final response = await apiClient.put(
        '/api/companies/$companyId',
        data: data,
      );
      return ApiResponse.fromJson(response.data, (data) => data);
    } on DioException {
      rethrow;
    }
  }
}
