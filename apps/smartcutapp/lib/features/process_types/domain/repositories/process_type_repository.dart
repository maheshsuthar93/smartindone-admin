import 'package:board_cut/core/core.dart';
import 'package:fpdart/fpdart.dart';

import '../../data/models/process_type_model.dart';

abstract class ProcessTypeRepository {
  Future<Either<Failure, List<ProcessTypeModel>>> getProcessTypes();

  Future<Either<Failure, ApiResponse>> createProcessType({
    required Map<String, dynamic> data,
  });

  Future<Either<Failure, ApiResponse>> updateProcessType({
    required String processTypeId,
    required Map<String, dynamic> data,
  });

  Future<Either<Failure, ApiResponse>> deleteProcessType({
    required String processTypeId,
  });
}
