import '../../models/shipment_detail_model.dart';
import '../../models/shipment_package_model.dart';

abstract class ShipmentDetailRemoteDataSource {
  Future<ShipmentDetailModel> getShipmentDetail({required String id});

  Future<List<ShipmentPackageModel>> getShipmentPackages({
    required String shipmentId,
  });
}
