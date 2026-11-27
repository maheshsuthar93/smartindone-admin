import 'package:board_cut/core/core.dart';

import '../../models/inventory_transaction_model.dart';

abstract class InventoryTransactionsRemoteDataSource {
  Future<PaginatedResult<InventoryTransactionModel>> getTransactions({
    required int page,
    required int limit,
    String? search,
  });
}
