import 'package:board_cut/core/core.dart';
import 'package:fpdart/fpdart.dart';

import '../repositories/material_repository.dart';

class DeleteMaterial {
  DeleteMaterial(this.repository);

  final MaterialRepository repository;

  Future<Either<Failure, ApiResponse>> call({required String materialId}) =>
      repository.deleteMaterial(materialId: materialId);
}
