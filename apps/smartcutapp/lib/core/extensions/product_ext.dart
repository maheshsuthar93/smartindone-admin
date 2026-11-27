import '../enums/enums.dart';

extension ProductStatusX on ProductionStatus {
  String get label {
    switch (this) {
      case ProductionStatus.inProgress:
        return "In Progress";
      case ProductionStatus.pending:
        return "Pending";
      case ProductionStatus.rejected:
        return "Rejected";
      case ProductionStatus.done:
        return "Done";
      case ProductionStatus.unknown:
        return "Unknown";
    }
  }
}
