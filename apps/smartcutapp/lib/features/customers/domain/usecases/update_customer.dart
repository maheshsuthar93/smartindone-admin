import 'package:board_cut/core/core.dart';
import 'package:fpdart/fpdart.dart';

import '../repositories/customer_repository.dart';

class UpdateCustomer {
  const UpdateCustomer(this.repository);

  final CustomerRepository repository;

  Future<Either<Failure, ApiResponse>> call({
    required String customerId,
    required Map<String, dynamic> data,
  }) => repository.updateCustomer(customerId: customerId, data: data);
}
