import '../enums/enums.dart';

extension ProjectStatusX on ProjectStatus {
  String get label {
    switch (this) {
      case ProjectStatus.planning:
        return "Planning";
      case ProjectStatus.inProgress:
        return "In Progress";
      case ProjectStatus.onHold:
        return "On Hold";
      case ProjectStatus.completed:
        return "Completed";
      case ProjectStatus.cancelled:
        return "Cancelled";
      case ProjectStatus.unknown:
        return "Unknown";
    }
  }

  String get value {
    switch (this) {
      case ProjectStatus.planning:
        return 'PLANNING';
      case ProjectStatus.inProgress:
        return 'IN_PROGRESS';
      case ProjectStatus.onHold:
        return 'ON_HOLD';
      case ProjectStatus.completed:
        return 'COMPLETED';
      case ProjectStatus.cancelled:
        return 'CANCELLED';
      case ProjectStatus.unknown:
        return 'UNKNOWN';
    }
  }
}
