import 'package:board_cut/core/core.dart';
import 'package:fpdart/fpdart.dart';

import '../repositories/order_repository.dart';

class GetOrderForUpdate {
  const GetOrderForUpdate(this.repository);

  final OrderRepository repository;

  Future<Either<Failure, Map<String, dynamic>>> call(String orderId) =>
      repository.getOrderForUpdate(orderId);
}
