import 'package:board_cut/core/core.dart';
import 'package:fpdart/fpdart.dart';

import '../../data/models/create_shipment_order_model.dart';
import '../repositories/create_shipment_repository.dart';

class GetShipmentById {
  final CreateShipmentRepository repository;

  GetShipmentById(this.repository);

  Future<Either<Failure, List<CreateShipmentOrderModel>>> call({
    required String projectId,
  }) async {
    return repository.getOrdersByProjectId(projectId: projectId);
  }
}
