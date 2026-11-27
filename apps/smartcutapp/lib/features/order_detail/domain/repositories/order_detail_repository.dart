import 'package:board_cut/core/core.dart';
import 'package:board_cut/features/order_detail/data/model/model.dart';
import 'package:board_cut/features/order_detail/data/model/order_item_model.dart';
import 'package:fpdart/fpdart.dart';

abstract class OrderDetailRepository {
  Future<Either<Failure, OrderDetailModel>> getOrderById(String id);

  Future<Either<Failure, PaginatedResult<OrderItemModel>>> getItemsByOrderId({
    required int page,
    required int limit,
    required String orderId,
  });

  Future<Either<Failure, ApiResponse>> generatePiecesForOrder(String orderId);

  Future<Either<Failure, ApiResponse>> uploadItemsByOrderId({
    required dynamic data,
  });
}
