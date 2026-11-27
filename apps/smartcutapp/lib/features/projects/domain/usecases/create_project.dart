import 'package:board_cut/core/core.dart';
import 'package:fpdart/fpdart.dart';

import '../repositories/project_repository.dart';

class CreateProject {
  const CreateProject(this.repository);

  final ProjectRepository repository;

  Future<Either<Failure, bool>> call({
    required String customerId,
    required Map<String, dynamic> data,
  }) => repository.createProject(customerId: customerId, data: data);
}
