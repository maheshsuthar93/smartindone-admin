import 'package:board_cut/core/core.dart';
import 'package:fpdart/fpdart.dart';

import '../../data/models/shipment_model.dart';

abstract class ShipmentRepository {
  Future<Either<Failure, PaginatedResult<ShipmentModel>>> getShipments({
    required int page,
    required int limit,
  });
}
