import 'package:board_cut/core/core.dart';
import 'package:fpdart/fpdart.dart';

import '../../data/models/project_detail_model.dart';
import '../repositories/project_repository.dart';

class GetProjectById {
  const GetProjectById(this.repository);

  final ProjectRepository repository;

  Future<Either<Failure, ProjectDetailModel>> call({
    required String projectId,
  }) => repository.getProjectById(projectId: projectId);
}
