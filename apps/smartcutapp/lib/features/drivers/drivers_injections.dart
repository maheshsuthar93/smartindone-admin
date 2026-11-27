import 'package:board_cut/core/core_injection.dart';

import 'data/data_sources/remote/drivers_remote_data_source.dart';
import 'data/data_sources/remote/drivers_remote_data_source_impl.dart';
import 'data/repositories/drivers_repository_impl.dart';
import 'domain/repositories/drivers_repository.dart';
import 'domain/usecases/driver_usecases.dart';
import 'presentation/viewmodels/drivers_view_model.dart';

void initDrivers() {
  sl.registerLazySingleton<DriversRemoteDataSource>(
    () => DriversRemoteDataSourceImpl(sl()),
  );
  sl.registerLazySingleton<DriversRepository>(
    () => DriversRepositoryImpl(sl()),
  );
  sl.registerLazySingleton(() => GetDrivers(sl()));
  sl.registerLazySingleton(() => CreateDriver(sl()));
  sl.registerLazySingleton(() => UpdateDriver(sl()));
  sl.registerLazySingleton(() => DeleteDriver(sl()));
  sl.registerFactory(
    () => DriversViewModel(
      getDrivers: sl(),
      createDriver: sl(),
      updateDriver: sl(),
      deleteDriver: sl(),
    ),
  );
}
