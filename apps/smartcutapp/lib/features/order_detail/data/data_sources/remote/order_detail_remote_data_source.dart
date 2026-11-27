import 'package:board_cut/core/core.dart';
import 'package:board_cut/features/order_detail/data/model/order_item_model.dart';

import '../../model/order_detail_model.dart';

abstract class OrderDetailRemoteDataSource {
  Future<OrderDetailModel> getOrderById(String id);

  Future<PaginatedResult<OrderItemModel>> getItemsByOrderId({
    required int page,
    required int limit,
    required String orderId,
  });

  Future<ApiResponse> generatePiecesForOrder(String orderId);

  Future<ApiResponse> uploadItemsByOrderId({required dynamic data});
}
