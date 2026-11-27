import 'package:board_cut/core/core.dart';
import 'package:fpdart/fpdart.dart';

import '../../data/model/optimization_material_group_model.dart';
import '../repositories/layout_view_repository.dart';

class GetMaterialGroupById {
  final LayoutViewRepository repository;

  GetMaterialGroupById(this.repository);

  Future<Either<Failure, OptimizationMaterialGroupModel>> call({
    required String materialGroupId,
  }) async {
    return repository.getMaterialGroupById(materialGroupId: materialGroupId);
  }
}
