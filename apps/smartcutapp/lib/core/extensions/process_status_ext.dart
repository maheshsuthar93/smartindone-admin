import '../enums/enums.dart';

extension ProcessStatusExt on ProcessStatus {
  String get label {
    switch (this) {
      case ProcessStatus.inProgress:
        return "In Progress";
      case ProcessStatus.pending:
        return "Pending";
      case ProcessStatus.failed:
        return "Failed";
      case ProcessStatus.completed:
        return "Completed";
    }
  }

  String get value {
    switch (this) {
      case ProcessStatus.pending:
        return 'PENDING';
      case ProcessStatus.inProgress:
        return 'IN_PROGRESS';
      case ProcessStatus.completed:
        return 'COMPLETED';
      case ProcessStatus.failed:
        return 'FAILED';
    }
  }
}
