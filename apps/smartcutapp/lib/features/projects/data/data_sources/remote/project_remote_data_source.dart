import 'package:board_cut/core/core.dart';
import 'package:board_cut/features/projects/data/models/project_analytics_model.dart';

import '../../models/project_detail_model.dart';

import '../../models/project_model.dart';

abstract class ProjectRemoteDataSource {
  Future<PaginatedResult<ProjectModel>> getProjects({
    required int page,
    required int limit,
    String? customerId,
  });

  Future<ProjectAnalyticsModel> getProjectAnalytics();

  Future<ProjectDetailModel> getProjectById({required String projectId});

  Future<bool> createProject({
    required String customerId,
    required Map<String, dynamic> data,
  });

  Future<bool> updateProject({
    required String projectId,
    required Map<String, dynamic> data,
  });
}
