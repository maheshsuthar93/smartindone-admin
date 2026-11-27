import 'package:board_cut/core/core.dart';
import 'package:board_cut/features/projects/data/models/project_analytics_model.dart';
import 'package:fpdart/fpdart.dart';

import '../../data/models/project_detail_model.dart';

import '../../data/models/project_model.dart';

abstract class ProjectRepository {
  Future<Either<Failure, PaginatedResult<ProjectModel>>> getProjects({
    required int page,
    required int limit,
    String? customerId,
  });

  Future<Either<Failure, ProjectAnalyticsModel>> getProjectAnalytics();

  Future<Either<Failure, ProjectDetailModel>> getProjectById({
    required String projectId,
  });

  Future<Either<Failure, bool>> createProject({
    required String customerId,
    required Map<String, dynamic> data,
  });

  Future<Either<Failure, bool>> updateProject({
    required String projectId,
    required Map<String, dynamic> data,
  });
}
