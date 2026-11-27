import 'package:board_cut/core/core.dart';
import 'package:board_cut/features/item_detail/data/model/order_item_details_model.dart';

abstract class CreateItemRemoteDataSource {
  Future<ApiResponse<OrderItemDetailsModel>> createItem({
    required Map<String, dynamic> data,
  });

  Future<ApiResponse<OrderItemDetailsModel>> updateItem({
    required String itemId,
    required Map<String, dynamic> data,
  });
}
