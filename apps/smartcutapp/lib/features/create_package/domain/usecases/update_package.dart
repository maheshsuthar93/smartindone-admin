import 'package:board_cut/core/core.dart';
import 'package:fpdart/fpdart.dart';

import '../repositories/package_repository.dart';

class UpdatePackage {
  UpdatePackage(this.repository);
  final PackageRepository repository;

  Future<Either<Failure, bool>> call({
    required String packageId,
    required Map<String, dynamic> data,
  }) => repository.updatePackage(packageId: packageId, data: data);
}
