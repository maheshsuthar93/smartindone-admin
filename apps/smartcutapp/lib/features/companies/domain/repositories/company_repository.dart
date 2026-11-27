import 'package:board_cut/core/core.dart';
import 'package:board_cut/shared/data/model/company_model.dart';
import 'package:fpdart/fpdart.dart';

abstract class CompanyRepository {
  Future<Either<Failure, List<CompanyModel>>> getCompanies();
  Future<Either<Failure, ApiResponse>> createCompany({
    required Map<String, dynamic> data,
  });
  Future<Either<Failure, ApiResponse>> updateCompany({
    required String companyId,
    required Map<String, dynamic> data,
  });
}
