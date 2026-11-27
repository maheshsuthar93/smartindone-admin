import '../enums/enums.dart';

extension ItemStatusExt on ItemStatus {
  String get label {
    switch (this) {
      case ItemStatus.inProgress:
        return "In Progress";
      case ItemStatus.pending:
        return "Pending";
      case ItemStatus.unknown:
        return "Unknown";
      case ItemStatus.completed:
        return "Completed";
    }
  }

  String get value {
    switch (this) {
      case ItemStatus.pending:
        return 'PENDING';
      case ItemStatus.inProgress:
        return 'IN_PROGRESS';
      case ItemStatus.completed:
        return 'COMPLETED';
      case ItemStatus.unknown:
        return 'UNKNOWN';
    }
  }
}
