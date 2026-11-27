import 'package:board_cut/core/core.dart';
import 'package:board_cut/features/order_detail/data/model/model.dart';
import 'package:fpdart/fpdart.dart';

import '../../domain/repositories/order_detail_repository.dart';
import '../data_sources/remote/order_detail_remote_data_source.dart';
import '../model/order_item_model.dart';

class OrderDetailRepositoryImpl implements OrderDetailRepository {
  final OrderDetailRemoteDataSource remoteDataSource;

  OrderDetailRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, OrderDetailModel>> getOrderById(String id) {
    return safeCall(() => remoteDataSource.getOrderById(id));
  }

  @override
  Future<Either<Failure, PaginatedResult<OrderItemModel>>> getItemsByOrderId({
    required int page,
    required int limit,
    required String orderId,
  }) async {
    return safeCall(
      () => remoteDataSource.getItemsByOrderId(
        page: page,
        limit: limit,
        orderId: orderId,
      ),
    );
  }

  @override
  Future<Either<Failure, ApiResponse>> generatePiecesForOrder(String orderId) {
    return safeCall(() => remoteDataSource.generatePiecesForOrder(orderId));
  }

  @override
  Future<Either<Failure, ApiResponse<dynamic>>> uploadItemsByOrderId({
    required data,
  }) {
    return safeCall(() => remoteDataSource.uploadItemsByOrderId(data: data));
  }
}
