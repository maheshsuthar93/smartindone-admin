import 'package:board_cut/core/core.dart';
import 'package:board_cut/features/hardwares/data/models/hardware_model.dart';
import 'package:fpdart/fpdart.dart';

import '../repositories/hardware_repository.dart';

class GetHardwares {
  GetHardwares(this.repository);
  final HardwareRepository repository;

  Future<Either<Failure, PaginatedResult<HardwareModel>>> call({
    required int page,
    required int limit,
    String? search,
  }) => repository.getHardwares(page: page, limit: limit, search: search);
}
