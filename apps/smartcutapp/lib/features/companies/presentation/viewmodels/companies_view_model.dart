import 'package:flutter/foundation.dart';
import 'package:board_cut/shared/data/model/company_model.dart';

import '../../domain/usecases/get_companies.dart';

class CompaniesViewModel extends ChangeNotifier {
  CompaniesViewModel({required this.getCompanies});
  final GetCompanies getCompanies;

  List<CompanyModel> _companies = [];
  bool _isLoading = false;
  String? _error;

  List<CompanyModel> get companies => _companies;
  bool get isLoading => _isLoading;
  String? get error => _error;

  Future<void> fetchCompanies() async {
    _isLoading = true;
    _error = null;
    notifyListeners();
    try {
      final result = await getCompanies();
      result.match(
        (failure) => _error = failure.message,
        (data) => _companies = data,
      );
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  void clearError() => _error = null;
}
