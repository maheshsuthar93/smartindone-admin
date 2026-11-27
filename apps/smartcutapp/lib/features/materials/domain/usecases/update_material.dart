import 'package:board_cut/core/core.dart';
import 'package:fpdart/fpdart.dart';

import '../repositories/material_repository.dart';

class UpdateMaterial {
  UpdateMaterial(this.repository);

  final MaterialRepository repository;

  Future<Either<Failure, ApiResponse>> call({
    required String materialId,
    required Map<String, dynamic> data,
  }) => repository.updateMaterial(materialId: materialId, data: data);
}
