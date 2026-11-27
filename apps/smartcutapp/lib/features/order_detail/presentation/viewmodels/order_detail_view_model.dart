import 'package:board_cut/features/order_detail/data/model/model.dart';
import 'package:board_cut/features/order_detail/data/model/order_item_model.dart';
import 'package:board_cut/features/order_detail/domain/usecases/get_items_by_order_id.dart';
import 'package:board_cut/features/order_detail/domain/usecases/get_order_by_id.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../domain/usecases/generate_pieces_for_order.dart';
import '../../domain/usecases/upload_items_by_order_id.dart';

class OrderDetailViewModel extends ChangeNotifier {
  OrderDetailViewModel({
    required this.getOrderById,
    required this.getItemsByOrderId,
    required this.generatePiecesForOrder,
    required this.uploadItemsByOrderId,
  });

  final GetOrderById getOrderById;
  final GetItemsByOrderId getItemsByOrderId;
  final GeneratePiecesForOrder generatePiecesForOrder;
  final UploadItemsByOrderId uploadItemsByOrderId;
  late String orderId;
  OrderDetailModel? _order;
  bool _isLoading = false;
  String? _error;
  List<OrderItemModel> _orderItems = [];
  final _limit = 10;
  var _currentPage = 1;

  List<OrderItemModel> get orderItems => _orderItems;

  OrderDetailModel? get order => _order;

  bool get isLoading => _isLoading;

  String? get error => _error;

  Future<void> fetchOrder() async {
    notifyListeners();
    final result = await getOrderById(id: orderId);

    result.match((failure) => _error = failure.message, (response) {
      _order = response;
    });

    _isLoading = false;
    notifyListeners();
  }

  Future<void> generatePieceForOrderId() async {
    notifyListeners();
    final result = await generatePiecesForOrder(orderId: orderId);

    result.match((failure) => _error = failure.message, (response) {
      // Handle the response for generated pieces
    });

    _isLoading = false;
    notifyListeners();
  }

  Future<void> fetchItemsByOrderId({int page = 1}) async {
    _isLoading = true;
    _error = null;
    notifyListeners();
    _currentPage = page;

    final result = await getItemsByOrderId(
      page: page,
      limit: _limit,
      orderId: orderId,
    );

    result.match((failure) => _error = failure.message, (response) {
      _orderItems = response.items;
    });

    _isLoading = false;
    notifyListeners();
  }

  Future<void> uploadItems({required dynamic data}) async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    final result = await uploadItemsByOrderId(data: data);

    var imported = false;
    result.match((failure) => _error = failure.message, (response) {
      if (response.success) {
        imported = true;
      } else {
        _error = response.message;
      }
    });

    if (imported) {
      await fetchItemsByOrderId(page: _currentPage);
      await fetchOrder();
    }

    _isLoading = false;
    notifyListeners();
  }
}
