import 'package:board_cut/core/core.dart';
import 'package:board_cut/features/part_detail/data/model/part_detail_model.dart';
import 'package:fpdart/fpdart.dart';

import '../repositories/create_part_repository.dart';

class UpdatePart {
  const UpdatePart(this.repository);

  final CreatePartRepository repository;

  Future<Either<Failure, ApiResponse<PartDetailModel>>> call({
    required String partId,
    required Map<String, dynamic> data,
  }) => repository.updatePart(partId: partId, data: data);
}
