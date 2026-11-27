import 'package:board_cut/features/create_shipment/data/models/create_shipment_order_model.dart';
import 'package:board_cut/features/create_shipment/data/models/create_shipment_project_model.dart';
import 'package:board_cut/features/create_shipment/domain/usecases/create_shipment.dart';
import 'package:board_cut/features/create_shipment/domain/usecases/get_create_shipment_projects.dart';
import 'package:board_cut/features/create_shipment/domain/usecases/get_drivers_by_comapny_id.dart';
import 'package:board_cut/features/create_shipment/domain/usecases/get_orders_by_project_id.dart';
import 'package:board_cut/features/create_shipment/domain/usecases/update_shipment.dart';
import 'package:board_cut/features/shipment_detail/data/models/shipment_detail_model.dart';
import 'package:board_cut/features/shipment_detail/domain/usecases/get_shipment_detail.dart';
import 'package:flutter/material.dart';

import '../../data/models/shipment_driver_model.dart';

class CreateShipmentViewModel extends ChangeNotifier {
  final CreateShipment createShipment;
  final GetOrdersByProjectId getOrdersByProjectId;
  final GetDriversByCompanyId getDriversByCompanyId;
  final GetCreateShipmentProjects getProjects;
  final GetShipmentDetail getShipmentDetail;
  final UpdateShipment updateShipment;

  CreateShipmentViewModel({
    required this.createShipment,
    required this.getOrdersByProjectId,
    required this.getDriversByCompanyId,
    required this.getProjects,
    required this.getShipmentDetail,
    required this.updateShipment,
  });

  List<CreateShipmentOrderModel> _orders = [];
  List<CreateShipmentProjectModel> _projects = [];
  List<ShipmentDriverModel> _drivers = [];
  bool _isLoading = false;
  bool _isOrdersLoading = false;
  bool _isDriversLoading = false;
  bool _isProjectsLoading = false;
  bool _isShipmentLoading = false;
  String? _error;
  ShipmentDetailModel? _shipment;

  String? get error => _error;

  List<CreateShipmentOrderModel> get orders => _orders;

  List<CreateShipmentProjectModel> get projects => _projects;

  List<ShipmentDriverModel> get drivers => _drivers;

  bool get isLoading => _isLoading;

  bool get isOrdersLoading => _isOrdersLoading;

  bool get isDriversLoading => _isDriversLoading;

  bool get isProjectsLoading => _isProjectsLoading;

  bool get isShipmentLoading => _isShipmentLoading;

  ShipmentDetailModel? get shipment => _shipment;

  Future<void> fetchShipment({required String shipmentId}) async {
    _isShipmentLoading = true;
    _error = null;
    notifyListeners();

    try {
      final result = await getShipmentDetail(id: shipmentId);
      result.match(
        (failure) => _error = failure.message,
        (shipment) => _shipment = shipment,
      );
    } finally {
      _isShipmentLoading = false;
      notifyListeners();
    }
  }

  Future<void> fetchProjects({required String companyId}) async {
    _isProjectsLoading = true;
    _projects = [];
    _error = null;
    notifyListeners();

    try {
      final result = await getProjects(companyId: companyId);
      result.match(
        (failure) => _error = failure.message,
        (response) => _projects = response,
      );
    } finally {
      _isProjectsLoading = false;
      notifyListeners();
    }
  }

  Future<void> fetchOrders({required String projectId}) async {
    _isOrdersLoading = true;
    _orders = [];
    _error = null;
    notifyListeners();

    try {
      final result = await getOrdersByProjectId(projectId: projectId);
      result.match(
        (failure) => _error = failure.message,
        (response) => _orders = response,
      );
    } finally {
      _isOrdersLoading = false;
      notifyListeners();
    }
  }

  Future<void> fetchDrivers({required String companyId}) async {
    _isDriversLoading = true;
    _drivers = [];
    _error = null;
    notifyListeners();

    try {
      final result = await getDriversByCompanyId(companyId: companyId);
      result.match(
        (failure) => _error = failure.message,
        (response) => _drivers = response,
      );
    } finally {
      _isDriversLoading = false;
      notifyListeners();
    }
  }

  Future<bool> saveShipment({
    String? shipmentId,
    required Map<String, dynamic> data,
  }) async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      final result = shipmentId == null
          ? await createShipment(data: data)
          : await updateShipment(shipmentId: shipmentId, data: data);
      return await result.match(
        (failure) {
          _error = failure.message;
          return false;
        },
        (response) {
          if (!response.success) _error = response.message;
          return response.success;
        },
      );
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  void clearError() {
    _error = null;
  }
}
