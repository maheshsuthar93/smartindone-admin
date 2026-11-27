import 'package:board_cut/core/core_injection.dart';
import 'package:board_cut/features/customers/domain/usecases/get_customer_analytics.dart';
import 'package:board_cut/features/customers/domain/usecases/get_customer_by_id.dart';
import 'package:board_cut/features/customers/domain/usecases/create_customer.dart';
import 'package:board_cut/features/customers/domain/usecases/update_customer.dart';

import 'data/data_sources/remote/customer_remote_data_source.dart';
import 'data/data_sources/remote/customer_remote_data_source_impl.dart';
import 'data/repositories/customer_repository_impl.dart';
import 'domain/repositories/customer_repository.dart';
import 'domain/usecases/get_customers.dart';
import 'presentation/viewmodels/customers_view_model.dart';
import 'package:board_cut/features/create_customer/presentation/viewmodels/create_customer_view_model.dart';
import 'package:board_cut/features/customer_detail/presentation/viewmodels/customer_detail_view_model.dart';

Future<void> initCustomers() async {
  // ---------------- DATA ----------------
  sl.registerLazySingleton<CustomerRemoteDataSource>(
    () => CustomerRemoteDataSourceImpl(sl()),
  );

  sl.registerLazySingleton<CustomerRepository>(
    () => CustomerRepositoryImpl(sl()),
  );

  // ---------------- DOMAIN ----------------
  sl.registerLazySingleton(() => GetCustomers(sl()));
  sl.registerLazySingleton(() => GetCustomerAnalytics(sl()));
  sl.registerLazySingleton(() => GetCustomerById(sl()));
  sl.registerLazySingleton(() => CreateCustomer(sl()));
  sl.registerLazySingleton(() => UpdateCustomer(sl()));

  // ---------------- PRESENTATION ----------------
  sl.registerFactory(
    () => CustomersViewModel(getCustomers: sl(), getCustomerAnalytics: sl()),
  );
  sl.registerFactory(
    () => CreateCustomerViewModel(
      createCustomer: sl(),
      getCustomerById: sl(),
      updateCustomer: sl(),
    ),
  );
  sl.registerFactory(
    () => CustomerDetailViewModel(getCustomerById: sl(), getProjects: sl()),
  );
}
