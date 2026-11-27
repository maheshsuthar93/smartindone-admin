import 'package:board_cut/core/core.dart';
import 'package:fpdart/fpdart.dart';

import '../../data/model/optimization_material_group_model.dart';
import '../repositories/layout_view_repository.dart';

class GetOptimizationLayoutById {
  const GetOptimizationLayoutById(this.repository);

  final LayoutViewRepository repository;

  Future<Either<Failure, OptimizationLayoutModel>> call({
    required String layoutId,
  }) => repository.getOptimizationLayoutById(layoutId: layoutId);
}
