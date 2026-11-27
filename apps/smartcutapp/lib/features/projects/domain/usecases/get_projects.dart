import 'package:board_cut/core/core.dart';
import 'package:fpdart/fpdart.dart';

import '../../data/models/project_model.dart';
import '../repositories/project_repository.dart';

class GetProjects {
  final ProjectRepository repository;

  GetProjects(this.repository);

  Future<Either<Failure, PaginatedResult<ProjectModel>>> call({
    required int page,
    required int limit,
    String? customerId,
  }) async {
    return repository.getProjects(
      page: page,
      limit: limit,
      customerId: customerId,
    );
  }
}
