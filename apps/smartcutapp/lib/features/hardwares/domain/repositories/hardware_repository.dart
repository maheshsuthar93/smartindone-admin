import 'package:board_cut/core/core.dart';
import 'package:board_cut/features/hardwares/data/models/hardware_model.dart';
import 'package:fpdart/fpdart.dart';

abstract class HardwareRepository {
  Future<Either<Failure, PaginatedResult<HardwareModel>>> getHardwares({
    required int page,
    required int limit,
    String? search,
  });

  Future<Either<Failure, ApiResponse>> createHardware({
    required Map<String, dynamic> data,
  });

  Future<Either<Failure, ApiResponse>> updateHardware({
    required String hardwareId,
    required Map<String, dynamic> data,
  });

  Future<Either<Failure, ApiResponse>> deactivateHardware({
    required String hardwareId,
  });
}
