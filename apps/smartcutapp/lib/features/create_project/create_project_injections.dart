import 'package:board_cut/core/core_injection.dart';
import 'package:board_cut/features/create_project/presentation/viewmodels/create_project_view_model.dart';

Future<void> initCreateProject() async {
  sl.registerFactory(
    () => CreateProjectViewModel(
      getCustomers: sl(),
      getProjectById: sl(),
      createProject: sl(),
      updateProject: sl(),
    ),
  );
}
