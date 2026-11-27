import 'package:board_cut/core/core.dart';
import 'package:board_cut/features/materials/data/models/material_model.dart';
import 'package:fpdart/fpdart.dart';

import '../../domain/repositories/material_repository.dart';
import '../data_sources/remote/material_remote_data_source.dart';

class MaterialRepositoryImpl implements MaterialRepository {
  MaterialRepositoryImpl(this.remoteDataSource);

  final MaterialRemoteDataSource remoteDataSource;

  @override
  Future<Either<Failure, PaginatedResult<MaterialModel>>> getMaterials({
    required int page,
    required int limit,
    String? search,
  }) => safeCall(
    () =>
        remoteDataSource.getMaterials(page: page, limit: limit, search: search),
  );

  @override
  Future<Either<Failure, ApiResponse>> createMaterial({
    required Map<String, dynamic> data,
  }) => safeCall(() => remoteDataSource.createMaterial(data: data));

  @override
  Future<Either<Failure, ApiResponse>> updateMaterial({
    required String materialId,
    required Map<String, dynamic> data,
  }) => safeCall(
    () => remoteDataSource.updateMaterial(materialId: materialId, data: data),
  );

  @override
  Future<Either<Failure, ApiResponse>> deleteMaterial({
    required String materialId,
  }) => safeCall(() => remoteDataSource.deleteMaterial(materialId: materialId));
}
