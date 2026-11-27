import 'package:board_cut/core/core.dart';
import 'package:board_cut/features/part_detail/data/data_sources/remote/part_detail_remote_data_source.dart';
import 'package:fpdart/fpdart.dart';

import '../../domain/repositories/part_detail_repository.dart';
import '../model/part_detail_model.dart';
import '../model/part_detail_piece_model.dart';

class PartDetailRepositoryImpl implements PartDetailRepository {
  final PartDetailRemoteDataSource remoteDataSource;

  PartDetailRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, PartDetailModel>> getPartById(String id) {
    return safeCall(() => remoteDataSource.getPartById(id));
  }

  @override
  Future<Either<Failure, PaginatedResult<PartDetailPieceModel>>>
  getPiecesByPartId({
    required int page,
    required int limit,
    required String partId,
  }) {
    return safeCall(
      () => remoteDataSource.getPiecesByPartId(
        page: page,
        limit: limit,
        partId: partId,
      ),
    );
  }

  @override
  Future<Either<Failure, ApiResponse<dynamic>>> generatePiecesByPartId({
    required String partId,
  }) {
    return safeCall(
      () => remoteDataSource.generatePiecesByPartId(partId: partId),
    );
  }
}
