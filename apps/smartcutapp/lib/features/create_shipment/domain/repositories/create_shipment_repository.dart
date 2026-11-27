import 'package:board_cut/core/core.dart';
import 'package:fpdart/fpdart.dart';

import '../../data/models/create_shipment_order_model.dart';
import '../../data/models/create_shipment_project_model.dart';
import '../../data/models/shipment_driver_model.dart';

abstract class CreateShipmentRepository {
  Future<Either<Failure, ApiResponse>> createShipment({
    required Map<String, dynamic> data,
  });

  Future<Either<Failure, ApiResponse>> updateShipment({
    required String shipmentId,
    required Map<String, dynamic> data,
  });

  Future<Either<Failure, List<CreateShipmentProjectModel>>> getProjects({
    required String companyId,
  });

  Future<Either<Failure, List<CreateShipmentOrderModel>>> getOrdersByProjectId({
    required String projectId,
  });

  Future<Either<Failure, List<ShipmentDriverModel>>> getDriversByCompanyId({
    required String companyId,
  });
}
