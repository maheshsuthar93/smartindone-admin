import 'package:board_cut/core/core.dart';
import 'package:board_cut/features/part_detail/data/model/part_detail_model.dart';

import '../../models/part_material_option.dart';

abstract class CreatePartRemoteDataSource {
  Future<ApiResponse<PartDetailModel>> createPart({
    required Map<String, dynamic> data,
  });

  Future<ApiResponse<PartDetailModel>> updatePart({
    required String partId,
    required Map<String, dynamic> data,
  });

  Future<ApiResponse<List<PartMaterialOption>>> getMaterials();
}
