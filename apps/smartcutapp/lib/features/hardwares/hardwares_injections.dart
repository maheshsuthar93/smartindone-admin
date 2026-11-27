import 'package:board_cut/core/core_injection.dart';

import 'data/data_sources/remote/hardware_remote_data_source.dart';
import 'data/data_sources/remote/hardware_remote_data_source_impl.dart';
import 'data/repositories/hardware_repository_impl.dart';
import 'domain/repositories/hardware_repository.dart';
import 'domain/usecases/create_hardware.dart';
import 'domain/usecases/deactivate_hardware.dart';
import 'domain/usecases/get_hardwares.dart';
import 'domain/usecases/update_hardware.dart';
import 'presentation/viewmodels/hardwares_view_model.dart';

void initHardwares() {
  sl.registerLazySingleton<HardwareRemoteDataSource>(
    () => HardwareRemoteDataSourceImpl(sl()),
  );
  sl.registerLazySingleton<HardwareRepository>(
    () => HardwareRepositoryImpl(sl()),
  );
  sl.registerLazySingleton(() => GetHardwares(sl()));
  sl.registerLazySingleton(() => CreateHardware(sl()));
  sl.registerLazySingleton(() => UpdateHardware(sl()));
  sl.registerLazySingleton(() => DeactivateHardware(sl()));
  sl.registerFactory(
    () => HardwaresViewModel(
      getHardwares: sl(),
      createHardware: sl(),
      updateHardware: sl(),
      deactivateHardware: sl(),
      getWarehouses: sl(),
    ),
  );
}
