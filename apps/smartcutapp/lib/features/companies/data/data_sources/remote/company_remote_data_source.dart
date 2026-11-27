import 'package:board_cut/core/core.dart';
import 'package:board_cut/shared/data/model/company_model.dart';

abstract class CompanyRemoteDataSource {
  Future<List<CompanyModel>> getCompanies();
  Future<ApiResponse> createCompany({required Map<String, dynamic> data});
  Future<ApiResponse> updateCompany({
    required String companyId,
    required Map<String, dynamic> data,
  });
}
