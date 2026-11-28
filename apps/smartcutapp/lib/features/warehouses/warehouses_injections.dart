import 'package:board_cut/core/core_injection.dart';

import 'data/data_sources/remote/warehouse_remote_data_source.dart';
import 'data/data_sources/remote/warehouse_remote_data_source_impl.dart';
import 'data/repositories/warehouse_repository_impl.dart';
import 'domain/repositories/warehouse_repository.dart';
import 'domain/usecases/get_warehouses.dart';
import 'domain/usecases/get_warehouse_by_id.dart';
import 'domain/usecases/save_warehouse.dart';
import 'presentation/viewmodels/warehouses_view_model.dart'
    show WarehousesViewModel;

Future<void> initWarehouses() async {
  // ---------------- DATA ----------------
  sl.registerLazySingleton<WarehouseRemoteDataSource>(
    () => WarehouseRemoteDataSourceImpl(sl()),
  );

  sl.registerLazySingleton<WarehouseRepository>(
    () => WarehouseRepositoryImpl(sl()),
  );

  // ---------------- DOMAIN ----------------
  sl.registerLazySingleton(() => GetWarehouses(sl()));
  sl.registerLazySingleton(() => GetWarehouseById(sl()));
  sl.registerLazySingleton(() => SaveWarehouse(sl()));

  // ---------------- PRESENTATION ----------------
  sl.registerFactory(() => WarehousesViewModel(getWarehouses: sl()));
}
