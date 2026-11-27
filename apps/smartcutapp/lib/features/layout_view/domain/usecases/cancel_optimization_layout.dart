import 'package:board_cut/core/core.dart';
import 'package:fpdart/fpdart.dart';

import '../repositories/layout_view_repository.dart';

class CancelOptimizationLayout {
  const CancelOptimizationLayout(this.repository);

  final LayoutViewRepository repository;

  Future<Either<Failure, ApiResponse>> call({required String layoutId}) =>
      repository.cancelOptimizationLayout(layoutId: layoutId);
}
