import 'package:board_cut/core/core.dart';
import 'package:fpdart/fpdart.dart';

import '../../data/model/part_detail_piece_model.dart';
import '../repositories/part_detail_repository.dart';

class GetPiecesByPartId {
  final PartDetailRepository repository;

  GetPiecesByPartId(this.repository);

  Future<Either<Failure, PaginatedResult<PartDetailPieceModel>>> call({
    required String partId,
    required int page,
    required int limit,
  }) async {
    return repository.getPiecesByPartId(
      limit: limit,
      page: page,
      partId: partId,
    );
  }
}
