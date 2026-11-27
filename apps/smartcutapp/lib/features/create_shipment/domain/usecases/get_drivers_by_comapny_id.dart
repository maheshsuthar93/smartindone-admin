import 'package:board_cut/core/core.dart';
import 'package:fpdart/fpdart.dart';

import '../../data/models/shipment_driver_model.dart';
import '../repositories/create_shipment_repository.dart';

class GetDriversByCompanyId {
  final CreateShipmentRepository repository;

  GetDriversByCompanyId(this.repository);

  Future<Either<Failure, List<ShipmentDriverModel>>> call({
    required String companyId,
  }) async {
    return repository.getDriversByCompanyId(companyId: companyId);
  }
}
