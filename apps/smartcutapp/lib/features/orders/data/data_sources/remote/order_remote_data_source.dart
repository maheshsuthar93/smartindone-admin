import 'package:board_cut/core/core.dart';
import 'package:board_cut/features/orders/data/models/order_model.dart';

import '../../models/order_analytics_model.dart';

abstract class OrderRemoteDataSource {
  Future<PaginatedResult<OrderModel>> getOrders({
    required int page,
    required int limit,
    String? search,
  });

  Future<OrderAnalyticsModel> getOrderAnalytics();

  Future<Map<String, dynamic>> getOrderForUpdate(String orderId);

  Future<ApiResponse> updateOrder({
    required String orderId,
    required Map<String, dynamic> data,
  });

  Future<ApiResponse> createOrder({required Map<String, dynamic> data});
}
