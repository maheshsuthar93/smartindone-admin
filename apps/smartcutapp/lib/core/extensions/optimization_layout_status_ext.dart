import 'package:board_cut/core/enums/enums.dart';

extension OptimizationLayoutStatusExt on LayoutStatus {
  String get label {
    switch (this) {
      case LayoutStatus.generated:
        return "Generated";
      case LayoutStatus.selected:
        return "Selected";
      case LayoutStatus.inProduction:
        return "In Production";
      case LayoutStatus.completed:
        return "Completed";
      case LayoutStatus.cancelled:
        return "Cancelled";
      case LayoutStatus.unknown:
        return "Unknown";
    }
  }
}
