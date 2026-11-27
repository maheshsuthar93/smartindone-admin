import '../enums/enums.dart';

extension OrderStatusX on OrderStatus {
  String get label {
    switch (this) {
      case OrderStatus.draft:
        return "Draft";
      case OrderStatus.approved:
        return "Approved";
      case OrderStatus.inProduction:
        return "In Production";
      case OrderStatus.completed:
        return "Completed";
      case OrderStatus.shipped:
        return "Shipped";
      case OrderStatus.delivered:
        return "Delivered";
      case OrderStatus.cancelled:
        return "Cancelled";
    }
  }
}
