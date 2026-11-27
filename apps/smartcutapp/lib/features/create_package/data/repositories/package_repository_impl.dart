import 'package:board_cut/core/core.dart';
import 'package:fpdart/fpdart.dart';

import '../../domain/repositories/package_repository.dart';
import '../data_sources/remote/package_remote_data_source.dart';
import '../models/package_detail_model.dart';
import '../models/available_package_piece_model.dart';
import '../models/available_package_hardware_model.dart';

class PackageRepositoryImpl implements PackageRepository {
  PackageRepositoryImpl(this.remoteDataSource);

  final PackageRemoteDataSource remoteDataSource;

  @override
  Future<Either<Failure, PackageDetailModel>> getPackage({
    required String packageId,
  }) => safeCall(() => remoteDataSource.getPackage(packageId: packageId));

  @override
  Future<Either<Failure, bool>> createPackage({
    required Map<String, dynamic> data,
  }) => safeCall(() => remoteDataSource.createPackage(data: data));

  @override
  Future<Either<Failure, bool>> updatePackage({
    required String packageId,
    required Map<String, dynamic> data,
  }) => safeCall(
    () => remoteDataSource.updatePackage(packageId: packageId, data: data),
  );

  @override
  Future<Either<Failure, List<AvailablePackagePieceModel>>> getAvailablePieces({
    required String orderId,
  }) => safeCall(() => remoteDataSource.getAvailablePieces(orderId: orderId));

  @override
  Future<Either<Failure, List<AvailablePackageHardwareModel>>>
  getAvailableHardware({required String warehouseId}) => safeCall(
    () => remoteDataSource.getAvailableHardware(warehouseId: warehouseId),
  );
}
