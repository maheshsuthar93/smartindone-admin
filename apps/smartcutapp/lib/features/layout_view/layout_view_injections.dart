import 'package:board_cut/core/core_injection.dart';
import 'package:board_cut/features/layout_view/domain/usecases/select_optimization_layout.dart';
import 'package:board_cut/features/layout_view/domain/usecases/cancel_optimization_layout.dart';
import 'package:board_cut/features/layout_view/domain/usecases/complete_optimization_production.dart';
import 'package:board_cut/features/layout_view/domain/usecases/classify_remaining_area.dart';

import 'data/data_sources/remote/layout_view_remote_data_source.dart';
import 'data/data_sources/remote/layout_view_remote_data_source_impl.dart';
import 'data/repositories/layout_view_repository_impl.dart';
import 'domain/repositories/layout_view_repository.dart';
import 'domain/usecases/get_material_group_by_id.dart';
import 'domain/usecases/get_optimization_layout_by_id.dart';
import 'domain/usecases/get_piece_process_types.dart';
import 'domain/usecases/get_sheet_by_id.dart';
import 'presentation/view_models/layout_view_view_model.dart';

Future<void> initLayoutView() async {
  // ---------------- DATA ----------------
  sl.registerLazySingleton<LayoutViewRemoteDataSource>(
    () => LayoutViewRemoteDataSourceImpl(sl()),
  );

  sl.registerLazySingleton<LayoutViewRepository>(
    () => LayoutViewRepositoryImpl(sl()),
  );

  // ---------------- DOMAIN ----------------
  sl.registerLazySingleton(() => GetMaterialGroupById(sl()));
  sl.registerLazySingleton(() => GetPieceProcessTypes(sl()));
  sl.registerLazySingleton(() => GetSheetById(sl()));
  sl.registerLazySingleton(() => SelectOptimizationLayout(sl()));
  sl.registerLazySingleton(() => GetOptimizationLayoutById(sl()));
  sl.registerLazySingleton(() => CancelOptimizationLayout(sl()));
  sl.registerLazySingleton(() => CompleteOptimizationProduction(sl()));
  sl.registerLazySingleton(() => ClassifyRemainingArea(sl()));

  // ---------------- PRESENTATION ----------------
  sl.registerFactory(
    () => LayoutViewViewModel(
      getMaterialGroupById: sl(),
      getPieceProcessTypes: sl(),
      getSheetById: sl(),
      selectOptimizationLayout: sl(),
      getOptimizationLayoutById: sl(),
      cancelOptimizationLayout: sl(),
      completeOptimizationProduction: sl(),
      classifyRemainingAreaUseCase: sl(),
    ),
  );
}
