import 'package:board_cut/core/core.dart';
import 'package:fpdart/fpdart.dart';

import '../../data/model/order_item_model.dart';
import '../repositories/order_detail_repository.dart';

class GetItemsByOrderId {
  final OrderDetailRepository repository;

  GetItemsByOrderId(this.repository);

  Future<Either<Failure, PaginatedResult<OrderItemModel>>> call({
    required String orderId,
    required int page,
    required int limit,
  }) async {
    return repository.getItemsByOrderId(
      limit: limit,
      page: page,
      orderId: orderId,
    );
  }
}
