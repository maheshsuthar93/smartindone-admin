import 'package:board_cut/core/core.dart';
import 'package:board_cut/features/customers/data/models/customer_analytics_model.dart';
import 'package:fpdart/fpdart.dart';

import '../repositories/customer_repository.dart';

class GetCustomerAnalytics {
  final CustomerRepository repository;

  GetCustomerAnalytics(this.repository);

  Future<Either<Failure, CustomerAnalyticsModel>> call() async {
    return repository.getCustomerAnalytics();
  }
}
