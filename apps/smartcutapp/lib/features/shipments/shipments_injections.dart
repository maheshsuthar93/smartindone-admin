import 'package:board_cut/core/core_injection.dart';
import 'package:board_cut/features/shipments/domain/usecases/get_shipments.dart';
import 'package:board_cut/features/shipments/presentation/viewmodels/shipments_view_model.dart';

import 'data/data_sources/remote/shipment_remote_data_source.dart';
import 'data/data_sources/remote/shipment_remote_data_source_impl.dart';
import 'data/repositories/shipment_repository_impl.dart';
import 'domain/repositories/shipment_repository.dart';

Future<void> initShipments() async {
  // ---------------- DATA ----------------
  sl.registerLazySingleton<ShipmentRemoteDataSource>(
    () => ShipmentRemoteDataSourceImpl(sl()),
  );

  sl.registerLazySingleton<ShipmentRepository>(
    () => ShipmentRepositoryImpl(sl()),
  );

  // ---------------- DOMAIN ----------------
  sl.registerLazySingleton(() => GetShipments(sl()));

  // ---------------- PRESENTATION ----------------
  sl.registerFactory(() => ShipmentsViewModel(getShipments: sl()));
}
