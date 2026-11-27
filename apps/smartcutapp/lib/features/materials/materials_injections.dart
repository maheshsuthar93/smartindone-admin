import 'package:board_cut/core/core_injection.dart';

import 'data/data_sources/remote/material_remote_data_source.dart';
import 'data/data_sources/remote/material_remote_data_source_impl.dart';
import 'data/repositories/material_repository_impl.dart';
import 'domain/repositories/material_repository.dart';
import 'domain/usecases/create_material.dart';
import 'domain/usecases/delete_material.dart';
import 'domain/usecases/get_materials.dart';
import 'domain/usecases/update_material.dart';
import 'presentation/viewmodels/materials_view_model.dart';

void initMaterials() {
  sl.registerLazySingleton<MaterialRemoteDataSource>(
    () => MaterialRemoteDataSourceImpl(sl()),
  );
  sl.registerLazySingleton<MaterialRepository>(
    () => MaterialRepositoryImpl(sl()),
  );
  sl.registerLazySingleton(() => GetMaterials(sl()));
  sl.registerLazySingleton(() => CreateMaterial(sl()));
  sl.registerLazySingleton(() => UpdateMaterial(sl()));
  sl.registerLazySingleton(() => DeleteMaterial(sl()));
  sl.registerFactory(
    () => MaterialsViewModel(
      getMaterials: sl(),
      createMaterial: sl(),
      updateMaterial: sl(),
      deleteMaterial: sl(),
    ),
  );
}
