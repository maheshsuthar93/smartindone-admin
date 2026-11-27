import 'package:board_cut/core/core.dart';
import 'package:fpdart/fpdart.dart';

import '../repositories/create_shipment_repository.dart';

class UpdateShipment {
  final CreateShipmentRepository repository;

  UpdateShipment(this.repository);

  Future<Either<Failure, ApiResponse>> call({
    required String shipmentId,
    required Map<String, dynamic> data,
  }) {
    return repository.updateShipment(shipmentId: shipmentId, data: data);
  }
}
