import 'package:board_cut/core/core.dart';
import 'package:board_cut/shared/data/model/company_model.dart';
import 'package:fpdart/fpdart.dart';

import '../repositories/company_repository.dart';

class GetCompanies {
  const GetCompanies(this.repository);
  final CompanyRepository repository;

  Future<Either<Failure, List<CompanyModel>>> call() =>
      repository.getCompanies();
}
