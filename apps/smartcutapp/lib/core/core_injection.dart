import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'network/api_client.dart';
import 'network/dio_client.dart';
import 'network/interceptors/auth_interceptor.dart';

final sl = GetIt.instance;

Future<void> initCore() async {
  sl.registerLazySingleton<FlutterSecureStorage>(
    () => const FlutterSecureStorage(),
  );
  sl.registerLazySingleton<AuthInterceptor>(() => AuthInterceptor(sl()));
  sl.registerLazySingleton<DioClient>(() => DioClient(sl()));

  sl.registerLazySingleton<Dio>(() => sl<DioClient>().dio);

  sl.registerLazySingleton<ApiClient>(() => ApiClient(sl()));

  await sl<AuthInterceptor>().restoreToken();
}
