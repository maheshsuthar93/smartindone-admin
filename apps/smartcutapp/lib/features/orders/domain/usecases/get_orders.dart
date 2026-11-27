import 'package:board_cut/features/orders/data/models/order_model.dart';
import 'package:board_cut/features/orders/domain/repositories/order_repository.dart';
import 'package:fpdart/fpdart.dart';
import 'package:board_cut/core/core.dart';

class GetOrders {
  final OrderRepository repository;

  GetOrders(this.repository);

  Future<Either<Failure, PaginatedResult<OrderModel>>> call({
    required int page,
    required int limit,
    String? search,
  }) async {
    return repository.getOrders(page: page, limit: limit, search: search);
  }
}
