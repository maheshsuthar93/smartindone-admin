import 'package:board_cut/core/core.dart';
import 'package:fpdart/fpdart.dart';

import '../../data/model/optimization_material_group_model.dart';
import '../repositories/layout_view_repository.dart';

class GetPieceProcessTypes {
  const GetPieceProcessTypes(this.repository);

  final LayoutViewRepository repository;

  Future<Either<Failure, List<OptimizationProcessType>>> call() {
    return repository.getPieceProcessTypes();
  }
}
