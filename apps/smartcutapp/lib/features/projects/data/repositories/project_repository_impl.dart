import 'package:board_cut/core/core.dart';
import 'package:board_cut/features/projects/data/models/project_analytics_model.dart';
import 'package:fpdart/fpdart.dart';

import '../../domain/repositories/project_repository.dart';
import '../data_sources/remote/project_remote_data_source.dart';
import '../models/project_model.dart';
import '../models/project_detail_model.dart';

class ProjectRepositoryImpl implements ProjectRepository {
  final ProjectRemoteDataSource remoteDataSource;

  ProjectRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, PaginatedResult<ProjectModel>>> getProjects({
    required int page,
    required int limit,
    String? customerId,
  }) async {
    return safeCall(
      () => remoteDataSource.getProjects(
        page: page,
        limit: limit,
        customerId: customerId,
      ),
    );
  }

  @override
  Future<Either<Failure, ProjectAnalyticsModel>> getProjectAnalytics() {
    return safeCall(() => remoteDataSource.getProjectAnalytics());
  }

  @override
  Future<Either<Failure, ProjectDetailModel>> getProjectById({
    required String projectId,
  }) => safeCall(() => remoteDataSource.getProjectById(projectId: projectId));

  @override
  Future<Either<Failure, bool>> createProject({
    required String customerId,
    required Map<String, dynamic> data,
  }) => safeCall(
    () => remoteDataSource.createProject(customerId: customerId, data: data),
  );

  @override
  Future<Either<Failure, bool>> updateProject({
    required String projectId,
    required Map<String, dynamic> data,
  }) => safeCall(
    () => remoteDataSource.updateProject(projectId: projectId, data: data),
  );
}
