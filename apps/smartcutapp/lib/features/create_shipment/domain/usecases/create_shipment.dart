import 'package:board_cut/core/core.dart';
import 'package:fpdart/fpdart.dart';

import '../repositories/create_shipment_repository.dart';

class CreateShipment {
  final CreateShipmentRepository repository;

  CreateShipment(this.repository);

  Future<Either<Failure, ApiResponse>> call({
    required Map<String, dynamic> data,
  }) async {
    return repository.createShipment(data: data);
  }
}
