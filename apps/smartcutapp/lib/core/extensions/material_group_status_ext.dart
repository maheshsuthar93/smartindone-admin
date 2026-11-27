import 'package:board_cut/core/enums/enums.dart';

extension MaterialGroupStatusExtStatusExtX on MaterialGroupStatus {
  String get label {
    switch (this) {
      case MaterialGroupStatus.ready:
        return "Ready";
      case MaterialGroupStatus.optimizing:
        return "Optimizing";
      case MaterialGroupStatus.completed:
        return "Completed";
      case MaterialGroupStatus.failed:
        return "Failed";
      case MaterialGroupStatus.unknown:
        return "Unknown";
    }
  }
}
