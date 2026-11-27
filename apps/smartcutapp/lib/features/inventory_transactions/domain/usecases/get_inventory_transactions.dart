import 'package:board_cut/core/core.dart';
import 'package:fpdart/fpdart.dart';

import '../repositories/inventory_transactions_repository.dart';
import '../../data/models/inventory_transaction_model.dart';

class GetInventoryTransactions {
  GetInventoryTransactions(this.repo);

  final InventoryTransactionsRepository repo;

  Future<Either<Failure, PaginatedResult<InventoryTransactionModel>>> call({
    required int page,
    required int limit,
    String? search,
  }) => repo.getTransactions(page: page, limit: limit, search: search);
}
