import 'package:board_cut/features/orders/domain/usecases/create_order.dart';
import 'package:board_cut/features/orders/domain/usecases/update_order.dart';
import 'package:flutter/foundation.dart';

class CreateOrderViewModel extends ChangeNotifier {
  CreateOrderViewModel({required this.createOrder, required this.updateOrder});

  final CreateOrder createOrder;
  final UpdateOrder updateOrder;

  bool _isSaving = false;
  String? _error;
  String? _message;

  bool get isSaving => _isSaving;
  String? get error => _error;
  String? get message => _message;

  Future<bool> save({
    String? orderId,
    required Map<String, dynamic> data,
  }) async {
    _isSaving = true;
    _error = null;
    _message = null;
    notifyListeners();

    try {
      final result = orderId == null
          ? await createOrder(data: data)
          : await updateOrder(orderId: orderId, data: data);

      return await result.match(
        (failure) {
          _error = failure.message;
          return false;
        },
        (response) {
          if (!response.success) _error = response.message;
          if (response.success) _message = response.message;
          return response.success;
        },
      );
    } finally {
      _isSaving = false;
      notifyListeners();
    }
  }

  void clearError() {
    _error = null;
    _message = null;
    notifyListeners();
  }
}
