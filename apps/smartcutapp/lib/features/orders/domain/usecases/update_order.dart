import 'package:board_cut/core/core.dart';
import 'package:fpdart/fpdart.dart';

import '../repositories/order_repository.dart';

class UpdateOrder {
  const UpdateOrder(this.repository);

  final OrderRepository repository;

  Future<Either<Failure, ApiResponse>> call({
    required String orderId,
    required Map<String, dynamic> data,
  }) => repository.updateOrder(orderId: orderId, data: data);
}
