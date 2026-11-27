import 'package:board_cut/core/core.dart';
import 'package:board_cut/features/item_detail/data/model/order_item_details_model.dart';
import 'package:fpdart/fpdart.dart';

import '../repositories/create_item_repository.dart';

class CreateItem {
  const CreateItem(this.repository);

  final CreateItemRepository repository;

  Future<Either<Failure, ApiResponse<OrderItemDetailsModel>>> call({
    required Map<String, dynamic> data,
  }) => repository.createItem(data: data);
}
