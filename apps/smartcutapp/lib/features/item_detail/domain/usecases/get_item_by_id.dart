import 'package:board_cut/core/core.dart';
import 'package:board_cut/features/item_detail/data/model/order_item_details_model.dart';
import 'package:fpdart/fpdart.dart';

import '../repositories/item_detail_repository.dart';

class GetItemById {
  final ItemDetailRepository repository;

  GetItemById(this.repository);

  Future<Either<Failure, OrderItemDetailsModel>> call({
    required String id,
  }) async {
    return repository.getItemById(id);
  }
}
