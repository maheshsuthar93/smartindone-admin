import 'package:board_cut/core/core.dart';
import 'package:fpdart/fpdart.dart';

import '../repositories/process_type_repository.dart';

class UpdateProcessType {
  const UpdateProcessType(this.repository);

  final ProcessTypeRepository repository;

  Future<Either<Failure, ApiResponse>> call({
    required String processTypeId,
    required Map<String, dynamic> data,
  }) => repository.updateProcessType(processTypeId: processTypeId, data: data);
}
