import 'package:board_cut/core/core.dart';
import 'package:fpdart/fpdart.dart';

import '../../data/models/order_analytics_model.dart';
import '../../data/models/order_model.dart';

abstract class OrderRepository {
  Future<Either<Failure, PaginatedResult<OrderModel>>> getOrders({
    required int page,
    required int limit,
    String? search,
  });

  Future<Either<Failure, OrderAnalyticsModel>> getOrderAnalytics();

  Future<Either<Failure, Map<String, dynamic>>> getOrderForUpdate(
    String orderId,
  );

  Future<Either<Failure, ApiResponse>> updateOrder({
    required String orderId,
    required Map<String, dynamic> data,
  });

  Future<Either<Failure, ApiResponse>> createOrder({
    required Map<String, dynamic> data,
  });
}
