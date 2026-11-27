import 'package:board_cut/core/core.dart';
import 'package:fpdart/fpdart.dart';

import '../repositories/process_type_repository.dart';

class CreateProcessType {
  const CreateProcessType(this.repository);

  final ProcessTypeRepository repository;

  Future<Either<Failure, ApiResponse>> call({
    required Map<String, dynamic> data,
  }) => repository.createProcessType(data: data);
}
