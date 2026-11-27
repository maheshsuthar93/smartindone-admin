import 'package:board_cut/core/core.dart';
import 'package:board_cut/features/item_detail/data/model/order_item_details_model.dart';
import 'package:fpdart/fpdart.dart';

import '../repositories/create_item_repository.dart';

class UpdateItem {
  const UpdateItem(this.repository);

  final CreateItemRepository repository;

  Future<Either<Failure, ApiResponse<OrderItemDetailsModel>>> call({
    required String itemId,
    required Map<String, dynamic> data,
  }) => repository.updateItem(itemId: itemId, data: data);
}
