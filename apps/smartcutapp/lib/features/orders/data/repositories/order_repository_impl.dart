import 'package:board_cut/core/core.dart';
import 'package:board_cut/features/orders/data/models/order_analytics_model.dart';
import 'package:board_cut/features/orders/data/models/order_model.dart';
import 'package:fpdart/fpdart.dart';

import '../../domain/repositories/order_repository.dart';
import '../data_sources/remote/order_remote_data_source.dart';

class OrderRepositoryImpl implements OrderRepository {
  final OrderRemoteDataSource remoteDataSource;

  OrderRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, PaginatedResult<OrderModel>>> getOrders({
    required int page,
    required int limit,
    String? search,
  }) async {
    return safeCall(
      () =>
          remoteDataSource.getOrders(page: page, limit: limit, search: search),
    );
  }

  @override
  Future<Either<Failure, OrderAnalyticsModel>> getOrderAnalytics() {
    return safeCall(() => remoteDataSource.getOrderAnalytics());
  }

  @override
  Future<Either<Failure, Map<String, dynamic>>> getOrderForUpdate(
    String orderId,
  ) => safeCall(() => remoteDataSource.getOrderForUpdate(orderId));

  @override
  Future<Either<Failure, ApiResponse>> updateOrder({
    required String orderId,
    required Map<String, dynamic> data,
  }) => safeCall(
    () => remoteDataSource.updateOrder(orderId: orderId, data: data),
  );

  @override
  Future<Either<Failure, ApiResponse>> createOrder({
    required Map<String, dynamic> data,
  }) => safeCall(() => remoteDataSource.createOrder(data: data));
}
