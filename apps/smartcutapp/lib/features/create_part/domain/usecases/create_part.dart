import 'package:board_cut/core/core.dart';
import 'package:board_cut/features/part_detail/data/model/part_detail_model.dart';
import 'package:fpdart/fpdart.dart';

import '../repositories/create_part_repository.dart';

class CreatePart {
  const CreatePart(this.repository);

  final CreatePartRepository repository;

  Future<Either<Failure, ApiResponse<PartDetailModel>>> call({
    required Map<String, dynamic> data,
  }) => repository.createPart(data: data);
}
