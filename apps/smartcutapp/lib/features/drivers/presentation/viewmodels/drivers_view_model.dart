import 'package:flutter/foundation.dart';

import '../../domain/usecases/driver_usecases.dart';
import '../../data/models/driver_model.dart';

class DriversViewModel extends ChangeNotifier {
  DriversViewModel({
    required this.getDrivers,
    required this.createDriver,
    required this.updateDriver,
    required this.deleteDriver,
  });

  final GetDrivers getDrivers;
  final CreateDriver createDriver;
  final UpdateDriver updateDriver;
  final DeleteDriver deleteDriver;
  List<DriverModel> drivers = [];
  int page = 1, limit = 10, total = 0, totalPages = 0;
  String search = '';
  bool isLoading = false;
  bool isSaving = false;
  String? error;

  Future<void> load({int page = 1, String? search}) async {
    isLoading = true;
    error = null;
    notifyListeners();
    try {
      this.page = page;
      if (search != null) this.search = search;
      final result = await getDrivers(
        page: this.page,
        limit: limit,
        search: this.search.isEmpty ? null : this.search,
      );
      result.match((failure) => error = failure.message, (data) {
        drivers = data.items;
        this.page = data.page;
        total = data.total;
        totalPages = data.totalPages;
      });
    } catch (e) {
      error = e.toString();
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<String?> save(Map<String, dynamic> values, {String? id}) async {
    isSaving = true;
    notifyListeners();
    try {
      final result = id == null
          ? await createDriver(values)
          : await updateDriver(id, values);
      var succeeded = false;
      result.match((failure) => error = failure.message, (response) {
        succeeded = response.success;
        if (!response.success) error = response.message;
      });
      if (!succeeded) return error ?? 'Could not save driver.';
      await load(page: id == null ? 1 : page);
      return null;
    } catch (e) {
      return e.toString();
    } finally {
      isSaving = false;
      notifyListeners();
    }
  }

  Future<String?> remove(String id) async {
    try {
      final result = await deleteDriver(id);
      var succeeded = false;
      result.match((failure) => error = failure.message, (response) {
        succeeded = response.success;
        if (!response.success) error = response.message;
      });
      if (!succeeded) return error ?? 'Could not remove driver.';
      await load(page: drivers.length == 1 && page > 1 ? page - 1 : page);
      return null;
    } catch (e) {
      return e.toString();
    }
  }
}
