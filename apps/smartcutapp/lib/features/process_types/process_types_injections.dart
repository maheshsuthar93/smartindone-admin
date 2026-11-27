import 'package:board_cut/core/core_injection.dart';

import 'data/data_sources/remote/process_type_remote_data_source.dart';
import 'data/data_sources/remote/process_type_remote_data_source_impl.dart';
import 'data/repositories/process_type_repository_impl.dart';
import 'domain/repositories/process_type_repository.dart';
import 'domain/usecases/create_process_type.dart';
import 'domain/usecases/delete_process_type.dart';
import 'domain/usecases/get_process_types.dart';
import 'domain/usecases/update_process_type.dart';
import 'presentation/viewmodels/process_types_view_model.dart';

void initProcessTypes() {
  sl.registerLazySingleton<ProcessTypeRemoteDataSource>(
    () => ProcessTypeRemoteDataSourceImpl(sl()),
  );
  sl.registerLazySingleton<ProcessTypeRepository>(
    () => ProcessTypeRepositoryImpl(sl()),
  );
  sl.registerLazySingleton(() => GetProcessTypes(sl()));
  sl.registerLazySingleton(() => CreateProcessType(sl()));
  sl.registerLazySingleton(() => UpdateProcessType(sl()));
  sl.registerLazySingleton(() => DeleteProcessType(sl()));
  sl.registerFactory(
    () => ProcessTypesViewModel(
      getProcessTypes: sl(),
      createProcessType: sl(),
      updateProcessType: sl(),
      deleteProcessType: sl(),
    ),
  );
}
