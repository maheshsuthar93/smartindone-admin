import '../../models/package_detail_model.dart';
import '../../models/available_package_piece_model.dart';
import '../../models/available_package_hardware_model.dart';

abstract class PackageRemoteDataSource {
  Future<PackageDetailModel> getPackage({required String packageId});
  Future<bool> createPackage({required Map<String, dynamic> data});
  Future<bool> updatePackage({
    required String packageId,
    required Map<String, dynamic> data,
  });
  Future<List<AvailablePackagePieceModel>> getAvailablePieces({
    required String orderId,
  });
  Future<List<AvailablePackageHardwareModel>> getAvailableHardware({
    required String warehouseId,
  });
}
