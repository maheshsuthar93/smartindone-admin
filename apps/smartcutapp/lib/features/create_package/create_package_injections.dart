import 'package:board_cut/core/core_injection.dart';

import 'data/data_sources/remote/package_remote_data_source.dart';
import 'data/data_sources/remote/package_remote_data_source_impl.dart';
import 'data/repositories/package_repository_impl.dart';
import 'domain/repositories/package_repository.dart';
import 'domain/usecases/create_package.dart';
import 'domain/usecases/get_package.dart';
import 'domain/usecases/get_available_package_pieces.dart';
import 'domain/usecases/get_available_package_hardware.dart';
import 'domain/usecases/update_package.dart';
import 'presentation/viewmodels/package_view_model.dart';

Future<void> initCreatePackage() async {
  sl.registerLazySingleton<PackageRemoteDataSource>(
    () => PackageRemoteDataSourceImpl(sl()),
  );
  sl.registerLazySingleton<PackageRepository>(
    () => PackageRepositoryImpl(sl()),
  );
  sl.registerLazySingleton(() => GetPackage(sl()));
  sl.registerLazySingleton(() => GetAvailablePackagePieces(sl()));
  sl.registerLazySingleton(() => GetAvailablePackageHardware(sl()));
  sl.registerLazySingleton(() => CreatePackage(sl()));
  sl.registerLazySingleton(() => UpdatePackage(sl()));
  sl.registerFactory(
    () => PackageViewModel(
      getPackage: sl(),
      getAvailablePackagePieces: sl(),
      getAvailablePackageHardware: sl(),
      getWarehouses: sl(),
      createPackage: sl(),
      updatePackage: sl(),
    ),
  );
}
