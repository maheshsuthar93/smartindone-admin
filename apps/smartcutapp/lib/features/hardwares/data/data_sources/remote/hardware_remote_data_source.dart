import 'package:board_cut/core/core.dart';

import '../../models/hardware_model.dart';

abstract class HardwareRemoteDataSource {
  Future<PaginatedResult<HardwareModel>> getHardwares({
    required int page,
    required int limit,
    String? search,
  });

  Future<ApiResponse> createHardware({required Map<String, dynamic> data});

  Future<ApiResponse> updateHardware({
    required String hardwareId,
    required Map<String, dynamic> data,
  });

  Future<ApiResponse> deactivateHardware({required String hardwareId});
}
