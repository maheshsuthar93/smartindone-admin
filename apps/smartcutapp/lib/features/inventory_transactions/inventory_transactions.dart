export 'inventory_transactions_view_model.dart';
export 'presentation/inventory_transactions_page.dart';

import 'package:board_cut/core/core_injection.dart';

import 'data/data_sources/remote/inventory_transactions_remote_data_source.dart';
import 'data/data_sources/remote/inventory_transactions_remote_data_source_impl.dart';
import 'data/repositories/inventory_transactions_repository_impl.dart';
import 'domain/repositories/inventory_transactions_repository.dart';
import 'domain/usecases/get_inventory_transactions.dart';
import 'inventory_transactions_view_model.dart';

void initInventoryTransactions() {
  sl.registerLazySingleton<InventoryTransactionsRemoteDataSource>(
    () => InventoryTransactionsRemoteDataSourceImpl(sl()),
  );
  sl.registerLazySingleton<InventoryTransactionsRepository>(
    () => InventoryTransactionsRepositoryImpl(sl()),
  );
  sl.registerLazySingleton(() => GetInventoryTransactions(sl()));
  sl.registerFactory(() => InventoryTransactionsViewModel(sl()));
}
