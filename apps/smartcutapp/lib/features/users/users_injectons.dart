import 'package:board_cut/core/core_injection.dart';

import 'data/data_sources/remote/user_remote_data_source.dart';
import 'data/data_sources/remote/user_remote_data_source_impl.dart';
import 'data/repositories/user_repository_impl.dart';
import 'domain/repositories/user_repository.dart';
import 'domain/usecases/create_user.dart';
import 'domain/usecases/get_users.dart';
import 'domain/usecases/update_user.dart';
import 'presentation/viewmodels/users_view_model.dart';

import 'package:board_cut/features/create_user/presentation/viewmodels/create_user_view_model.dart';

Future<void> initUsers() async {
  // ---------------- DATA ----------------
  sl.registerLazySingleton<UserRemoteDataSource>(
    () => UserRemoteDataSourceImpl(sl()),
  );

  sl.registerLazySingleton<UserRepository>(() => UserRepositoryImpl(sl()));

  // ---------------- DOMAIN ----------------
  sl.registerLazySingleton(() => GetUsers(sl()));
  sl.registerLazySingleton(() => CreateUser(sl()));
  sl.registerLazySingleton(() => UpdateUser(sl()));

  // ---------------- PRESENTATION ----------------
  sl.registerFactory(() => UsersViewModel(getUsers: sl()));
  sl.registerFactory(
    () => CreateUserViewModel(
      getCompanies: sl(),
      createUser: sl(),
      updateUser: sl(),
      storage: sl(),
    ),
  );
}
