import 'package:board_cut/core/core.dart';
import 'package:fpdart/fpdart.dart';

import '../../data/models/driver_model.dart';

abstract class DriversRepository {
  Future<Either<Failure, PaginatedResult<DriverModel>>> getDrivers({
    required int page,
    required int limit,
    String? search,
  });

  Future<Either<Failure, ApiResponse>> createDriver(Map<String, dynamic> data);

  Future<Either<Failure, ApiResponse>> updateDriver(
    String id,
    Map<String, dynamic> data,
  );

  Future<Either<Failure, ApiResponse>> deleteDriver(String id);
}
