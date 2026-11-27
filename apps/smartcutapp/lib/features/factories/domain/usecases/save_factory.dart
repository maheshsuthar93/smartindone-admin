import 'package:board_cut/core/core.dart';
import 'package:fpdart/fpdart.dart';

import '../repositories/factory_repository.dart';

class SaveFactory {
  const SaveFactory(this.repository);

  final FactoryRepository repository;

  Future<Either<Failure, ApiResponse>> create({
    required Map<String, dynamic> data,
  }) => repository.createFactory(data: data);

  Future<Either<Failure, ApiResponse>> update({
    required String factoryId,
    required Map<String, dynamic> data,
  }) => repository.updateFactory(factoryId: factoryId, data: data);
}
