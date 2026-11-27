import 'package:board_cut/core/core_injection.dart';
import 'package:board_cut/features/item_detail/data/data_sources/remote/item_detail_remote_data_source.dart';
import 'package:board_cut/features/item_detail/domain/usecases/get_item_by_id.dart';
import 'package:board_cut/features/item_detail/domain/usecases/get_parts_by_item_id.dart';

import 'data/data_sources/remote/item_detail_remote_data_source_impl.dart';
import 'data/repositories/item_detail_repository_impl.dart';
import 'domain/repositories/item_detail_repository.dart';
import 'domain/usecases/upload_parts_by_item_id.dart';
import 'presentation/viewmodels/item_detail_view_model.dart';

Future<void> initItemDetail() async {
  // ---------------- DATA ----------------
  sl.registerLazySingleton<ItemDetailRemoteDataSource>(
    () => ItemDetailRemoteDataSourceImpl(sl()),
  );

  sl.registerLazySingleton<ItemDetailRepository>(
    () => ItemDetailRepositoryImpl(sl()),
  );

  // ---------------- DOMAIN ----------------
  sl.registerLazySingleton(() => GetItemById(sl()));
  sl.registerLazySingleton(() => GetPartsByItemId(sl()));
  sl.registerLazySingleton(() => UploadPartsByItemId(sl()));

  // ---------------- PRESENTATION ----------------
  sl.registerFactory(
    () => ItemDetailViewModel(
      getItemById: sl(),
      getPartsByItemId: sl(),
      uploadPartsByItemId: sl(),
    ),
  );
}
