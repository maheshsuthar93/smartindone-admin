import 'package:board_cut/core/core.dart';
import 'package:board_cut/features/customers/data/models/customer_analytics_model.dart';
import 'package:fpdart/fpdart.dart';

import '../../domain/repositories/customer_repository.dart';
import '../data_sources/remote/customer_remote_data_source.dart';
import '../models/customer_model.dart';

class CustomerRepositoryImpl implements CustomerRepository {
  final CustomerRemoteDataSource remoteDataSource;

  CustomerRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, PaginatedResult<CustomerModel>>> getCustomers({
    required int page,
    required int limit,
  }) async {
    return safeCall(
      () => remoteDataSource.getCustomers(page: page, limit: limit),
    );
  }

  @override
  Future<Either<Failure, CustomerModel>> getCustomerById({
    required String customerId,
  }) =>
      safeCall(() => remoteDataSource.getCustomerById(customerId: customerId));

  @override
  Future<Either<Failure, CustomerAnalyticsModel>> getCustomerAnalytics() {
    return safeCall(() => remoteDataSource.getCustomerAnalytics());
  }

  @override
  Future<Either<Failure, ApiResponse>> createCustomer({
    required Map<String, dynamic> data,
  }) => safeCall(() => remoteDataSource.createCustomer(data: data));

  @override
  Future<Either<Failure, ApiResponse>> updateCustomer({
    required String customerId,
    required Map<String, dynamic> data,
  }) => safeCall(
    () => remoteDataSource.updateCustomer(customerId: customerId, data: data),
  );
}
