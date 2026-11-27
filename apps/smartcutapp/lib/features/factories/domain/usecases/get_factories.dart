import 'package:board_cut/core/core.dart';
import 'package:fpdart/fpdart.dart';

import '../../data/models/factory_model.dart';
import '../repositories/factory_repository.dart';

class GetFactories {
  const GetFactories(this.repository);

  final FactoryRepository repository;

  Future<Either<Failure, List<FactoryModel>>> call() =>
      repository.getFactories();
}
