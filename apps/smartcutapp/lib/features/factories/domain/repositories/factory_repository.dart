import 'package:board_cut/core/core.dart';
import 'package:fpdart/fpdart.dart';

import '../../data/models/factory_model.dart';

abstract class FactoryRepository {
  Future<Either<Failure, List<FactoryModel>>> getFactories();

  Future<Either<Failure, ApiResponse>> createFactory({
    required Map<String, dynamic> data,
  });

  Future<Either<Failure, ApiResponse>> updateFactory({
    required String factoryId,
    required Map<String, dynamic> data,
  });
}
