import 'package:board_cut/core/core.dart';
import 'package:board_cut/features/item_detail/data/model/order_item_details_model.dart';
import 'package:fpdart/fpdart.dart';

import '../../domain/repositories/create_item_repository.dart';
import '../data_sources/remote/create_item_remote_data_source.dart';

class CreateItemRepositoryImpl implements CreateItemRepository {
  CreateItemRepositoryImpl(this.remoteDataSource);

  final CreateItemRemoteDataSource remoteDataSource;

  @override
  Future<Either<Failure, ApiResponse<OrderItemDetailsModel>>> createItem({
    required Map<String, dynamic> data,
  }) => safeCall(() => remoteDataSource.createItem(data: data));

  @override
  Future<Either<Failure, ApiResponse<OrderItemDetailsModel>>> updateItem({
    required String itemId,
    required Map<String, dynamic> data,
  }) => safeCall(() => remoteDataSource.updateItem(itemId: itemId, data: data));
}
