import 'package:board_cut/core/core.dart';
import 'package:fpdart/fpdart.dart';

import '../repositories/process_type_repository.dart';

class DeleteProcessType {
  const DeleteProcessType(this.repository);

  final ProcessTypeRepository repository;

  Future<Either<Failure, ApiResponse>> call({required String processTypeId}) =>
      repository.deleteProcessType(processTypeId: processTypeId);
}
