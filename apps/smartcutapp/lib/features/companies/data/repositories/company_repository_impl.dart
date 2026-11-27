import 'package:board_cut/core/core.dart';
import 'package:board_cut/shared/data/model/company_model.dart';
import 'package:fpdart/fpdart.dart';

import '../../domain/repositories/company_repository.dart';
import '../data_sources/remote/company_remote_data_source.dart';

class CompanyRepositoryImpl implements CompanyRepository {
  CompanyRepositoryImpl(this.remoteDataSource);
  final CompanyRemoteDataSource remoteDataSource;

  @override
  Future<Either<Failure, List<CompanyModel>>> getCompanies() =>
      safeCall(remoteDataSource.getCompanies);

  @override
  Future<Either<Failure, ApiResponse>> createCompany({
    required Map<String, dynamic> data,
  }) => safeCall(() => remoteDataSource.createCompany(data: data));

  @override
  Future<Either<Failure, ApiResponse>> updateCompany({
    required String companyId,
    required Map<String, dynamic> data,
  }) => safeCall(
    () => remoteDataSource.updateCompany(companyId: companyId, data: data),
  );
}
