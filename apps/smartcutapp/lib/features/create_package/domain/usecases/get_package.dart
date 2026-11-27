import 'package:board_cut/core/core.dart';
import 'package:fpdart/fpdart.dart';

import '../../data/models/package_detail_model.dart';
import '../repositories/package_repository.dart';

class GetPackage {
  GetPackage(this.repository);
  final PackageRepository repository;

  Future<Either<Failure, PackageDetailModel>> call({
    required String packageId,
  }) => repository.getPackage(packageId: packageId);
}
