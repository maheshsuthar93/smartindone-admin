import 'package:board_cut/core/core.dart';
import 'package:fpdart/fpdart.dart';

import '../../data/models/create_shipment_project_model.dart';
import '../repositories/create_shipment_repository.dart';

class GetCreateShipmentProjects {
  final CreateShipmentRepository repository;

  GetCreateShipmentProjects(this.repository);

  Future<Either<Failure, List<CreateShipmentProjectModel>>> call({
    required String companyId,
  }) {
    return repository.getProjects(companyId: companyId);
  }
}
