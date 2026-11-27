import 'package:board_cut/core/core.dart';
import 'package:board_cut/features/materials/data/models/material_model.dart';
import 'package:fpdart/fpdart.dart';

abstract class MaterialRepository {
  Future<Either<Failure, PaginatedResult<MaterialModel>>> getMaterials({
    required int page,
    required int limit,
    String? search,
  });

  Future<Either<Failure, ApiResponse>> createMaterial({
    required Map<String, dynamic> data,
  });

  Future<Either<Failure, ApiResponse>> updateMaterial({
    required String materialId,
    required Map<String, dynamic> data,
  });

  Future<Either<Failure, ApiResponse>> deleteMaterial({
    required String materialId,
  });
}
