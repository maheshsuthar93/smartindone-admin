import 'package:board_cut/core/core.dart';
import 'package:fpdart/fpdart.dart';

import '../repositories/company_repository.dart';

class UpdateCompany {
  const UpdateCompany(this.repository);
  final CompanyRepository repository;

  Future<Either<Failure, ApiResponse>> call({
    required String companyId,
    required Map<String, dynamic> data,
  }) => repository.updateCompany(companyId: companyId, data: data);
}
