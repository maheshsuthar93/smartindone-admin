import 'package:board_cut/core/core.dart';
import 'package:fpdart/fpdart.dart';

import '../../data/model/optimization_model.dart';
import '../repositories/optimizations_repository.dart';

class GetOptimizationsByOrderId {
  final OptimizationsRepository repository;

  GetOptimizationsByOrderId(this.repository);

  Future<Either<Failure, List<OptimizationModel>>> call({
    required String orderId,
  }) async {
    return repository.getOptimizationsByOrderId(orderId: orderId);
  }
}
