import 'package:board_cut/core/core.dart';
import 'package:fpdart/fpdart.dart';

import '../../domain/repositories/shipment_repository.dart';
import '../data_sources/remote/shipment_remote_data_source.dart';
import '../models/shipment_model.dart';

class ShipmentRepositoryImpl implements ShipmentRepository {
  final ShipmentRemoteDataSource remoteDataSource;

  ShipmentRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, PaginatedResult<ShipmentModel>>> getShipments({
    required int page,
    required int limit,
  }) async {
    return safeCall(
      () => remoteDataSource.getShipments(page: page, limit: limit),
    );
  }
}
