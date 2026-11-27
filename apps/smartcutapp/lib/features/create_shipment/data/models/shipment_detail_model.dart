class Data {
  final String id;
  final String shipmentNo;
  final String orderId;
  final String driverId;
  final String status;
  final DateTime dispatchDate;
  final dynamic deliveryDate;
  final String deliveryAddress;
  final String deliveryAddress2;
  final String deliveryCity;
  final String deliveryState;
  final String deliveryPostalCode;
  final String deliveryCountry;
  final DateTime createdAt;
  final DateTime updatedAt;
  final Order order;
  final Driver driver;
  final List<dynamic> packages;

  Data({
    required this.id,
    required this.shipmentNo,
    required this.orderId,
    required this.driverId,
    required this.status,
    required this.dispatchDate,
    required this.deliveryDate,
    required this.deliveryAddress,
    required this.deliveryAddress2,
    required this.deliveryCity,
    required this.deliveryState,
    required this.deliveryPostalCode,
    required this.deliveryCountry,
    required this.createdAt,
    required this.updatedAt,
    required this.order,
    required this.driver,
    required this.packages,
  });
}

class Driver {
  final String id;
  final String name;
  final String phone;
  final dynamic email;
  final String licenseNo;
  final String vehicleNumber;
  final String vehicleType;
  final String status;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String companyId;

  Driver({
    required this.id,
    required this.name,
    required this.phone,
    required this.email,
    required this.licenseNo,
    required this.vehicleNumber,
    required this.vehicleType,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.companyId,
  });
}

class Order {
  final String id;
  final int orderNumber;
  final Customer customer;
  final Project project;

  Order({
    required this.id,
    required this.orderNumber,
    required this.customer,
    required this.project,
  });
}

class Customer {
  final String id;
  final String name;

  Customer({required this.id, required this.name});
}

class Project {
  final String id;
  final String name;
  final dynamic deliveryAddress;
  final dynamic deliveryAddress2;
  final dynamic deliveryCity;
  final dynamic deliveryState;
  final dynamic deliveryPostalCode;
  final String deliveryCountry;

  Project({
    required this.id,
    required this.name,
    required this.deliveryAddress,
    required this.deliveryAddress2,
    required this.deliveryCity,
    required this.deliveryState,
    required this.deliveryPostalCode,
    required this.deliveryCountry,
  });
}
