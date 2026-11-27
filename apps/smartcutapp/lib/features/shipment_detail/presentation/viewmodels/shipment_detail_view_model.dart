import 'package:board_cut/features/shipment_detail/domain/usecases/get_shipment_detail.dart';
import 'package:board_cut/features/shipment_detail/domain/usecases/get_shipment_packages.dart';
import 'package:flutter/material.dart';

import '../../data/models/shipment_detail_model.dart';
import '../../data/models/shipment_package_model.dart';

class ShipmentDetailViewModel extends ChangeNotifier {
  ShipmentDetailViewModel({
    required this.getShipmentDetail,
    required this.getShipmentPackages,
  });

  final GetShipmentDetail getShipmentDetail;
  final GetShipmentPackages getShipmentPackages;

  bool _isLoading = false;
  String? _error;
  ShipmentDetailModel? shipment;
  List<ShipmentPackageModel> _shipmentPackages = [];

  List<ShipmentPackageModel> get shipmentPackages => _shipmentPackages;

  late String shipmentId;

  bool get isLoading => _isLoading;

  String? get error => _error;

  Future<void> fetchShipmentDetail() async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    final result = await getShipmentDetail(id: shipmentId);

    result.match((failure) => _error = failure.message, (response) {
      shipment = response;
    });

    if (_error == null) {
      final packageResult = await getShipmentPackages(shipmentId: shipmentId);
      packageResult.match(
        (failure) => _error = failure.message,
        (packages) => _shipmentPackages = packages,
      );
    }

    _isLoading = false;
    notifyListeners();
  }

  void clearError() {
    _error = null;
  }
}
