import 'package:board_cut/core/core.dart';
import 'package:fpdart/fpdart.dart';

import '../../data/models/shipment_package_model.dart';
import '../repositories/shipment_detail_repository.dart';

class GetShipmentPackages {
  const GetShipmentPackages(this.repository);

  final ShipmentDetailRepository repository;

  Future<Either<Failure, List<ShipmentPackageModel>>> call({
    required String shipmentId,
  }) => repository.getShipmentPackages(shipmentId: shipmentId);
}
