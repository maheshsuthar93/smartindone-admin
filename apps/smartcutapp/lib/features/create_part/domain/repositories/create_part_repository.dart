import 'package:board_cut/core/core.dart';
import 'package:board_cut/features/part_detail/data/model/part_detail_model.dart';
import 'package:fpdart/fpdart.dart';

import '../../data/models/part_material_option.dart';

abstract class CreatePartRepository {
  Future<Either<Failure, ApiResponse<PartDetailModel>>> createPart({
    required Map<String, dynamic> data,
  });

  Future<Either<Failure, ApiResponse<PartDetailModel>>> updatePart({
    required String partId,
    required Map<String, dynamic> data,
  });

  Future<Either<Failure, ApiResponse<List<PartMaterialOption>>>> getMaterials();
}
