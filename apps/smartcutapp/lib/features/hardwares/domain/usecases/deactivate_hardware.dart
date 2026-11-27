import 'package:board_cut/core/core.dart';
import 'package:fpdart/fpdart.dart';

import '../repositories/hardware_repository.dart';

class DeactivateHardware {
  DeactivateHardware(this.repository);
  final HardwareRepository repository;

  Future<Either<Failure, ApiResponse>> call({required String hardwareId}) =>
      repository.deactivateHardware(hardwareId: hardwareId);
}
