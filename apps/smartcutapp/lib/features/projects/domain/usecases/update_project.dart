import 'package:board_cut/core/core.dart';
import 'package:fpdart/fpdart.dart';

import '../repositories/project_repository.dart';

class UpdateProject {
  const UpdateProject(this.repository);

  final ProjectRepository repository;

  Future<Either<Failure, bool>> call({
    required String projectId,
    required Map<String, dynamic> data,
  }) => repository.updateProject(projectId: projectId, data: data);
}
