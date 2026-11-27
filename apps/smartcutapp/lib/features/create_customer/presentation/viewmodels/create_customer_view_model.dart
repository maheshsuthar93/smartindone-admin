import 'package:board_cut/features/customers/data/models/customer_model.dart';
import 'package:board_cut/features/customers/domain/usecases/create_customer.dart';
import 'package:board_cut/features/customers/domain/usecases/get_customer_by_id.dart';
import 'package:board_cut/features/customers/domain/usecases/update_customer.dart';
import 'package:flutter/foundation.dart';

class CreateCustomerViewModel extends ChangeNotifier {
  CreateCustomerViewModel({
    required this.createCustomer,
    required this.getCustomerById,
    required this.updateCustomer,
  });

  final CreateCustomer createCustomer;
  final GetCustomerById getCustomerById;
  final UpdateCustomer updateCustomer;

  CustomerModel? _customer;
  bool _isLoading = false;
  bool _isSaving = false;
  String? _error;

  CustomerModel? get customer => _customer;
  bool get isLoading => _isLoading;
  bool get isSaving => _isSaving;
  String? get error => _error;

  Future<void> loadCustomer(String customerId) async {
    _isLoading = true;
    _error = null;
    notifyListeners();
    try {
      final result = await getCustomerById(customerId: customerId);
      result.match(
        (failure) => _error = failure.message,
        (customer) => _customer = customer,
      );
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<bool> save({
    String? customerId,
    required Map<String, dynamic> data,
  }) async {
    _isSaving = true;
    _error = null;
    notifyListeners();
    try {
      final result = customerId == null
          ? await createCustomer(data: data)
          : await updateCustomer(customerId: customerId, data: data);
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
      _isSaving = false;
      notifyListeners();
    }
  }
}
