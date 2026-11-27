import 'package:board_cut/core/core.dart';
import 'package:board_cut/features/hardwares/data/models/hardware_model.dart';
import 'package:fpdart/fpdart.dart';

import '../../domain/repositories/hardware_repository.dart';
import '../data_sources/remote/hardware_remote_data_source.dart';

class HardwareRepositoryImpl implements HardwareRepository {
  HardwareRepositoryImpl(this.remoteDataSource);

  final HardwareRemoteDataSource remoteDataSource;

  @override
  Future<Either<Failure, PaginatedResult<HardwareModel>>> getHardwares({
    required int page,
    required int limit,
    String? search,
  }) => safeCall(
    () =>
        remoteDataSource.getHardwares(page: page, limit: limit, search: search),
  );

  @override
  Future<Either<Failure, ApiResponse>> createHardware({
    required Map<String, dynamic> data,
  }) => safeCall(() => remoteDataSource.createHardware(data: data));

  @override
  Future<Either<Failure, ApiResponse>> updateHardware({
    required String hardwareId,
    required Map<String, dynamic> data,
  }) => safeCall(
    () => remoteDataSource.updateHardware(hardwareId: hardwareId, data: data),
  );

  @override
  Future<Either<Failure, ApiResponse>> deactivateHardware({
    required String hardwareId,
  }) => safeCall(
    () => remoteDataSource.deactivateHardware(hardwareId: hardwareId),
  );
}
