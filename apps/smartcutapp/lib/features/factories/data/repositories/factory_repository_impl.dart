import 'package:board_cut/core/core.dart';
import 'package:fpdart/fpdart.dart';

import '../../domain/repositories/factory_repository.dart';
import '../data_sources/remote/factory_remote_data_source.dart';
import '../models/factory_model.dart';

class FactoryRepositoryImpl implements FactoryRepository {
  FactoryRepositoryImpl(this.remoteDataSource);

  final FactoryRemoteDataSource remoteDataSource;

  @override
  Future<Either<Failure, List<FactoryModel>>> getFactories() =>
      safeCall(remoteDataSource.getFactories);

  @override
  Future<Either<Failure, ApiResponse>> createFactory({
    required Map<String, dynamic> data,
  }) => safeCall(() => remoteDataSource.createFactory(data: data));

  @override
  Future<Either<Failure, ApiResponse>> updateFactory({
    required String factoryId,
    required Map<String, dynamic> data,
  }) => safeCall(
    () => remoteDataSource.updateFactory(factoryId: factoryId, data: data),
  );
}
