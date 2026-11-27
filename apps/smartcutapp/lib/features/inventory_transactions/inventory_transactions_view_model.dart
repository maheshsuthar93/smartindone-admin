import 'package:flutter/foundation.dart';

import 'domain/usecases/get_inventory_transactions.dart';
import 'data/models/inventory_transaction_model.dart';

class InventoryTransactionsViewModel extends ChangeNotifier {
  InventoryTransactionsViewModel(this.getTransactions);

  final GetInventoryTransactions getTransactions;
  List<InventoryTransactionModel> transactions = [];
  int page = 1, limit = 10, total = 0, totalPages = 0;
  String search = '';
  bool isLoading = false;
  String? error;

  Future<void> load({int page = 1, String? search}) async {
    isLoading = true;
    error = null;
    notifyListeners();
    try {
      this.page = page;
      if (search != null) this.search = search;
      final result = await getTransactions(
        page: this.page,
        limit: limit,
        search: this.search.isEmpty ? null : this.search,
      );
      result.match((failure) => error = failure.message, (data) {
        transactions = data.items;
        this.page = data.page;
        total = data.total;
        totalPages = data.totalPages;
      });
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
