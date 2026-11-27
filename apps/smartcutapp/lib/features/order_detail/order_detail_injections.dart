import 'package:board_cut/core/core_injection.dart';
import 'package:board_cut/features/order_detail/domain/usecases/get_items_by_order_id.dart';
import 'package:board_cut/features/order_detail/domain/usecases/get_order_by_id.dart';
import 'package:board_cut/features/order_detail/presentation/viewmodels/order_detail_view_model.dart';

import 'data/data_sources/remote/order_detail_remote_data_source.dart';
import 'data/data_sources/remote/order_detail_remote_data_source_impl.dart';
import 'data/repositories/order_detail_repository_impl.dart';
import 'domain/repositories/order_detail_repository.dart';
import 'domain/usecases/generate_pieces_for_order.dart';
import 'domain/usecases/upload_items_by_order_id.dart';

Future<void> initOrderDetail() async {
  // ---------------- DATA ----------------
  sl.registerLazySingleton<OrderDetailRemoteDataSource>(
    () => OrderDetailRemoteDataSourceImpl(sl()),
  );

  sl.registerLazySingleton<OrderDetailRepository>(
    () => OrderDetailRepositoryImpl(sl()),
  );

  // ---------------- DOMAIN ----------------
  sl.registerLazySingleton(() => GetOrderById(sl()));
  sl.registerLazySingleton(() => GetItemsByOrderId(sl()));
  sl.registerLazySingleton(() => GeneratePiecesForOrder(sl()));
  sl.registerLazySingleton(() => UploadItemsByOrderId(sl()));

  // ---------------- PRESENTATION ----------------
  sl.registerFactory(
    () => OrderDetailViewModel(
      getOrderById: sl(),
      getItemsByOrderId: sl(),
      generatePiecesForOrder: sl(),
      uploadItemsByOrderId: sl(),
    ),
  );
}
