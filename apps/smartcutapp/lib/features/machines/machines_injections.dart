import 'package:board_cut/core/core_injection.dart';

import 'data/data_sources/machine_remote_data_source.dart';
import 'data/data_sources/machine_remote_data_source_impl.dart';
import 'presentation/viewmodels/machines_view_model.dart';

void initMachines() {
  sl.registerLazySingleton<MachineRemoteDataSource>(
    () => MachineRemoteDataSourceImpl(sl()),
  );
  sl.registerFactory(
    () => MachinesViewModel(machineRemoteDataSource: sl(), getFactories: sl()),
  );
}
