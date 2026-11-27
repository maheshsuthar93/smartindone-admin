import 'package:board_cut/core/core.dart';
import 'package:fpdart/fpdart.dart';

import '../repositories/order_detail_repository.dart';

class GeneratePiecesForOrder {
  final OrderDetailRepository repository;

  GeneratePiecesForOrder(this.repository);

  Future<Either<Failure, ApiResponse>> call({required String orderId}) async {
    return repository.generatePiecesForOrder(orderId);
  }
}
