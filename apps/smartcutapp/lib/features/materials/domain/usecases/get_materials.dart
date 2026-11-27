import 'package:board_cut/core/core.dart';
import 'package:board_cut/features/materials/data/models/material_model.dart';
import 'package:fpdart/fpdart.dart';

import '../repositories/material_repository.dart';

class GetMaterials {
  GetMaterials(this.repository);

  final MaterialRepository repository;

  Future<Either<Failure, PaginatedResult<MaterialModel>>> call({
    required int page,
    required int limit,
    String? search,
  }) => repository.getMaterials(page: page, limit: limit, search: search);
}
