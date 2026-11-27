import 'package:board_cut/core/core.dart';
import 'package:fpdart/fpdart.dart';

import '../../data/models/shipment_detail_model.dart';
import '../repositories/shipment_detail_repository.dart';

class GetShipmentDetail {
  final ShipmentDetailRepository repository;

  GetShipmentDetail(this.repository);

  Future<Either<Failure, ShipmentDetailModel>> call({
    required String id,
  }) async {
    return repository.getShipmentDetail(id: id);
  }
}
