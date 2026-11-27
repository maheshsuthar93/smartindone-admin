import 'package:board_cut/core/core.dart';
import 'package:board_cut/features/item_detail/data/model/model.dart';
import 'package:fpdart/fpdart.dart';

import '../repositories/item_detail_repository.dart';

class GetPartsByItemId {
  final ItemDetailRepository repository;

  GetPartsByItemId(this.repository);

  Future<Either<Failure, PaginatedResult<PartModel>>> call({
    required String itemId,
    required int page,
    required int limit,
  }) async {
    return repository.getPartsByItemId(
      limit: limit,
      page: page,
      itemId: itemId,
    );
  }
}
