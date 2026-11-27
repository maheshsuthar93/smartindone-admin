import 'package:board_cut/features/item_detail/data/model/order_item_details_model.dart';
import 'package:board_cut/features/item_detail/domain/usecases/get_item_by_id.dart';
import 'package:flutter/material.dart';

import '../../domain/usecases/create_item.dart';
import '../../domain/usecases/update_item.dart';

class CreateItemViewModel extends ChangeNotifier {
  CreateItemViewModel({
    required this.createItem,
    required this.updateItem,
    required this.getItemById,
  });

  final CreateItem createItem;
  final UpdateItem updateItem;
  final GetItemById getItemById;

  OrderItemDetailsModel? _item;
  bool _isLoading = false;
  String? _error;
  bool _saved = false;

  OrderItemDetailsModel? get item => _item;
  bool get isLoading => _isLoading;
  String? get error => _error;
  bool get saved => _saved;

  Future<void> fetchItem(String itemId) async {
    _isLoading = true;
    _error = null;
    notifyListeners();
    try {
      final result = await getItemById(id: itemId);
      result.match(
        (failure) => _error = failure.message,
        (item) => _item = item,
      );
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<bool> saveItem({
    required String? itemId,
    required Map<String, dynamic> data,
  }) async {
    _isLoading = true;
    _error = null;
    _saved = false;
    notifyListeners();
    try {
      final result = itemId == null
          ? await createItem(data: data)
          : await updateItem(itemId: itemId, data: data);
      result.match((failure) => _error = failure.message, (response) {
        if (response.success) {
          _item = response.data;
          _saved = true;
        } else {
          _error = response.message;
        }
      });
      return _saved;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  void clearError() {
    _error = null;
    notifyListeners();
  }
}
