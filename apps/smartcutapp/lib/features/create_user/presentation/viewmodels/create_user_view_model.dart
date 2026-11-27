import 'package:board_cut/core/core.dart';
import 'package:board_cut/core/auth/role_access.dart';
import 'package:board_cut/features/companies/domain/usecases/get_companies.dart';
import 'package:board_cut/features/users/domain/usecases/create_user.dart';
import 'package:board_cut/features/users/domain/usecases/update_user.dart';
import 'package:board_cut/shared/data/model/company_model.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter/foundation.dart';

class CreateUserViewModel extends ChangeNotifier {
  CreateUserViewModel({
    required this.getCompanies,
    required this.createUser,
    required this.updateUser,
    required this.storage,
  });

  final GetCompanies getCompanies;
  final CreateUser createUser;
  final UpdateUser updateUser;
  final FlutterSecureStorage storage;

  bool isSuperAdmin = false;
  bool isLoadingCompanies = false;
  bool isSaving = false;
  String? companiesError;
  String? error;
  List<CompanyModel> companies = [];

  Future<void> loadCompanyAccess({required bool isEditing}) async {
    final roleValue = await storage.read(key: 'auth_user_role');
    isSuperAdmin = userRoleFromApi(roleValue) == UserRole.superAdmin;
    if (!isSuperAdmin || isEditing) {
      notifyListeners();
      return;
    }
    isLoadingCompanies = true;
    companiesError = null;
    notifyListeners();
    try {
      final result = await getCompanies();
      result.match(
        (failure) => companiesError = failure.message,
        (response) =>
            companies = response.where((company) => company.isActive).toList(),
      );
    } finally {
      isLoadingCompanies = false;
      notifyListeners();
    }
  }

  Future<ApiResponse?> save({
    String? userId,
    required Map<String, dynamic> data,
  }) async {
    isSaving = true;
    error = null;
    notifyListeners();
    try {
      final result = userId == null
          ? await createUser(data: data)
          : await updateUser(userId: userId, data: data);
      return await result.match(
        (failure) {
          error = failure.message;
          return null;
        },
        (response) {
          if (!response.success) error = response.message;
          return response;
        },
      );
    } finally {
      isSaving = false;
      notifyListeners();
    }
  }
}
