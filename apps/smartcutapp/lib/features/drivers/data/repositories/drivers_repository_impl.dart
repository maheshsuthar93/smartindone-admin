import 'package:board_cut/core/core.dart';
import 'package:fpdart/fpdart.dart';

import '../../domain/repositories/drivers_repository.dart';
import '../data_sources/remote/drivers_remote_data_source.dart';
import '../models/driver_model.dart';

class DriversRepositoryImpl implements DriversRepository {
  DriversRepositoryImpl(this.remote);

  final DriversRemoteDataSource remote;

  @override
  Future<Either<Failure, PaginatedResult<DriverModel>>> getDrivers({
    required int page,
    required int limit,
    String? search,
  }) => safeCall(
    () => remote.getDrivers(page: page, limit: limit, search: search),
  );

  @override
  Future<Either<Failure, ApiResponse>> createDriver(
    Map<String, dynamic> data,
  ) => safeCall(() => remote.createDriver(data));

  @override
  Future<Either<Failure, ApiResponse>> updateDriver(
    String id,
    Map<String, dynamic> data,
  ) => safeCall(() => remote.updateDriver(id, data));

  @override
  Future<Either<Failure, ApiResponse>> deleteDriver(String id) =>
      safeCall(() => remote.deleteDriver(id));
}
