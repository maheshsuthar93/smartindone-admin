import 'package:board_cut/core/core.dart';
import 'package:board_cut/features/materials/data/models/material_model.dart';

abstract class MaterialRemoteDataSource {
  Future<PaginatedResult<MaterialModel>> getMaterials({
    required int page,
    required int limit,
    String? search,
  });

  Future<ApiResponse> createMaterial({required Map<String, dynamic> data});

  Future<ApiResponse> updateMaterial({
    required String materialId,
    required Map<String, dynamic> data,
  });

  Future<ApiResponse> deleteMaterial({required String materialId});
}
