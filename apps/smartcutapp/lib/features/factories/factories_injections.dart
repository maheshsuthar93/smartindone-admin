import 'package:board_cut/core/core_injection.dart';

import 'data/data_sources/remote/factory_remote_data_source.dart';
import 'data/data_sources/remote/factory_remote_data_source_impl.dart';
import 'data/repositories/factory_repository_impl.dart';
import 'domain/repositories/factory_repository.dart';
import 'domain/usecases/get_factories.dart';
import 'domain/usecases/save_factory.dart';
import 'presentation/viewmodels/factories_view_model.dart';
import 'presentation/viewmodels/factory_form_view_model.dart';

void initFactories() {
  sl.registerLazySingleton<FactoryRemoteDataSource>(
    () => FactoryRemoteDataSourceImpl(sl()),
  );
  sl.registerLazySingleton<FactoryRepository>(
    () => FactoryRepositoryImpl(sl()),
  );
  sl.registerLazySingleton(() => GetFactories(sl()));
  sl.registerLazySingleton(() => SaveFactory(sl()));
  sl.registerFactory(() => FactoriesViewModel(getFactories: sl()));
  sl.registerFactory(() => FactoryFormViewModel(saveFactory: sl()));
}
