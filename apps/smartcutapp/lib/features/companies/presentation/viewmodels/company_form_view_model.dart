import 'package:flutter/foundation.dart';
import 'package:board_cut/shared/data/model/company_model.dart';

import '../../domain/usecases/create_company.dart';
import '../../domain/usecases/update_company.dart';

class CompanyFormViewModel extends ChangeNotifier {
  CompanyFormViewModel({
    required this.createCompany,
    required this.updateCompany,
  });
  final CreateCompany createCompany;
  final UpdateCompany updateCompany;

  bool _isSaving = false;
  String? _error;
  bool get isSaving => _isSaving;
  String? get error => _error;

  Future<bool> save({
    required CompanyModel? company,
    required String name,
    required bool isActive,
    required String serviceType,
    required String ownerName,
    required String ownerEmail,
    required String ownerPhone,
  }) async {
    _isSaving = true;
    _error = null;
    notifyListeners();
    try {
      String? optionalText(String value) {
        final trimmed = value.trim();
        return trimmed.isEmpty ? null : trimmed;
      }

      final data = {
        'name': name,
        'isActive': isActive,
        'serviceType': optionalText(serviceType),
        'ownerName': optionalText(ownerName),
        'ownerEmail': optionalText(ownerEmail),
        'ownerPhone': optionalText(ownerPhone),
      };
      final result = company == null
          ? await createCompany(data: data)
          : await updateCompany(companyId: company.id, data: data);
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
