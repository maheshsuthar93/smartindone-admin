import 'package:board_cut/core/core_injection.dart';
import 'package:board_cut/features/dashboard/data/data_sources/remote/dashboard_remote_data_source.dart';
import 'package:board_cut/features/dashboard/domain/repositories/dashboard_repository.dart';
import 'package:board_cut/features/dashboard/domain/usecases/get_dashboard_analytics.dart';
import 'package:board_cut/features/dashboard/domain/usecases/get_dashboard_orders.dart';
import 'package:board_cut/features/dashboard/presentation/viewmodels/dashboard_view_model.dart';

import 'data/data_sources/remote/dashboard_remote_data_source_impl.dart';
import 'data/repositories/dashboard_repository_impl.dart';

Future<void> initDashboard() async {
  // ---------------- DATA ----------------
  sl.registerLazySingleton<DashboardRemoteDataSource>(
    () => DashboardRemoteDataSourceImpl(sl()),
  );

  sl.registerLazySingleton<DashboardRepository>(
    () => DashboardRepositoryImpl(sl()),
  );

  // ---------------- DOMAIN ----------------
  sl.registerLazySingleton(() => GetDashboardAnalytics(sl()));
  sl.registerLazySingleton(() => GetDashboardOrders(sl()));

  // ---------------- PRESENTATION ----------------
  sl.registerFactory(
    () => DashboardViewModel(
      getDashboardAnalytics: sl(),
      getDashboardOrders: sl(),
    ),
  );
}
