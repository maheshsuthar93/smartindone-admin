import 'package:board_cut/core/core_injection.dart';
import 'package:board_cut/features/create_shipment/domain/usecases/get_drivers_by_comapny_id.dart';

import 'data/data_sources/remote/create_shipment_remote_data_source.dart';
import 'data/data_sources/remote/create_shipment_remote_data_source_impl.dart';
import 'data/repositories/create_shipment_repository_impl.dart';
import 'domain/repositories/create_shipment_repository.dart';
import 'domain/usecases/create_shipment.dart';
import 'domain/usecases/get_orders_by_project_id.dart';
import 'domain/usecases/get_create_shipment_projects.dart';
import 'domain/usecases/update_shipment.dart';
import 'presentation/viewmodels/create_shipment_view_model.dart';

Future<void> initCreateShipment() async {
  // ---------------- DATA ----------------
  sl.registerLazySingleton<CreateShipmentRemoteDataSource>(
    () => CreateShipmentRemoteDataSourceImpl(sl()),
  );

  sl.registerLazySingleton<CreateShipmentRepository>(
    () => CreateShipmentRepositoryImpl(sl()),
  );

  // ---------------- DOMAIN ----------------
  sl.registerLazySingleton(() => CreateShipment(sl()));
  sl.registerLazySingleton(() => GetOrdersByProjectId(sl()));
  sl.registerLazySingleton(() => GetDriversByCompanyId(sl()));
  sl.registerLazySingleton(() => GetCreateShipmentProjects(sl()));
  sl.registerLazySingleton(() => UpdateShipment(sl()));

  // ---------------- PRESENTATION ----------------
  sl.registerFactory(
    () => CreateShipmentViewModel(
      createShipment: sl(),
      getOrdersByProjectId: sl(),
      getDriversByCompanyId: sl(),
      getProjects: sl(),
      getShipmentDetail: sl(),
      updateShipment: sl(),
    ),
  );
}
