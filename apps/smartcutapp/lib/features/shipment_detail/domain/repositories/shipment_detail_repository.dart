import 'package:board_cut/core/core.dart';
import 'package:fpdart/fpdart.dart';

import '../../data/models/shipment_detail_model.dart';
import '../../data/models/shipment_package_model.dart';

abstract class ShipmentDetailRepository {
  Future<Either<Failure, ShipmentDetailModel>> getShipmentDetail({
    required String id,
  });

  Future<Either<Failure, List<ShipmentPackageModel>>> getShipmentPackages({
    required String shipmentId,
  });
}
