import 'package:board_cut/core/core.dart';
import 'package:board_cut/features/order_detail/data/model/model.dart';
import 'package:fpdart/fpdart.dart';

import '../repositories/order_detail_repository.dart';

class GetOrderById {
  final OrderDetailRepository repository;

  GetOrderById(this.repository);

  Future<Either<Failure, OrderDetailModel>> call({required String id}) async {
    return repository.getOrderById(id);
  }
}
