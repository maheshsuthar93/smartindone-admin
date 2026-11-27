import 'package:board_cut/core/core.dart';
import 'package:fpdart/fpdart.dart';

import '../repositories/layout_view_repository.dart';

class CompleteOptimizationProduction {
  const CompleteOptimizationProduction(this.repository);

  final LayoutViewRepository repository;

  Future<Either<Failure, ApiResponse>> call({required String layoutId}) =>
      repository.completeOptimizationProduction(layoutId: layoutId);
}
