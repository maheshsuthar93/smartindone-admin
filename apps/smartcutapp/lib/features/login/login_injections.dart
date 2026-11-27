import 'package:board_cut/core/core_injection.dart';

import 'data/data_sources/remote/login_remote_data_source.dart';
import 'data/data_sources/remote/login_remote_data_source_impl.dart';
import 'data/repositories/login_repository_impl.dart';
import 'domain/repositories/login_repository.dart';
import 'domain/usecases/login.dart';
import 'presentation/viewmodels/login_view_model.dart';

void initLogin() {
  sl.registerLazySingleton<LoginRemoteDataSource>(
    () => LoginRemoteDataSourceImpl(sl(), sl(), sl()),
  );
  sl.registerLazySingleton<LoginRepository>(() => LoginRepositoryImpl(sl()));
  sl.registerLazySingleton(() => Login(sl()));
  sl.registerFactory(() => LoginViewModel(login: sl()));
}
