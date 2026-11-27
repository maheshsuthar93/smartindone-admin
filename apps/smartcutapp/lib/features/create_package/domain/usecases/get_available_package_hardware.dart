import 'package:board_cut/core/core.dart';
import 'package:fpdart/fpdart.dart';

import '../../data/models/available_package_hardware_model.dart';
import '../repositories/package_repository.dart';

class GetAvailablePackageHardware {
  GetAvailablePackageHardware(this.repository);
  final PackageRepository repository;

  Future<Either<Failure, List<AvailablePackageHardwareModel>>> call({
    required String warehouseId,
  }) => repository.getAvailableHardware(warehouseId: warehouseId);
}
