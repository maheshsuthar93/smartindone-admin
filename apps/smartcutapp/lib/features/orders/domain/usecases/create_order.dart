import 'package:board_cut/core/core.dart';
import 'package:fpdart/fpdart.dart';

import '../repositories/order_repository.dart';

class CreateOrder {
  const CreateOrder(this.repository);

  final OrderRepository repository;

  Future<Either<Failure, ApiResponse>> call({
    required Map<String, dynamic> data,
  }) => repository.createOrder(data: data);
}
