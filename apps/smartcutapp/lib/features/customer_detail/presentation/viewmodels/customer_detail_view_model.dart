import 'package:board_cut/features/customers/data/models/customer_model.dart';
import 'package:board_cut/features/customers/domain/usecases/get_customer_by_id.dart';
import 'package:board_cut/features/projects/data/models/project_model.dart';
import 'package:board_cut/features/projects/domain/usecases/get_projects.dart';
import 'package:flutter/foundation.dart';

class CustomerDetailViewModel extends ChangeNotifier {
  CustomerDetailViewModel({
    required this.getCustomerById,
    required this.getProjects,
  });

  final GetCustomerById getCustomerById;
  final GetProjects getProjects;

  CustomerModel? customer;
  List<ProjectModel> projects = [];
  String? customerError;
  String? projectsError;
  bool isLoading = false;

  Future<void> load(String customerId) async {
    isLoading = true;
    customerError = null;
    projectsError = null;
    notifyListeners();
    try {
      final customerResult = await getCustomerById(customerId: customerId);
      customerResult.match(
        (failure) => customerError = failure.message,
        (value) => customer = value,
      );
      final loadedCustomer = customer;
      if (loadedCustomer == null) return;
      final projectsResult = await getProjects(
        page: 1,
        limit: 100,
        customerId: loadedCustomer.id,
      );
      projectsResult.match(
        (failure) => projectsError = failure.message,
        (result) => projects = result.items,
      );
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
