import '../enums/enums.dart';

extension PieceStatusX on PieceStatus {
  String get label {
    switch (this) {
      case PieceStatus.inProgress:
        return "In Progress";
      case PieceStatus.pending:
        return "Pending";
      case PieceStatus.failed:
        return "Failed";
      case PieceStatus.completed:
        return "Completed";
    }
  }
}
