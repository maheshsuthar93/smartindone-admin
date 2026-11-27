import 'package:board_cut/core/core.dart';
import 'package:fpdart/fpdart.dart';

import '../repositories/hardware_repository.dart';

class CreateHardware {
  CreateHardware(this.repository);
  final HardwareRepository repository;

  Future<Either<Failure, ApiResponse>> call({
    required Map<String, dynamic> data,
  }) => repository.createHardware(data: data);
}
