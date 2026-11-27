import 'package:board_cut/core/core.dart';
import 'package:fpdart/fpdart.dart';

import '../../data/models/inventory_transaction_model.dart';

abstract class InventoryTransactionsRepository {
  Future<Either<Failure, PaginatedResult<InventoryTransactionModel>>>
  getTransactions({required int page, required int limit, String? search});
}
