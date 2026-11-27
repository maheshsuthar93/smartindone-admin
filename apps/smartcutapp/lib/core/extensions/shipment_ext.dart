import '../enums/enums.dart';

extension ShipmentStatusX on ShipmentStatus {
  String get label {
    switch (this) {
      case ShipmentStatus.pending:
        return "Pending";
      case ShipmentStatus.delivered:
        return "Delivered";
      case ShipmentStatus.inTransit:
        return "In Transit";
      case ShipmentStatus.dispatched:
        return "Dispatched";
      case ShipmentStatus.cancelled:
        return "Cancelled";
      case ShipmentStatus.unknown:
        return "Unknown";
    }
  }
}
