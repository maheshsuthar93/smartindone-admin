import 'package:board_cut/core/core_injection.dart';

import 'data/data_sources/remote/shipment_detail_remote_data_source.dart';
import 'data/data_sources/remote/shipment_detail_remote_data_source_impl.dart';
import 'data/repositories/shipment_detail_repository_impl.dart';
import 'domain/repositories/shipment_detail_repository.dart';
import 'domain/usecases/get_shipment_detail.dart';
import 'domain/usecases/get_shipment_packages.dart';
import 'presentation/viewmodels/shipment_detail_view_model.dart';

Future<void> initShipmentDetail() async {
  // ---------------- DATA ----------------
  sl.registerLazySingleton<ShipmentDetailRemoteDataSource>(
    () => ShipmentDetailRemoteDataSourceImpl(sl()),
  );

  sl.registerLazySingleton<ShipmentDetailRepository>(
    () => ShipmentDetailRepositoryImpl(sl()),
  );

  // ---------------- DOMAIN ----------------
  sl.registerLazySingleton(() => GetShipmentDetail(sl()));
  sl.registerLazySingleton(() => GetShipmentPackages(sl()));

  // ---------------- PRESENTATION ----------------
  sl.registerFactory(
    () => ShipmentDetailViewModel(
      getShipmentDetail: sl(),
      getShipmentPackages: sl(),
    ),
  );
}
