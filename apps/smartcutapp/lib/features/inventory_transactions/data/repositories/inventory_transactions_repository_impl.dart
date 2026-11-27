import 'package:board_cut/core/core.dart';
import 'package:fpdart/fpdart.dart';

import '../../domain/repositories/inventory_transactions_repository.dart';
import '../data_sources/remote/inventory_transactions_remote_data_source.dart';
import '../models/inventory_transaction_model.dart';

class InventoryTransactionsRepositoryImpl
    implements InventoryTransactionsRepository {
  InventoryTransactionsRepositoryImpl(this.remote);

  final InventoryTransactionsRemoteDataSource remote;

  @override
  Future<Either<Failure, PaginatedResult<InventoryTransactionModel>>>
  getTransactions({required int page, required int limit, String? search}) =>
      safeCall(
        () => remote.getTransactions(page: page, limit: limit, search: search),
      );
}
