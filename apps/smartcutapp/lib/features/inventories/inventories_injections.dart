import 'package:board_cut/core/core_injection.dart';
import 'package:board_cut/features/inventories/data/data_sources/remote/inventory_remote_data_source.dart';
import 'package:board_cut/features/inventories/data/data_sources/remote/inventory_remote_data_source_impl.dart';
import 'package:board_cut/features/inventories/data/repositories/inventory_repository_impl.dart';
import 'package:board_cut/features/inventories/domain/repositories/inventory_repository.dart';
import 'package:board_cut/features/inventories/domain/usecases/get_inventories.dart';
import 'package:board_cut/features/inventories/domain/usecases/get_inventory_analytics.dart';
import 'package:board_cut/features/inventories/domain/usecases/create_inventory_adjustment.dart';
import 'package:board_cut/features/inventories/presentation/viewmodels/inventories_view_model.dart';

Future<void> initInventories() async {
  // ---------------- DATA ----------------
  sl.registerLazySingleton<InventoryRemoteDataSource>(
    () => InventoryRemoteDataSourceImpl(sl()),
  );

  sl.registerLazySingleton<InventoryRepository>(
    () => InventoryRepositoryImpl(sl()),
  );

  // ---------------- DOMAIN ----------------
  sl.registerLazySingleton(() => GetInventories(sl()));
  sl.registerLazySingleton(() => GetInventoryAnalytics(sl()));
  sl.registerLazySingleton(() => CreateInventoryAdjustment(sl()));

  // ---------------- PRESENTATION ----------------
  sl.registerFactory(
    () =>
        InventoriesViewModel(
          getInventories: sl(),
          getInventoryAnalytics: sl(),
          createInventoryAdjustment: sl(),
        ),
  );
}
