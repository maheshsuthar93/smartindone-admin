import 'package:board_cut/core/core_injection.dart';
import 'package:board_cut/features/projects/domain/usecases/get_project_analytics.dart';
import 'package:board_cut/features/projects/domain/usecases/get_project_by_id.dart';
import 'package:board_cut/features/projects/domain/usecases/create_project.dart';
import 'package:board_cut/features/projects/domain/usecases/update_project.dart';

import 'data/data_sources/remote/project_remote_data_source.dart';
import 'data/data_sources/remote/project_remote_data_source_impl.dart';
import 'data/repositories/project_repository_impl.dart';
import 'domain/repositories/project_repository.dart';
import 'domain/usecases/get_projects.dart';
import 'presentation/viewmodels/projects_view_model.dart';

Future<void> initProjects() async {
  // ---------------- DATA ----------------
  sl.registerLazySingleton<ProjectRemoteDataSource>(
    () => ProjectRemoteDataSourceImpl(sl()),
  );

  sl.registerLazySingleton<ProjectRepository>(
    () => ProjectRepositoryImpl(sl()),
  );

  // ---------------- DOMAIN ----------------
  sl.registerLazySingleton(() => GetProjects(sl()));
  sl.registerLazySingleton(() => GetProjectAnalytics(sl()));
  sl.registerLazySingleton(() => GetProjectById(sl()));
  sl.registerLazySingleton(() => CreateProject(sl()));
  sl.registerLazySingleton(() => UpdateProject(sl()));

  // ---------------- PRESENTATION ----------------
  sl.registerFactory(
    () => ProjectsViewModel(getProjects: sl(), getProjectAnalytics: sl()),
  );
}
