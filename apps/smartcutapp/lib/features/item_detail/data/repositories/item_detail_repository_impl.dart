import 'package:board_cut/core/core.dart';
import 'package:board_cut/features/item_detail/data/data_sources/remote/item_detail_remote_data_source.dart';
import 'package:board_cut/features/item_detail/data/model/order_item_details_model.dart';
import 'package:board_cut/features/item_detail/data/model/part_model.dart';
import 'package:fpdart/fpdart.dart';

import '../../domain/repositories/item_detail_repository.dart';

class ItemDetailRepositoryImpl implements ItemDetailRepository {
  final ItemDetailRemoteDataSource remoteDataSource;

  ItemDetailRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, OrderItemDetailsModel>> getItemById(String id) {
    return safeCall(() => remoteDataSource.getItemById(id));
  }

  @override
  Future<Either<Failure, PaginatedResult<PartModel>>> getPartsByItemId({
    required int page,
    required int limit,
    required String itemId,
  }) {
    return safeCall(
      () => remoteDataSource.getPartsByItemId(
        page: page,
        limit: limit,
        itemId: itemId,
      ),
    );
  }

  @override
  Future<Either<Failure, ApiResponse>> uploadPartsByItemId({
    required dynamic data,
  }) {
    return safeCall(() => remoteDataSource.uploadPartsByItemId(data: data));
  }
}
