import 'package:board_cut/core/core.dart';
import 'package:flutter/foundation.dart';

/// Holds the state shared by the inventory form and exposes the options that
/// depend on the selected inventory type.
class CreateInventoryViewModel extends ChangeNotifier {
  InventoryType _type = InventoryType.sheet;
  String? _material;
  InventoryStatus? _status = InventoryStatus.available;
  SheetType? _sheetType = SheetType.full;
  GrainDirection? _grainDirection = GrainDirection.none;
  HardwareType? _hardwareType;
  HardwareUnit? _hardwareUnit;
  static const inventoryTypes = [InventoryType.sheet, InventoryType.hardware];

  InventoryType get type => _type;
  String? get material => _material;
  InventoryStatus? get status => _status;
  SheetType? get sheetType => _sheetType;
  GrainDirection? get grainDirection => _grainDirection;
  HardwareType? get hardwareType => _hardwareType;
  HardwareUnit? get hardwareUnit => _hardwareUnit;
  bool get isSheet => _type == InventoryType.sheet;

  void setType(InventoryType value) {
    _type = value;
    _material = null;
    notifyListeners();
  }

  void setMaterial(String? value) => _setValue(() => _material = value);
  void setStatus(InventoryStatus? value) => _setValue(() => _status = value);
  void setSheetType(SheetType? value) => _setValue(() => _sheetType = value);
  void setGrainDirection(GrainDirection? value) =>
      _setValue(() => _grainDirection = value);
  void setHardwareType(HardwareType? value) =>
      _setValue(() => _hardwareType = value);
  void setHardwareUnit(HardwareUnit? value) =>
      _setValue(() => _hardwareUnit = value);

  String optionLabel(Enum value) => value.name
      .replaceAllMapped(RegExp(r'[A-Z]'), (match) => '_${match[0]}')
      .toUpperCase();

  void _setValue(VoidCallback update) {
    update();
    notifyListeners();
  }
}
