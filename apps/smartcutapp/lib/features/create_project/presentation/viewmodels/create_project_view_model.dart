import 'package:flutter/material.dart';

import '../../../customers/data/models/customer_model.dart';
import '../../../customers/domain/usecases/get_customers.dart';
import '../../../projects/data/models/project_detail_model.dart';
import '../../../projects/domain/usecases/create_project.dart';
import '../../../projects/domain/usecases/get_project_by_id.dart';
import '../../../projects/domain/usecases/update_project.dart';

class CreateProjectViewModel extends ChangeNotifier {
  CreateProjectViewModel({
    required this.getCustomers,
    required this.getProjectById,
    required this.createProject,
    required this.updateProject,
  });

  final GetCustomers getCustomers;
  final GetProjectById getProjectById;
  final CreateProject createProject;
  final UpdateProject updateProject;

  List<CustomerModel> _customers = [];
  ProjectDetailModel? _project;
  CustomerModel? _selectedCustomer;
  bool _isLoading = false;
  bool _isSaving = false;
  String? _error;
  String? _loadError;
  bool _isDisposed = false;

  List<CustomerModel> get customers => _customers;

  ProjectDetailModel? get project => _project;

  CustomerModel? get selectedCustomer => _selectedCustomer;

  bool get isLoading => _isLoading;

  bool get isSaving => _isSaving;

  String? get error => _error;

  String? get loadError => _loadError;

  Future<void> load({String? projectId, String? customerId}) async {
    _isLoading = true;
    _error = null;
    _loadError = null;
    _notifyListeners();

    try {
      final customersResult = await getCustomers(page: 1, limit: 100);
      customersResult.match((failure) {
        _error = failure.message;
        _loadError = failure.message;
      }, (response) => _customers = response.items);

      if (projectId != null) {
        final projectResult = await getProjectById(projectId: projectId);
        projectResult.match(
          (failure) {
            _error = failure.message;
            _loadError = failure.message;
          },
          (project) {
            _project = project;
            _selectedCustomer = _findCustomer(project.customerId);
            if (_selectedCustomer == null && project.customer != null) {
              _selectedCustomer = CustomerModel(
                id: project.customer!.id,
                name: project.customer!.name,
                phone: project.customer!.phone,
                email: project.customer!.email,
              );
              _customers = [..._customers, _selectedCustomer!];
            }
          },
        );
      } else if (customerId != null) {
        _selectedCustomer = _findCustomer(customerId);
      }
    } catch (error) {
      _error = _errorMessage(error);
      _loadError = _error;
    } finally {
      _isLoading = false;
      _notifyListeners();
    }
  }

  CustomerModel? _findCustomer(String customerId) {
    for (final customer in _customers) {
      if (customer.id == customerId) return customer;
    }
    return null;
  }

  void selectCustomer(CustomerModel customer) {
    _selectedCustomer = customer;
    _notifyListeners();
  }

  void clearCustomerSelection() {
    _selectedCustomer = null;
  }

  Future<bool> save({
    required String? projectId,
    required String customerId,
    required Map<String, dynamic> data,
  }) async {
    _isSaving = true;
    _error = null;
    _notifyListeners();
    try {
      final result = projectId == null
          ? await createProject(customerId: customerId, data: data)
          : await updateProject(projectId: projectId, data: data);
      return await result.match(
        (failure) {
          _error = failure.message;
          return false;
        },
        (saved) {
          if (!saved) _error = 'Could not save project';
          return saved;
        },
      );
    } catch (error) {
      _error = _errorMessage(error);
      return false;
    } finally {
      _isSaving = false;
      _notifyListeners();
    }
  }

  void clearError() {
    if (_error == null) return;
    _error = null;
    _notifyListeners();
  }

  void _notifyListeners() {
    if (!_isDisposed) notifyListeners();
  }

  @override
  void dispose() {
    _isDisposed = true;
    super.dispose();
  }

  String _errorMessage(Object error) =>
      error.toString().replaceFirst(RegExp(r'^(Exception|Error):\s*'), '');
}
