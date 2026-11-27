import 'package:board_cut/core/enums/enums.dart';

extension OptimizationStatusExtX on OptimizationStatus {
  String get label {
    switch (this) {
      case OptimizationStatus.draft:
        return "Draft";
      case OptimizationStatus.inProgress:
        return "In Progress";
      case OptimizationStatus.completed:
        return "Completed";
      case OptimizationStatus.cancelled:
        return "Cancelled";
      case OptimizationStatus.unknown:
        return "Unknown";
    }
  }
}
