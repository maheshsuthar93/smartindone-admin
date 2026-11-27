import 'package:flutter/foundation.dart';

import '../../data/models/factory_model.dart';
import '../../domain/usecases/save_factory.dart';

class FactoryFormViewModel extends ChangeNotifier {
  FactoryFormViewModel({required this.saveFactory});

  final SaveFactory saveFactory;

  bool _isSaving = false;
  bool _saved = false;
  String? _error;

  bool get isSaving => _isSaving;
  bool get saved => _saved;
  String? get error => _error;

  Future<bool> save({
    required FactoryModel? factory,
    required Map<String, dynamic> data,
  }) async {
    _isSaving = true;
    _saved = false;
    _error = null;
    notifyListeners();
    try {
      final result = factory == null
          ? await saveFactory.create(data: data)
          : await saveFactory.update(factoryId: factory.id, data: data);
      result.match((failure) => _error = failure.message, (response) {
        if (response.success) {
          _saved = true;
        } else {
          _error = response.message;
        }
      });
      return _saved;
    } finally {
      _isSaving = false;
      notifyListeners();
    }
  }

  void clearError() {
    _error = null;
    notifyListeners();
  }
}
