import 'package:board_cut/core/core.dart';

import '../../models/process_type_model.dart';

abstract class ProcessTypeRemoteDataSource {
  Future<List<ProcessTypeModel>> getProcessTypes();

  Future<ApiResponse> createProcessType({required Map<String, dynamic> data});

  Future<ApiResponse> updateProcessType({
    required String processTypeId,
    required Map<String, dynamic> data,
  });

  Future<ApiResponse> deleteProcessType({required String processTypeId});
}
