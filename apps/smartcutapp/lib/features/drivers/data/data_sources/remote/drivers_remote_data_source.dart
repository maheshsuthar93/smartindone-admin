import 'package:board_cut/core/core.dart';

import '../../models/driver_model.dart';

abstract class DriversRemoteDataSource {
  Future<PaginatedResult<DriverModel>> getDrivers({
    required int page,
    required int limit,
    String? search,
  });

  Future<ApiResponse> createDriver(Map<String, dynamic> data);

  Future<ApiResponse> updateDriver(String id, Map<String, dynamic> data);

  Future<ApiResponse> deleteDriver(String id);
}
