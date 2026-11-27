import 'package:board_cut/core/core.dart';
import 'package:fpdart/fpdart.dart';

import '../../data/models/available_package_piece_model.dart';
import '../repositories/package_repository.dart';

class GetAvailablePackagePieces {
  GetAvailablePackagePieces(this.repository);
  final PackageRepository repository;

  Future<Either<Failure, List<AvailablePackagePieceModel>>> call({
    required String orderId,
  }) => repository.getAvailablePieces(orderId: orderId);
}
