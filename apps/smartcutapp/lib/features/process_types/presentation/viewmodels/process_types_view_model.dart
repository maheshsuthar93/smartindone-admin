import 'package:flutter/foundation.dart';
import 'package:board_cut/core/core.dart';
import 'package:fpdart/fpdart.dart';

import '../../data/models/process_type_model.dart';
import '../../domain/usecases/create_process_type.dart';
import '../../domain/usecases/delete_process_type.dart';
import '../../domain/usecases/get_process_types.dart';
import '../../domain/usecases/update_process_type.dart';

class ProcessTypesViewModel extends ChangeNotifier {
  ProcessTypesViewModel({
    required this.getProcessTypes,
    required this.createProcessType,
    required this.updateProcessType,
    required this.deleteProcessType,
  });

  final GetProcessTypes getProcessTypes;
  final CreateProcessType createProcessType;
  final UpdateProcessType updateProcessType;
  final DeleteProcessType deleteProcessType;

  List<ProcessTypeModel> _processTypes = [];
  bool _isLoading = false;
  bool _isSaving = false;
  String? _error;

  List<ProcessTypeModel> get processTypes => _processTypes;
  bool get isLoading => _isLoading;
  bool get isSaving => _isSaving;
  String? get error => _error;

  Future<void> fetchProcessTypes() async {
    _isLoading = true;
    _error = null;
    notifyListeners();
    try {
      final result = await getProcessTypes();
      result.match((failure) => _error = failure.message, (processTypes) {
        _processTypes = [...processTypes]
          ..sort((a, b) => a.sequenceOrder.compareTo(b.sequenceOrder));
      });
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<bool> create({required String name, required int sequenceOrder}) =>
      _mutate(
        () => createProcessType(
          data: {'name': name, 'sequenceOrder': sequenceOrder},
        ),
      );

  Future<bool> update({
    required String processTypeId,
    required String name,
    required int sequenceOrder,
  }) => _mutate(
    () => updateProcessType(
      processTypeId: processTypeId,
      data: {'name': name, 'sequenceOrder': sequenceOrder},
    ),
  );

  Future<bool> delete({required String processTypeId}) =>
      _mutate(() => deleteProcessType(processTypeId: processTypeId));

  Future<bool> _mutate(
    Future<Either<Failure, ApiResponse>> Function() operation,
  ) async {
    _isSaving = true;
    _error = null;
    notifyListeners();
    var succeeded = false;
    try {
      final result = await operation();
      result.match((failure) => _error = failure.message, (response) {
        if (response.success) {
          succeeded = true;
        } else {
          _error = response.message;
        }
      });
      if (succeeded) {
        final refreshed = await getProcessTypes();
        refreshed.match(
          (failure) => _error = failure.message,
          (items) =>
              _processTypes = [...items]
                ..sort((a, b) => a.sequenceOrder.compareTo(b.sequenceOrder)),
        );
      }
    } finally {
      _isSaving = false;
      notifyListeners();
    }
    return succeeded;
  }

  void clearError() {
    _error = null;
    notifyListeners();
  }
}
