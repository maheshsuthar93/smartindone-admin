import 'package:board_cut/features/part_detail/data/model/part_detail_model.dart';
import 'package:board_cut/features/part_detail/domain/usecases/get_part_by_id.dart';
import 'package:flutter/foundation.dart';

import '../../data/models/part_material_option.dart';
import '../../domain/usecases/create_part.dart';
import '../../domain/usecases/get_part_materials.dart';
import '../../domain/usecases/update_part.dart';

class CreatePartViewModel extends ChangeNotifier {
  CreatePartViewModel({
    required this.createPart,
    required this.updatePart,
    required this.getPartMaterials,
    required this.getPartById,
  });

  final CreatePart createPart;
  final UpdatePart updatePart;
  final GetPartMaterials getPartMaterials;
  final GetPartById getPartById;

  List<PartMaterialOption> _materials = [];
  PartDetailModel? _part;
  bool _isLoading = false;
  bool _isSaving = false;
  String? _error;
  bool _saved = false;

  List<PartMaterialOption> get materials => _materials;
  PartDetailModel? get part => _part;
  bool get isLoading => _isLoading;
  bool get isSaving => _isSaving;
  String? get error => _error;
  bool get saved => _saved;

  Future<void> load({required String? partId}) async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      final result = await getPartMaterials();
      result.match((failure) => _error = failure.message, (response) {
        if (response.success) {
          _materials = response.data ?? [];
        } else {
          _error = response.message;
        }
      });

      if (partId != null) {
        final partResult = await getPartById(id: partId);
        partResult.match(
          (failure) => _error ??= failure.message,
          (part) => _part = part,
        );
      }
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<bool> save({
    required String? partId,
    required Map<String, dynamic> data,
  }) async {
    _isSaving = true;
    _error = null;
    _saved = false;
    notifyListeners();

    try {
      final result = partId == null
          ? await createPart(data: data)
          : await updatePart(partId: partId, data: data);
      result.match((failure) => _error = failure.message, (response) {
        if (response.success) {
          _part = response.data;
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
