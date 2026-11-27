import 'package:board_cut/core/core.dart';
import 'package:board_cut/features/layout_view/domain/usecases/get_sheet_by_id.dart';
import 'package:board_cut/features/layout_view/domain/usecases/select_optimization_layout.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:fpdart/fpdart.dart';

import '../../data/model/optimization_material_group_model.dart';
import '../../domain/usecases/get_material_group_by_id.dart';
import '../../domain/usecases/cancel_optimization_layout.dart';
import '../../domain/usecases/complete_optimization_production.dart';
import '../../domain/usecases/classify_remaining_area.dart';
import '../../domain/usecases/get_optimization_layout_by_id.dart';
import '../../domain/usecases/get_piece_process_types.dart';

class LayoutViewViewModel extends ChangeNotifier {
  LayoutViewViewModel({
    required this.getMaterialGroupById,
    required this.getPieceProcessTypes,
    required this.getSheetById,
    required this.selectOptimizationLayout,
    required this.getOptimizationLayoutById,
    required this.cancelOptimizationLayout,
    required this.completeOptimizationProduction,
    required this.classifyRemainingAreaUseCase,
  });

  final GetMaterialGroupById getMaterialGroupById;
  final GetPieceProcessTypes getPieceProcessTypes;
  final GetSheetById getSheetById;
  final SelectOptimizationLayout selectOptimizationLayout;
  final GetOptimizationLayoutById getOptimizationLayoutById;
  final CancelOptimizationLayout cancelOptimizationLayout;
  final CompleteOptimizationProduction completeOptimizationProduction;
  final ClassifyRemainingArea classifyRemainingAreaUseCase;

  OptimizationMaterialGroupModel? _materialGroup;
  List<OptimizationProcessType> _processTypes = const [];
  OptimizationSheetModel? _selectedSheet;

  List<OptimizationProcessType> get processTypes => _processTypes;
  OptimizationSheetModel? get selectedSheet => _selectedSheet;
  String? selectedLayoutId;

  OptimizationLayoutModel? get selectedLayout {
    final layouts =
        _materialGroup?.layouts ?? const <OptimizationLayoutModel>[];
    for (final layout in layouts) {
      if (layout.id == selectedLayoutId) return layout;
    }
    return layouts.isEmpty ? null : layouts.first;
  }

  bool _isLoading = false;
  bool _isUpdatingLayout = false;
  bool _isClassifyingRemainingArea = false;
  String? optimizationMaterialGroupId;

  OptimizationMaterialGroupModel? get materialGroup => _materialGroup;

  bool get isLoading => _isLoading;
  bool get isUpdatingLayout => _isUpdatingLayout;

