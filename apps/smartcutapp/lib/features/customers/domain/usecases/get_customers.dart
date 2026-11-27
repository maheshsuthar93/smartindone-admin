import 'package:board_cut/core/core.dart';
import 'package:fpdart/fpdart.dart';

import '../../data/models/customer_model.dart';
import '../repositories/customer_repository.dart';

class GetCustomers {
  final CustomerRepository repository;

  GetCustomers(this.repository);

  Future<Either<Failure, PaginatedResult<CustomerModel>>> call({
    required int page,
    required int limit,
  }) async {
    return repository.getCustomers(page: page, limit: limit);
  }
}
