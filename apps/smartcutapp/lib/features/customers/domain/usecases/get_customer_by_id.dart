import 'package:board_cut/core/core.dart';
import 'package:fpdart/fpdart.dart';

import '../../data/models/customer_model.dart';
import '../repositories/customer_repository.dart';

class GetCustomerById {
  const GetCustomerById(this.repository);

  final CustomerRepository repository;

  Future<Either<Failure, CustomerModel>> call({required String customerId}) =>
      repository.getCustomerById(customerId: customerId);
}
