import 'package:board_cut/features/item_detail/data/model/order_item_details_model.dart';
import 'package:board_cut/features/item_detail/data/model/model.dart';
import 'package:board_cut/features/item_detail/domain/usecases/get_item_by_id.dart';
import 'package:board_cut/features/item_detail/domain/usecases/get_parts_by_item_id.dart';
import 'package:board_cut/features/item_detail/domain/usecases/upload_parts_by_item_id.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ItemDetailViewModel extends ChangeNotifier {
  ItemDetailViewModel({
    required this.getItemById,
    required this.getPartsByItemId,
    required this.uploadPartsByItemId,
  });

  final GetItemById getItemById;
  final GetPartsByItemId getPartsByItemId;
  final UploadPartsByItemId uploadPartsByItemId;
  List<PartModel> _parts = [];

  List<PartModel> get parts => _parts;

  late String itemId;
  OrderItemDetailsModel? _itemDetailModel;
  bool _isLoading = false;
  String? _error;
  final _limit = 10;

  OrderItemDetailsModel? get item => _itemDetailModel;

  bool get isLoading => _isLoading;

  String? get error => _error;

  Future<void> fetchItem() async {
    notifyListeners();
    final result = await getItemById(id: itemId);

    result.match((failure) => _error = failure.message, (response) {
      _itemDetailModel = response;
    });

    _isLoading = false;
    notifyListeners();
  }

  Future<void> fetchPartsByItemId({int page = 1}) async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    final result = await getPartsByItemId(
      page: page,
      limit: _limit,
      itemId: itemId,
    );

    result.match((failure) => _error = failure.message, (response) {
      _parts = response.items;
    });

    _isLoading = false;
    notifyListeners();
  }

  Future<void> uploadParts({required dynamic data}) async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    final result = await uploadPartsByItemId(data: data);
    var uploaded = false;

    result.match((failure) => _error = failure.message, (response) {
      uploaded = true;
    });

    _isLoading = false;
    notifyListeners();

    if (uploaded) await fetchPartsByItemId();
  }
}
