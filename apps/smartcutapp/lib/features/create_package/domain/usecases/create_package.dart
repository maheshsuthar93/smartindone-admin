import 'package:board_cut/core/core.dart';
import 'package:fpdart/fpdart.dart';

import '../repositories/package_repository.dart';

class CreatePackage {
  CreatePackage(this.repository);
  final PackageRepository repository;

  Future<Either<Failure, bool>> call({required Map<String, dynamic> data}) =>
      repository.createPackage(data: data);
}
