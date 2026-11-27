import 'package:board_cut/core/core.dart';
import 'package:fpdart/fpdart.dart';

import '../repositories/hardware_repository.dart';

class UpdateHardware {
  UpdateHardware(this.repository);
  final HardwareRepository repository;

  Future<Either<Failure, ApiResponse>> call({
    required String hardwareId,
    required Map<String, dynamic> data,
  }) => repository.updateHardware(hardwareId: hardwareId, data: data);
}
