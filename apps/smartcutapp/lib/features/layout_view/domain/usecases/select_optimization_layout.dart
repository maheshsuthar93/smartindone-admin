import 'package:board_cut/core/core.dart';
import 'package:fpdart/fpdart.dart';

import '../repositories/layout_view_repository.dart';

class SelectOptimizationLayout {
  final LayoutViewRepository repository;

  SelectOptimizationLayout(this.repository);

  Future<Either<Failure, ApiResponse>> call({required String layoutId}) async {
    return repository.selectOptimizationLayout(layoutId: layoutId);
  }
}
