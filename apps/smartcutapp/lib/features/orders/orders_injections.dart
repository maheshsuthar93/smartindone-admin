import 'package:board_cut/core/core_injection.dart';
import 'package:board_cut/features/orders/domain/usecases/get_order_analytics.dart';
import 'package:board_cut/features/orders/domain/usecases/get_orders.dart';
import 'package:board_cut/features/orders/domain/usecases/get_order_for_update.dart';
import 'package:board_cut/features/orders/domain/usecases/create_order.dart';
import 'package:board_cut/features/orders/domain/usecases/update_order.dart';

import 'data/data_sources/remote/order_remote_data_source.dart';
import 'data/data_sources/remote/order_remote_data_source_impl.dart';
import 'data/repositories/order_repository_impl.dart';
import 'domain/repositories/order_repository.dart';
import 'presentation/viewmodels/orders_view_model.dart';

Future<void> initOrders() async {
  // ---------------- DATA ----------------
  sl.registerLazySingleton<OrderRemoteDataSource>(
    () => OrderRemoteDataSourceImpl(sl()),
  );

  sl.registerLazySingleton<OrderRepository>(() => OrderRepositoryImpl(sl()));

  // ---------------- DOMAIN ----------------
  sl.registerLazySingleton(() => GetOrders(sl()));
  sl.registerLazySingleton(() => GetOrderAnalytics(sl()));
  sl.registerLazySingleton(() => GetOrderForUpdate(sl()));
  sl.registerLazySingleton(() => UpdateOrder(sl()));
  sl.registerLazySingleton(() => CreateOrder(sl()));

  // ---------------- PRESENTATION ----------------
  sl.registerFactory(
    () => OrdersViewModel(
      getOrders: sl(),
      getOrderAnalytics: sl(),
      updateOrder: sl(),
    ),
  );
}
