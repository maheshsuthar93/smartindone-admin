import 'package:flutter/material.dart';

import '../../../projects/data/models/project_detail_model.dart';
import '../../../projects/domain/usecases/get_project_by_id.dart';
import '../../../orders/data/models/order_model.dart';
import '../../../orders/domain/usecases/get_orders.dart';

class ProjectDetailViewModel extends ChangeNotifier {
  final GetProjectById getProjectById;
  final GetOrders getOrders;

  ProjectDetailViewModel({
    required this.getProjectById,
    required this.getOrders,
  });

  ProjectDetailModel? _project;
  bool _isLoading = false;
  String? _error;
  List<OrderModel> _orders = [];

  ProjectDetailModel? get project => _project;

  bool get isLoading => _isLoading;

  String? get error => _error;
  List<OrderModel> get orders => _orders;

  Future<void> fetchProject(String projectId) async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    final projectResult = await getProjectById(projectId: projectId);
    projectResult.match(
      (failure) => _error = failure.message,
      (project) => _project = project,
    );

    final firstPage = await getOrders(page: 1, limit: 100);
    var totalPages = 1;
    final allOrders = <OrderModel>[];
    firstPage.match((failure) => _error ??= failure.message, (response) {
      allOrders.addAll(response.items);
      totalPages = response.totalPages;
    });
    for (var page = 2; page <= totalPages; page++) {
      final pageResult = await getOrders(page: page, limit: 100);
      pageResult.match(
        (failure) => _error ??= failure.message,
        (response) => allOrders.addAll(response.items),
      );
    }
    _orders = allOrders.where((order) => order.projectId == projectId).toList();

    _isLoading = false;
    notifyListeners();
  }

  void clearError() {
    _error = null;
    notifyListeners();
  }
}
