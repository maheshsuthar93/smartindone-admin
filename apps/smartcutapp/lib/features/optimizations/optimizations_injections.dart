import 'package:board_cut/core/core_injection.dart';
import 'package:board_cut/features/optimizations/domain/usecases/create_order_optimization.dart';
import 'package:board_cut/features/optimizations/domain/usecases/get_material_groups_by_optimization_id.dart';

import 'data/data_sources/remote/optimizations_remote_data_source.dart';
import 'data/data_sources/remote/optimizations_remote_data_source_impl.dart';
import 'data/repositories/optimizations_repository_impl.dart';
import 'domain/repositories/optimizations_repository.dart';
import 'domain/usecases/get_optimizations_by_order_id.dart';
import 'domain/usecases/run_optimization_material_group.dart';
import 'presentation/view_models/optimizations_view_model.dart';

Future<void> initOptimizations() async {
  // ---------------- DATA ----------------
  sl.registerLazySingleton<OptimizationsRemoteDataSource>(
    () => OptimizationsRemoteDataSourceImpl(sl()),
  );

  sl.registerLazySingleton<OptimizationsRepository>(
    () => OptimizationsRepositoryImpl(sl()),
  );

  // ---------------- DOMAIN ----------------
  sl.registerLazySingleton(() => GetOptimizationsByOrderId(sl()));
  sl.registerLazySingleton(() => GetMaterialGroupsByOptimizationId(sl()));
  sl.registerLazySingleton(() => CreateOrderOptimization(sl()));
  sl.registerLazySingleton(() => RunOptimizationMaterialGroup(sl()));

  // ---------------- PRESENTATION ----------------
  sl.registerFactory(
    () => OptimizationsViewModel(
      getOptimizationsByOrderId: sl(),
      getMaterialGroupsByOptimizationId: sl(),
      createOrderOptimization: sl(),
      runOptimizationMaterialGroup: sl(),
    ),
  );
}
