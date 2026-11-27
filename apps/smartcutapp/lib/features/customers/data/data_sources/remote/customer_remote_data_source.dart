import 'package:board_cut/core/core.dart';

import '../../models/customer_analytics_model.dart';
import '../../models/customer_model.dart';

abstract class CustomerRemoteDataSource {
  Future<PaginatedResult<CustomerModel>> getCustomers({
    required int page,
    required int limit,
  });

  Future<CustomerModel> getCustomerById({required String customerId});

  Future<CustomerAnalyticsModel> getCustomerAnalytics();

  Future<ApiResponse> createCustomer({required Map<String, dynamic> data});

  Future<ApiResponse> updateCustomer({
    required String customerId,
    required Map<String, dynamic> data,
  });
}
