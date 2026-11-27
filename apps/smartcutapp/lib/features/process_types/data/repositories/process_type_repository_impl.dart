import 'package:board_cut/core/core.dart';
import 'package:fpdart/fpdart.dart';

import '../../domain/repositories/process_type_repository.dart';
import '../data_sources/remote/process_type_remote_data_source.dart';
import '../models/process_type_model.dart';

class ProcessTypeRepositoryImpl implements ProcessTypeRepository {
  ProcessTypeRepositoryImpl(this.remoteDataSource);

  final ProcessTypeRemoteDataSource remoteDataSource;

  @override
  Future<Either<Failure, List<ProcessTypeModel>>> getProcessTypes() =>
      safeCall(remoteDataSource.getProcessTypes);

  @override
  Future<Either<Failure, ApiResponse>> createProcessType({
    required Map<String, dynamic> data,
  }) => safeCall(() => remoteDataSource.createProcessType(data: data));

  @override
  Future<Either<Failure, ApiResponse>> updateProcessType({
    required String processTypeId,
    required Map<String, dynamic> data,
  }) => safeCall(
    () => remoteDataSource.updateProcessType(
      processTypeId: processTypeId,
      data: data,
    ),
  );

  @override
  Future<Either<Failure, ApiResponse>> deleteProcessType({
    required String processTypeId,
  }) => safeCall(
    () => remoteDataSource.deleteProcessType(processTypeId: processTypeId),
  );
}
