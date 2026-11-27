import 'package:board_cut/core/core.dart';
import 'package:fpdart/fpdart.dart';

import '../../domain/repositories/create_part_repository.dart';
import '../data_sources/remote/create_part_remote_data_source.dart';
import '../models/part_material_option.dart';
import 'package:board_cut/features/part_detail/data/model/part_detail_model.dart';

class CreatePartRepositoryImpl implements CreatePartRepository {
  CreatePartRepositoryImpl(this.remoteDataSource);

  final CreatePartRemoteDataSource remoteDataSource;

  @override
  Future<Either<Failure, ApiResponse<PartDetailModel>>> createPart({
    required Map<String, dynamic> data,
  }) => safeCall(() => remoteDataSource.createPart(data: data));

  @override
  Future<Either<Failure, ApiResponse<PartDetailModel>>> updatePart({
    required String partId,
    required Map<String, dynamic> data,
  }) => safeCall(() => remoteDataSource.updatePart(partId: partId, data: data));

  @override
  Future<Either<Failure, ApiResponse<List<PartMaterialOption>>>>
  getMaterials() => safeCall(remoteDataSource.getMaterials);
}
