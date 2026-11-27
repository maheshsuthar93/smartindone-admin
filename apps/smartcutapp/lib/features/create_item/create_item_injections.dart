import 'package:board_cut/core/core_injection.dart';
import 'package:board_cut/features/create_item/data/data_sources/remote/create_item_remote_data_source.dart';
import 'package:board_cut/features/create_item/data/data_sources/remote/create_item_remote_data_source_impl.dart';
import 'package:board_cut/features/create_item/data/repositories/create_item_repository_impl.dart';
import 'package:board_cut/features/create_item/domain/repositories/create_item_repository.dart';
import 'package:board_cut/features/create_item/domain/usecases/create_item.dart';
import 'package:board_cut/features/create_item/domain/usecases/update_item.dart';
import 'package:board_cut/features/create_item/presentation/viewmodels/create_item_view_model.dart';
import 'package:board_cut/features/item_detail/domain/usecases/get_item_by_id.dart';

void initCreateItem() {
  sl.registerLazySingleton<CreateItemRemoteDataSource>(
    () => CreateItemRemoteDataSourceImpl(sl()),
  );
  sl.registerLazySingleton<CreateItemRepository>(
    () => CreateItemRepositoryImpl(sl()),
  );
  sl.registerLazySingleton(() => CreateItem(sl()));
  sl.registerLazySingleton(() => UpdateItem(sl()));
  sl.registerFactory(
    () => CreateItemViewModel(
      createItem: sl(),
      updateItem: sl(),
      getItemById: sl<GetItemById>(),
    ),
  );
}
