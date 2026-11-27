import 'package:board_cut/core/core.dart';
import 'package:fpdart/fpdart.dart';

import '../repositories/material_repository.dart';

class CreateMaterial {
  CreateMaterial(this.repository);

  final MaterialRepository repository;

  Future<Either<Failure, ApiResponse>> call({
    required Map<String, dynamic> data,
  }) => repository.createMaterial(data: data);
}
