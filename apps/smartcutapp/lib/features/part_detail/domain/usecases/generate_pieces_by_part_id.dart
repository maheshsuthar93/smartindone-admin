import 'package:board_cut/core/core.dart';
import 'package:fpdart/fpdart.dart';

import '../repositories/part_detail_repository.dart';

class GeneratePiecesByPartId {
  final PartDetailRepository repository;

  GeneratePiecesByPartId(this.repository);

  Future<Either<Failure, ApiResponse>> call({required String partId}) async {
    return repository.generatePiecesByPartId(partId: partId);
  }
}
