import 'package:board_cut/core/core.dart';

import '../../models/shipment_model.dart';

abstract class ShipmentRemoteDataSource {
  Future<PaginatedResult<ShipmentModel>> getShipments({
    required int page,
    required int limit,
  });
}
