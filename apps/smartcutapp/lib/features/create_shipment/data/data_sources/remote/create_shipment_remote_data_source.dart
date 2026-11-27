import 'package:board_cut/core/core.dart';
import 'package:board_cut/features/create_shipment/data/models/create_shipment_project_model.dart';
import 'package:board_cut/features/create_shipment/data/models/shipment_driver_model.dart';

import '../../models/create_shipment_order_model.dart';

abstract class CreateShipmentRemoteDataSource {
  Future<ApiResponse> createShipment({required Map<String, dynamic> data});

  Future<ApiResponse> updateShipment({
    required String shipmentId,
    required Map<String, dynamic> data,
  });

  Future<List<CreateShipmentProjectModel>> getProjects({
    required String companyId,
  });

  Future<List<CreateShipmentOrderModel>> getOrdersByProjectId({
    required String projectId,
  });

  Future<List<ShipmentDriverModel>> getDriversByCompanyId({
    required String companyId,
  });
}
