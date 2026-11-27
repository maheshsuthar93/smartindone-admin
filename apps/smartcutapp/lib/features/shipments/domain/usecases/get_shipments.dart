import 'package:board_cut/core/core.dart';
import 'package:fpdart/fpdart.dart';

import '../../data/models/shipment_model.dart';
import '../repositories/shipment_repository.dart';

class GetShipments {
  final ShipmentRepository repository;

  GetShipments(this.repository);

  Future<Either<Failure, PaginatedResult<ShipmentModel>>> call({
    required int page,
    required int limit,
  }) async {
    return repository.getShipments(page: page, limit: limit);
  }
}
