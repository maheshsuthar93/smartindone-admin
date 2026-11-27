import 'package:board_cut/core/core_injection.dart';

import 'data/data_sources/remote/selected_piece_detail_remote_data_source.dart';
import 'data/data_sources/remote/selected_piece_detail_remote_data_source_impl.dart';
import 'data/repositories/selected_piece_detail_repository_impl.dart';
import 'domain/repositories/selected_piece_detail_repository.dart';
import 'domain/usecases/get_piece_by_id.dart';
import 'domain/usecases/get_piece_by_code.dart';
import 'domain/usecases/update_piece_process_status.dart';
import 'presentation/view_models/piece_detail_view_model.dart';

Future<void> initSelectedPieceDetail() async {
  // ---------------- DATA ----------------
  sl.registerLazySingleton<SelectedPieceDetailRemoteDataSource>(
    () => SelectedPieceDetailRemoteDataSourceImpl(sl()),
  );

  sl.registerLazySingleton<SelectedPieceDetailRepository>(
    () => SelectedPieceDetailRepositoryImpl(sl()),
  );

  // ---------------- DOMAIN ----------------
  sl.registerLazySingleton(() => GetPieceById(sl()));
  sl.registerLazySingleton(() => GetPieceByCode(sl()));
  sl.registerLazySingleton(() => UpdatePieceProcessStatus(sl()));

  // ---------------- PRESENTATION ----------------
  sl.registerFactory(
    () => PieceDetailViewModel(
      getPieceById: sl(),
      updatePieceProcessStatus: sl(),
    ),
  );
}
