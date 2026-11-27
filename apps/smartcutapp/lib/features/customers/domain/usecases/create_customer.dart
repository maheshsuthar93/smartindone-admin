import 'package:board_cut/core/core.dart';
import 'package:fpdart/fpdart.dart';

import '../repositories/customer_repository.dart';

class CreateCustomer {
  const CreateCustomer(this.repository);

  final CustomerRepository repository;

  Future<Either<Failure, ApiResponse>> call({
    required Map<String, dynamic> data,
  }) => repository.createCustomer(data: data);
}
