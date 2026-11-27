import 'package:board_cut/core/core.dart';
import 'package:board_cut/features/customers/data/models/customer_analytics_model.dart';
import 'package:fpdart/fpdart.dart';

import '../../data/models/customer_model.dart';

abstract class CustomerRepository {
  Future<Either<Failure, PaginatedResult<CustomerModel>>> getCustomers({
    required int page,
    required int limit,
  });

  Future<Either<Failure, CustomerModel>> getCustomerById({
    required String customerId,
  });

  Future<Either<Failure, CustomerAnalyticsModel>> getCustomerAnalytics();

  Future<Either<Failure, ApiResponse>> createCustomer({
    required Map<String, dynamic> data,
  });

  Future<Either<Failure, ApiResponse>> updateCustomer({
    required String customerId,
    required Map<String, dynamic> data,
  });
}
