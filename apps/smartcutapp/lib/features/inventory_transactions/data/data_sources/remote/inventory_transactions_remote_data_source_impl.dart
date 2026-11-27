import 'package:board_cut/core/core.dart';
import 'package:dio/dio.dart';

import 'inventory_transactions_remote_data_source.dart';
import '../../models/inventory_transaction_model.dart';

class InventoryTransactionsRemoteDataSourceImpl
    implements InventoryTransactionsRemoteDataSource {
  InventoryTransactionsRemoteDataSourceImpl(this.api);

  final ApiClient api;

  @override
  Future<PaginatedResult<InventoryTransactionModel>> getTransactions({
    required int page,
    required int limit,
    String? search,
  }) async {
    try {
      final response = await api.get(
        '/api/inventory-transactions',
        queryParameters: {
          'page': page,
          'limit': limit,
          if (search?.isNotEmpty == true) 'search': search,
        },
      );
      final body = response.data as Map<String, dynamic>;
      if (body['success'] != true) {
        throw Exception(body['message'] ?? 'Could not load transactions');
      }
      final meta = body['pagination'] as Map<String, dynamic>;
      return PaginatedResult(
        items: ((body['data'] as List?) ?? [])
            .map(
              (row) => InventoryTransactionModel.fromJson(
                (row as Map).cast<String, dynamic>(),
              ),
            )
            .toList(),
        page: (meta['page'] as num).toInt(),
        total: (meta['total'] as num).toInt(),
        totalPages: (meta['totalPages'] as num).toInt(),
      );
    } on DioException {
      rethrow;
    }
  }
}