  Future<void> fetchMaterialGroupById({bool showLoading = true}) async {
    final previousSelectedSheetId = _selectedSheet?.id;
    if (showLoading) {
      _isLoading = true;
      notifyListeners();
    }

    try {
      final result = await getMaterialGroupById(
        materialGroupId: optimizationMaterialGroupId ?? '',
      );

      result.match(
        (failure) {
          // Dio reports the API failure through ApiFeedbackInterceptor.
          return null;
        },
        (response) {
          _materialGroup = response;
          _syncSelectedLayout();
          _selectedSheet = null;
          final layouts = response.layouts;
          if (layouts.isNotEmpty) {
            final selectedLayout = layouts.firstWhere(
              (layout) => layout.id == selectedLayoutId,
              orElse: () => layouts.first,
            );
            if (selectedLayout.sheets.isNotEmpty) {
              _selectedSheet = selectedLayout.sheets.firstWhere(
                (sheet) => sheet.id == previousSelectedSheetId,
                orElse: () => selectedLayout.sheets.first,
              );
            }
          }
          if (showLoading) {
            _showToast('Optimization layouts loaded successfully.');
          }
        },
      );
    } catch (error) {
      final message = _errorMessage(error);
      if (message.isNotEmpty) _showToast(message);
    } finally {
      if (showLoading) _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> fetchPieceProcessTypes() async {
    try {
      final result = await getPieceProcessTypes();
      result.match((failure) => _showToast(failure.message), (processTypes) {
        _processTypes =
            processTypes.where((processType) => processType.isActive).toList()
              ..sort((a, b) => a.sequenceOrder.compareTo(b.sequenceOrder));
      });
    } catch (error) {
      final message = _errorMessage(error);
      if (message.isNotEmpty) _showToast(message);
    } finally {
      notifyListeners();
    }
  }

  // Future<void> fetchSheetById(String sheetId) async {
  //   notifyListeners();
  //   final result = await getSheetById(sheetId: sheetId);
  //
  //   result.match(
  //     (failure) {
  //       return _error = failure.message;
  //     },
  //     (response) {
  //       _selectedSheet = response;
  //     },
  //   );
  //
  //   _isLoading = false;
  //   notifyListeners();
  // }

  void fetchSelectedSheet(String id) {
    materialGroup?.layouts.forEach((layout) {
      for (var sheet in layout.sheets) {
        if (sheet.id == id || sheet.sheetId == id) {
          _selectedSheet = sheet;
          notifyListeners();
        }
      }
    });
  }

  Future<void> classifyRemainingArea({
    required String remainingAreaId,
    required RemainingAreaStatus status,
  }) async {
    if (_isClassifyingRemainingArea) return;
    _isClassifyingRemainingArea = true;
    notifyListeners();

    try {
      final result = await classifyRemainingAreaUseCase(
        remainingAreaId: remainingAreaId,
        status: status,
      );
      final response = result.match((failure) {
        _showToast(failure.message);
        return null;
      }, (response) => response);

      if (response == null) return;
      if (!response.success) {
        if (response.message.isNotEmpty) _showToast(response.message);
        return;
      }

      _showToast(response.message);
      await fetchMaterialGroupById(showLoading: false);
    } catch (error) {
      final message = _errorMessage(error);
      if (message.isNotEmpty) _showToast(message);
    } finally {
      _isClassifyingRemainingArea = false;
      notifyListeners();
    }
  }

  Future<void> selectOptimizationLayoutById(String layoutId) async {
    await _runLayoutAction(
      layoutId: layoutId,
      allowedStatuses: {LayoutStatus.generated},
      action: () => selectOptimizationLayout(layoutId: layoutId),
    );
  }

  Future<void> cancelOptimizationLayoutById(String layoutId) async {
    await _runLayoutAction(
      layoutId: layoutId,
      allowedStatuses: {
        LayoutStatus.generated,
        LayoutStatus.selected,
        LayoutStatus.inProduction,
      },
      action: () => cancelOptimizationLayout(layoutId: layoutId),
    );
  }

  Future<void> completeOptimizationProductionById(String layoutId) async {
    await _runLayoutAction(
      layoutId: layoutId,
      allowedStatuses: {LayoutStatus.selected, LayoutStatus.inProduction},
      action: () => completeOptimizationProduction(layoutId: layoutId),
    );
  }

  Future<void> _runLayoutAction({
    required String layoutId,
    required Set<LayoutStatus> allowedStatuses,
    required Future<Either<Failure, ApiResponse>> Function() action,
  }) async {
    if (_isUpdatingLayout) return;
    _isUpdatingLayout = true;
    notifyListeners();

    try {
      final layoutResult = await getOptimizationLayoutById(layoutId: layoutId);
      final layout = layoutResult.match((failure) {
        return null;
      }, (layout) => layout);
      if (layout == null) return;

      if (!allowedStatuses.contains(layout.status)) {
        const message =
            'This action is not available for the current layout status.';
        _showToast(message);
        await fetchMaterialGroupById(showLoading: false);
        return;
      }

      final actionResult = await action();
      final response = actionResult.match((failure) {
        return null;
      }, (response) => response);
      if (response == null) return;
      if (!response.success) {
        return;
      }

      _showToast(response.message);
      await fetchMaterialGroupById(showLoading: false);
    } catch (error) {
      final message = _errorMessage(error);
      if (message.isNotEmpty) _showToast(message);
    } finally {
      _isUpdatingLayout = false;
      notifyListeners();
    }
  }

  void _showToast(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      webPosition: 'center',
      timeInSecForIosWeb: 1,
      backgroundColor: AppColors.primaryColor,
      webBgColor: AppColors.primaryColorWebHex,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }

  String _errorMessage(Object error) {
    final message = error.toString();
    if (message.startsWith('Exception: ')) return '';
    return message;
  }

  void _syncSelectedLayout() {
    final layouts = materialGroup?.layouts ?? [];

    final selectedLayouts = layouts.where(
      (layout) =>
          layout.status == LayoutStatus.selected ||
          layout.status == LayoutStatus.inProduction,
    );

    selectedLayoutId = selectedLayouts.isEmpty
        ? null
        : selectedLayouts.first.id;
  }
}
