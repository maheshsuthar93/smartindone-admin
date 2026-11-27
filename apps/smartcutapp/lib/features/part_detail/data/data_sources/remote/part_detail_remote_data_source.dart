import 'package:board_cut/core/core.dart';

import '../../model/part_detail_model.dart';
import '../../model/part_detail_piece_model.dart';

abstract class PartDetailRemoteDataSource {
  Future<PartDetailModel> getPartById(String id);

  Future<PaginatedResult<PartDetailPieceModel>> getPiecesByPartId({
    required int page,
    required int limit,
    required String partId,
  });

  Future<ApiResponse> generatePiecesByPartId({required String partId});
}
