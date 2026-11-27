import 'package:board_cut/core/core.dart';
import 'package:fpdart/fpdart.dart';

import '../../domain/repositories/selected_piece_detail_repository.dart';
import '../data_sources/remote/selected_piece_detail_remote_data_source.dart';
import '../model/selected_piece_model.dart';
import '../model/update_status_response_model.dart';

class SelectedPieceDetailRepositoryImpl
    implements SelectedPieceDetailRepository {
  final SelectedPieceDetailRemoteDataSource remoteDataSource;

  SelectedPieceDetailRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, SelectedPieceModel>> getPieceById({
    required String pieceId,
  }) {
    return safeCall(() => remoteDataSource.getPieceById(pieceId: pieceId));
  }

  @override
  Future<Either<Failure, SelectedPieceModel>> getPieceByCode({
    required String pieceCode,
  }) {
    return safeCall(
      () => remoteDataSource.getPieceByCode(pieceCode: pieceCode),
    );
  }

  @override
  Future<Either<Failure, ApiResponse<UpdateStatusResponseModel>>>
  updatePieceProcessStatus({
    required String pieceId,
    required String status,
    required String processTypeId,
  }) {
    return safeCall(
      () => remoteDataSource.updatePieceProcessStatus(
        data: {
          'pieceId': pieceId,
          'status': status,
          'processTypeId': processTypeId,
        },
      ),
    );
  }
}
