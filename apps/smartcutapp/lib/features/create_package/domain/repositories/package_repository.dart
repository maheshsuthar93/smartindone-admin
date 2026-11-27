import 'package:board_cut/core/core.dart';
import 'package:fpdart/fpdart.dart';

import '../../data/models/package_detail_model.dart';
import '../../data/models/available_package_piece_model.dart';
import '../../data/models/available_package_hardware_model.dart';

abstract class PackageRepository {
  Future<Either<Failure, PackageDetailModel>> getPackage({
    required String packageId,
  });

  Future<Either<Failure, bool>> createPackage({
    required Map<String, dynamic> data,
  });

  Future<Either<Failure, bool>> updatePackage({
    required String packageId,
    required Map<String, dynamic> data,
  });

  Future<Either<Failure, List<AvailablePackagePieceModel>>> getAvailablePieces({
    required String orderId,
  });
  Future<Either<Failure, List<AvailablePackageHardwareModel>>>
  getAvailableHardware({required String warehouseId});
}
