import 'package:board_cut/core/core.dart';

import '../models/machine_model.dart';

abstract class MachineRemoteDataSource {
  Future<PaginatedResult<MachineModel>> getMachines({
    required int page,
    required int limit,
    String? search,
  });

  Future<ApiResponse> createMachine({required Map<String, dynamic> data});

  Future<ApiResponse> updateMachine({
    required String machineId,
    required Map<String, dynamic> data,
  });

  Future<ApiResponse> deactivateMachine({required String machineId});
}
