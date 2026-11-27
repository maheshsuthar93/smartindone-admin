import 'package:board_cut/core/core.dart';
import 'package:fpdart/fpdart.dart';

import '../../data/models/part_material_option.dart';
import '../repositories/create_part_repository.dart';

class GetPartMaterials {
  const GetPartMaterials(this.repository);

  final CreatePartRepository repository;

  Future<Either<Failure, ApiResponse<List<PartMaterialOption>>>> call() =>
      repository.getMaterials();
}
