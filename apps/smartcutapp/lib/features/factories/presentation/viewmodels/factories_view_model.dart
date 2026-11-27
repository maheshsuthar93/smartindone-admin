import 'package:flutter/foundation.dart';

import '../../data/models/factory_model.dart';
import '../../domain/usecases/get_factories.dart';

class FactoriesViewModel extends ChangeNotifier {
  FactoriesViewModel({required this.getFactories});

  final GetFactories getFactories;

  List<FactoryModel> _factories = [];
  bool _isLoading = false;
  String? _error;

  List<FactoryModel> get factories => _factories;
  bool get isLoading => _isLoading;
  String? get error => _error;

  Future<void> fetchFactories() async {
    _isLoading = true;
    _error = null;
    notifyListeners();
    try {
      final result = await getFactories();
      result.match(
        (failure) => _error = failure.message,
        (factories) => _factories = factories,
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
