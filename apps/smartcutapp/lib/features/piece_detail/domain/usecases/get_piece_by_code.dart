import 'package:board_cut/core/core.dart';
import 'package:fpdart/fpdart.dart';

import '../../data/model/selected_piece_model.dart';
import '../repositories/selected_piece_detail_repository.dart';

class GetPieceByCode {
  final SelectedPieceDetailRepository repository;

  GetPieceByCode(this.repository);

  Future<Either<Failure, SelectedPieceModel>> call({
    required String pieceCode,
  }) {
    return repository.getPieceByCode(pieceCode: pieceCode);
  }
}
