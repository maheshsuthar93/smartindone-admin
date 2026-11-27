import 'package:board_cut/core/core_injection.dart';
import 'package:board_cut/features/create_part/data/data_sources/remote/create_part_remote_data_source.dart';
import 'package:board_cut/features/create_part/data/data_sources/remote/create_part_remote_data_source_impl.dart';
import 'package:board_cut/features/create_part/data/repositories/create_part_repository_impl.dart';
import 'package:board_cut/features/create_part/domain/repositories/create_part_repository.dart';
import 'package:board_cut/features/create_part/domain/usecases/create_part.dart';
import 'package:board_cut/features/create_part/domain/usecases/get_part_materials.dart';
import 'package:board_cut/features/create_part/domain/usecases/update_part.dart';
import 'package:board_cut/features/create_part/presentation/viewmodels/create_part_view_model.dart';
import 'package:board_cut/features/part_detail/domain/usecases/get_part_by_id.dart';

void initCreatePart() {
  sl.registerLazySingleton<CreatePartRemoteDataSource>(
    () => CreatePartRemoteDataSourceImpl(sl()),
  );
  sl.registerLazySingleton<CreatePartRepository>(
    () => CreatePartRepositoryImpl(sl()),
  );
  sl.registerLazySingleton(() => CreatePart(sl()));
  sl.registerLazySingleton(() => UpdatePart(sl()));
  sl.registerLazySingleton(() => GetPartMaterials(sl()));
  sl.registerFactory(
    () => CreatePartViewModel(
      createPart: sl(),
      updatePart: sl(),
      getPartMaterials: sl(),
      getPartById: sl<GetPartById>(),
    ),
  );
}
