import 'package:board_cut/core/core_injection.dart';
import 'package:board_cut/features/part_detail/domain/usecases/generate_pieces_by_part_id.dart';
import 'package:board_cut/features/part_detail/domain/usecases/get_part_by_id.dart';

import 'data/data_sources/remote/part_detail_remote_data_source.dart';
import 'data/data_sources/remote/part_detail_remote_data_source_impl.dart';
import 'data/repositories/part_detail_repository_impl.dart';
import 'domain/repositories/part_detail_repository.dart';
import 'domain/usecases/get_pieces_by_part_id.dart';
import 'presentation/viewmodels/part_detail_view_model.dart';

Future<void> initPartDetail() async {
  // ---------------- DATA ----------------
  sl.registerLazySingleton<PartDetailRemoteDataSource>(
    () => PartDetailRemoteDataSourceImpl(sl()),
  );

  sl.registerLazySingleton<PartDetailRepository>(
    () => PartDetailRepositoryImpl(sl()),
  );

  // ---------------- DOMAIN ----------------
  sl.registerLazySingleton(() => GetPartById(sl()));
  sl.registerLazySingleton(() => GetPiecesByPartId(sl()));
  sl.registerLazySingleton(() => GeneratePiecesByPartId(sl()));

  // ---------------- PRESENTATION ----------------
  sl.registerFactory(
    () => PartDetailViewModel(
      getPartById: sl(),
      getPiecesByPartId: sl(),
      generatePiecesByPartId: sl(),
    ),
  );
}
