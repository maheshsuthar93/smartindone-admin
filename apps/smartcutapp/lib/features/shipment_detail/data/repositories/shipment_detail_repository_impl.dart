import 'package:board_cut/core/core.dart';
import 'package:fpdart/fpdart.dart';

import '../../domain/repositories/shipment_detail_repository.dart';
import '../data_sources/remote/shipment_detail_remote_data_source.dart';
import '../models/shipment_detail_model.dart';
import '../models/shipment_package_model.dart';

class ShipmentDetailRepositoryImpl implements ShipmentDetailRepository {
  final ShipmentDetailRemoteDataSource remoteDataSource;

  ShipmentDetailRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, ShipmentDetailModel>> getShipmentDetail({
    required String id,
  }) async {
    return safeCall(() => remoteDataSource.getShipmentDetail(id: id));
  }

  @override
  Future<Either<Failure, List<ShipmentPackageModel>>> getShipmentPackages({
    required String shipmentId,
  }) => safeCall(
    () => remoteDataSource.getShipmentPackages(shipmentId: shipmentId),
  );
}
