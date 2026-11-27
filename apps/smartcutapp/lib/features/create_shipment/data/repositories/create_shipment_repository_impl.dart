import 'package:board_cut/core/core.dart';
import 'package:board_cut/features/create_shipment/data/models/shipment_driver_model.dart';
import 'package:fpdart/fpdart.dart';

import '../../domain/repositories/create_shipment_repository.dart';
import '../data_sources/remote/create_shipment_remote_data_source.dart';
import '../models/create_shipment_order_model.dart';
import '../models/create_shipment_project_model.dart';

class CreateShipmentRepositoryImpl implements CreateShipmentRepository {
  final CreateShipmentRemoteDataSource remoteDataSource;

  CreateShipmentRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, ApiResponse>> createShipment({
    required Map<String, dynamic> data,
  }) async {
    return safeCall(() => remoteDataSource.createShipment(data: data));
  }

  @override
  Future<Either<Failure, ApiResponse>> updateShipment({
    required String shipmentId,
    required Map<String, dynamic> data,
  }) {
    return safeCall(
      () => remoteDataSource.updateShipment(shipmentId: shipmentId, data: data),
    );
  }

  @override
  Future<Either<Failure, List<CreateShipmentProjectModel>>> getProjects({
    required String companyId,
  }) {
    return safeCall(() => remoteDataSource.getProjects(companyId: companyId));
  }

  @override
  Future<Either<Failure, List<CreateShipmentOrderModel>>> getOrdersByProjectId({
    required String projectId,
  }) {
    return safeCall(
      () => remoteDataSource.getOrdersByProjectId(projectId: projectId),
    );
  }

  @override
  Future<Either<Failure, List<ShipmentDriverModel>>> getDriversByCompanyId({
    required String companyId,
  }) {
    return safeCall(
      () => remoteDataSource.getDriversByCompanyId(companyId: companyId),
    );
  }
}
