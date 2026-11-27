import 'package:board_cut/core/core.dart';
import 'package:fpdart/fpdart.dart';

import '../repositories/company_repository.dart';

class CreateCompany {
  const CreateCompany(this.repository);
  final CompanyRepository repository;

  Future<Either<Failure, ApiResponse>> call({
    required Map<String, dynamic> data,
  }) => repository.createCompany(data: data);
}
