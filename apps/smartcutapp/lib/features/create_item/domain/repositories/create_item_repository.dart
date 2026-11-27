import 'package:board_cut/core/core.dart';
import 'package:board_cut/features/item_detail/data/model/order_item_details_model.dart';
import 'package:fpdart/fpdart.dart';

abstract class CreateItemRepository {
  Future<Either<Failure, ApiResponse<OrderItemDetailsModel>>> createItem({
    required Map<String, dynamic> data,
  });

  Future<Either<Failure, ApiResponse<OrderItemDetailsModel>>> updateItem({
    required String itemId,
    required Map<String, dynamic> data,
  });
}
