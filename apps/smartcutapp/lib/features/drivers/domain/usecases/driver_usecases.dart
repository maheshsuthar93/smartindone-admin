import 'package:board_cut/core/core.dart';
import 'package:fpdart/fpdart.dart';

import '../repositories/drivers_repository.dart';
import '../../data/models/driver_model.dart';

class GetDrivers {
  GetDrivers(this.repo);

  final DriversRepository repo;

  Future<Either<Failure, PaginatedResult<DriverModel>>> call({
    required int page,
    required int limit,
    String? search,
  }) => repo.getDrivers(page: page, limit: limit, search: search);
}

class CreateDriver {
  CreateDriver(this.repo);

  final DriversRepository repo;

  Future<Either<Failure, ApiResponse>> call(Map<String, dynamic> data) =>
      repo.createDriver(data);
}

class UpdateDriver {
  UpdateDriver(this.repo);

  final DriversRepository repo;

  Future<Either<Failure, ApiResponse>> call(
    String id,
    Map<String, dynamic> data,
  ) => repo.updateDriver(id, data);
}

class DeleteDriver {
  DeleteDriver(this.repo);

  final DriversRepository repo;

  Future<Either<Failure, ApiResponse>> call(String id) => repo.deleteDriver(id);
}
