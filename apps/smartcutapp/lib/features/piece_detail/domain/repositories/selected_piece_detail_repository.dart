import 'package:board_cut/core/core.dart';
import 'package:fpdart/fpdart.dart';

import '../../data/model/selected_piece_model.dart';
import '../../data/model/update_status_response_model.dart';

abstract class SelectedPieceDetailRepository {
  Future<Either<Failure, SelectedPieceModel>> getPieceById({
    required String pieceId,
  });

  Future<Either<Failure, SelectedPieceModel>> getPieceByCode({
    required String pieceCode,
  });

  Future<Either<Failure, ApiResponse<UpdateStatusResponseModel>>>
  updatePieceProcessStatus({
    required String pieceId,
    required String status,
    required String processTypeId,
  });
}
