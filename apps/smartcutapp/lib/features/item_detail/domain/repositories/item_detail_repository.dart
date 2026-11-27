import 'package:board_cut/core/core.dart';
import 'package:board_cut/features/item_detail/data/model/order_item_details_model.dart';
import 'package:board_cut/features/item_detail/data/model/model.dart';
import 'package:fpdart/fpdart.dart';

abstract class ItemDetailRepository {
  Future<Either<Failure, OrderItemDetailsModel>> getItemById(String id);

  Future<Either<Failure, PaginatedResult<PartModel>>> getPartsByItemId({
    required int page,
    required int limit,
    required String itemId,
  });

  Future<Either<Failure, ApiResponse>> uploadPartsByItemId({
    required dynamic data,
  });
}
