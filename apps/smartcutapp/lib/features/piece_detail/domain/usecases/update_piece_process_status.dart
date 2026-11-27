import 'package:board_cut/core/core.dart';
import 'package:fpdart/fpdart.dart';

import '../repositories/selected_piece_detail_repository.dart';

class UpdatePieceProcessStatus {
  final SelectedPieceDetailRepository repository;

  UpdatePieceProcessStatus(this.repository);

  Future<Either<Failure, ApiResponse>> call({
    required Map<String, dynamic> data,
  }) async {
    return repository.updatePieceProcessStatus(
      pieceId: data['pieceId'],
      status: data['status'],
      processTypeId: data['processTypeId'],
    );
  }
}
