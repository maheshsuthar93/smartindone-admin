import 'package:board_cut/core/core.dart';
import 'package:fpdart/fpdart.dart';

import '../../data/model/part_detail_model.dart';
import '../../data/model/part_detail_piece_model.dart';

abstract class PartDetailRepository {
  Future<Either<Failure, PartDetailModel>> getPartById(String id);

  Future<Either<Failure, PaginatedResult<PartDetailPieceModel>>>
  getPiecesByPartId({
    required int page,
    required int limit,
    required String partId,
  });

  Future<Either<Failure, ApiResponse>> generatePiecesByPartId({
    required String partId,
  });
}
