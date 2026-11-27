import 'package:board_cut/core/core.dart';
import 'package:fpdart/fpdart.dart';

import '../../data/models/process_type_model.dart';
import '../repositories/process_type_repository.dart';

class GetProcessTypes {
  const GetProcessTypes(this.repository);

  final ProcessTypeRepository repository;

  Future<Either<Failure, List<ProcessTypeModel>>> call() =>
      repository.getProcessTypes();
}
