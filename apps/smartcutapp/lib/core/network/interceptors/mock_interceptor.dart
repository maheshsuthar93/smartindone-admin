import 'package:dio/dio.dart';

class MockInterceptor extends Interceptor {
  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    await Future.delayed(const Duration(milliseconds: 500));

    var data = {};
    if (options.path == '/users') {
      data = _mockUsersResponse(options.queryParameters);
    }
    if (options.path == '/warehouses') {
      data = _mockWarehousesResponse(options.queryParameters);
    }
    if (options.path == '/projects') {
      data = _mockProjectsResponse(options.queryParameters);
    }
    if (options.path == '/customers') {
      data = _mockCustomersResponse(options.queryParameters);
    }

    if (options.path == '/orders') {
      data = _mockOrdersResponse(options.queryParameters);
    }
    if (options.path == '/shipments') {
      data = _mockShipmentsResponse(options.queryParameters);
    }
    if (options.path == '/inventories') {
      data = _mockInventoriesResponse(options.queryParameters);
    }

    if (data.isNotEmpty) {
      handler.resolve(
        Response(requestOptions: options, statusCode: 200, data: data),
      );
      return;
    }
    handler.next(options);
  }
}

Map<String, dynamic> _mockUsersResponse(Map<String, dynamic> query) {
  final page = int.tryParse(query['page']?.toString() ?? '1') ?? 1;
  final limit = int.tryParse(query['limit']?.toString() ?? '10') ?? 10;

  final allUsers = List.generate(25, (index) {
    return {
      "id": index + 1,
      "name": "User ${index + 1}",
      "email": "user${index + 1}@example.com",
      "mobile": "90000000${index + 1}",
      "role": index % 2 == 0 ? "ADMIN" : "USER",
      "isActive": true,
      "createdAt": DateTime.now().toIso8601String(),
      "companyId": "1",
    };
  });

  final start = (page - 1) * limit;
  final end = start + limit;
  final paginated = allUsers.sublist(
    start,
    end > allUsers.length ? allUsers.length : end,
  );

  return {
    "success": true,
    "message": "Users fetched successfully",
    "statusCode": 200,
    "data": paginated,
    "meta": {
      "page": page,
      "limit": limit,
      "total": allUsers.length,
      "totalPages": (allUsers.length / limit).ceil(),
    },
  };
}

Map<String, dynamic> _mockWarehousesResponse(Map<String, dynamic> query) {
  return {
    "success": true,
    "message": "Warehouses fetched successfully",
    "statusCode": 200,
    "data": [
      {
        "id": 1,
        "companyId": 1,
        "code": "WH-AHM-01",
        "name": "Ahmedabad Main Warehouse",
        "contactPerson": "Mahesh Patel",
        "phone": "+91-9876543210",
        "email": "warehouse@factory.com",
        "type": "MAIN",
        "addressLine1": "Plot 21, GIDC Industrial Area",
        "addressLine2": "Vatva",
        "city": "Ahmedabad",
        "state": "Gujarat",
        "country": "India",
        "pincode": "382445",
        "latitude": 23.0225,
        "longitude": 72.5714,
        "capacity": 50000,
        "usedCapacity": 32000,
        "isActive": true,
        "createdAt": "2026-02-01T10:00:00Z",
        "updatedAt": "2026-02-10T12:00:00Z",
      },
      {
        "id": 2,
        "companyId": 1,
        "code": "WH-SRT-01",
        "name": "Surat Storage Hub",
        "contactPerson": "Rohit Sharma",
        "phone": "+91-9123456780",
        "email": "finished@factory.com",
        "type": "SUB",
        "addressLine1": "Near Hazira Road",
        "addressLine2": "Industrial Zone",
        "city": "Surat",
        "state": "Gujarat",
        "country": "India",
        "pincode": "394270",
        "latitude": 21.1702,
        "longitude": 72.8311,
        "capacity": 30000,
        "usedCapacity": 18000,
        "isActive": true,
        "createdAt": "2026-01-15T09:00:00Z",
        "updatedAt": "2026-02-08T11:30:00Z",
      },
    ],
    "meta": {"page": 1, "limit": 10, "total": 2, "totalPages": 1},
  };
}

Map<String, dynamic> _mockProjectsResponse(Map<String, dynamic> query) {
  return {
    "success": true,
    "message": "Projects fetched successfully",
    "statusCode": 200,
    "data": [
      {
        "id": 1,
        "companyId": 1,
        "customerId": 12,
        "projectCode": "PRJ-001",
        "name": "Modular Kitchen - Shah Residence",
        "description": "Complete modular kitchen setup",
        "status": "IN_PROGRESS",
        "contactPerson": "Rohit Sharma",
        "phone": "+91-9123456780",
        "priority": "HIGH",
        "startDate": "2026-02-01T00:00:00.000Z",
        "expectedEndDate": "2026-03-15T00:00:00.000Z",
        "budget": 450000,
        "progressPercentage": 60,
        "isActive": true,
        "createdAt": "2026-01-25T10:00:00.000Z",
        "updatedAt": "2026-02-20T12:30:00.000Z",
      },
      {
        "id": 2,
        "companyId": 1,
        "customerId": 15,
        "projectCode": "PRJ-002",
        "name": "Office Interior - Patel & Co.",
        "description": "Full office interior furniture",
        "status": "PLANNING",
        "contactPerson": "Rohit Sharma",
        "phone": "+91-9123456780",
        "priority": "MEDIUM",
        "startDate": "2026-03-01T00:00:00.000Z",
        "expectedEndDate": "2026-05-01T00:00:00.000Z",
        "budget": 1200000,
        "progressPercentage": 10,
        "isActive": true,
        "createdAt": "2026-02-10T09:00:00.000Z",
        "updatedAt": "2026-02-21T11:00:00.000Z",
      },
    ],

    "meta": {"page": 1, "limit": 10, "total": 2, "totalPages": 1},
  };
}

Map<String, dynamic> _mockCustomersResponse(Map<String, dynamic> query) {
  return {
    "success": true,
    "message": "Customers fetched successfully",
    "statusCode": 200,
    "data": [
      {
        "id": 1,
        "companyId": 1,
        "customerCode": "CUST-001",
        "name": "Rajesh Patel",
        "email": "rajesh.patel@example.com",
        "contactPerson": "Rohit Sharma",
        "contactPhone": "+91 9876543210",
        "phone": "+91 9876543210",
        "gstNumber": "24ABCDE1234F1Z5",
        "addressLine1": "B-101, Shree Complex",
        "addressLine2": "Satellite Road",
        "city": "Ahmedabad",
        "state": "Gujarat",
        "country": "India",
        "postalCode": "380015",
        "isActive": true,
        "creditLimit": 250000,
        "createdAt": "2026-02-23T10:15:30.000Z",
        "updatedAt": "2026-02-23T10:15:30.000Z",
      },
      {
        "id": 2,
        "companyId": 1,
        "customerCode": "CUST-002",
        "name": "Amit Furniture Works",
        "email": "amitfurniture@example.com",
        "phone": "+91 9988776655",
        "contactPerson": "Rohit Sharma",
        "contactPhone": "+91 9876543210",
        "gstNumber": "24FGHIJ5678K1Z2",
        "addressLine1": "Plot No. 12, GIDC",
        "addressLine2": null,
        "city": "Surat",
        "state": "Gujarat",
        "country": "India",
        "postalCode": "395007",
        "isActive": true,
        "creditLimit": 500000,
        "createdAt": "2026-02-22T08:10:00.000Z",
        "updatedAt": "2026-02-22T08:10:00.000Z",
      },
    ],
    "meta": {"page": 1, "limit": 10, "total": 25},
  };
}

Map<String, dynamic> _mockOrdersResponse(Map<String, dynamic> query) {
  return {
    "success": true,
    "message": "Orders fetched successfully",
    "statusCode": 200,
    "data": [
      {
        "id": 101,
        "companyId": 1,
        "orderNumber": "ORD-2026-001",
        "orderDate": "2026-02-23T00:00:00.000Z",
        "status": "IN_CUTTING",
        "totalAmount": 185000,
        "notes": "Urgent delivery required",

        "customer": {
          "id": 1,
          "customerCode": "CUST-001",
          "name": "Rajesh Patel",
          "email": "rajesh.patel@example.com",
          "phone": "+91 9876543210",
          "city": "Ahmedabad",
          "state": "Gujarat",
          "companyId": 1,
          "isActive": true,
        },

        "project": {
          "id": 3,
          "projectCode": "PRJ-003",
          "name": "Bungalow Interior",
          "status": "IN_PROGRESS",
          "startDate": "2026-02-01T00:00:00.000Z",
          "endDate": null,
        },

        "items": [
          {
            "id": 1,
            "productName": "Wardrobe Panel",
            "quantity": 10,
            "unitPrice": 2500,
            "totalPrice": 25000,
          },
          {
            "id": 2,
            "productName": "Kitchen Shutter",
            "quantity": 20,
            "unitPrice": 4000,
            "totalPrice": 80000,
          },
        ],

        "createdAt": "2026-02-23T10:15:30.000Z",
        "updatedAt": "2026-02-23T10:15:30.000Z",
      },

      {
        "id": 102,
        "companyId": 1,
        "orderNumber": "ORD-2026-002",
        "orderDate": "2026-02-24T00:00:00.000Z",
        "status": "RELEASED",
        "totalAmount": 95000,
        "notes": null,

        "customer": {
          "id": 2,
          "customerCode": "CUST-002",
          "name": "Amit Furniture Works",
          "email": "amitfurniture@example.com",
          "phone": "+91 9988776655",
          "city": "Surat",
          "state": "Gujarat",
          "isActive": true,
        },

        "project": {
          "id": 4,
          "projectCode": "PRJ-004",
          "name": "Office Renovation",
          "status": "PLANNING",
          "startDate": "2026-03-01T00:00:00.000Z",
          "endDate": null,
        },

        "items": [
          {
            "id": 3,
            "productName": "Reception Desk Panel",
            "quantity": 5,
            "unitPrice": 5000,
            "totalPrice": 25000,
          },
          {
            "id": 4,
            "productName": "Storage Cabinet",
            "quantity": 10,
            "unitPrice": 7000,
            "totalPrice": 70000,
          },
        ],

        "createdAt": "2026-02-24T09:00:00.000Z",
        "updatedAt": "2026-02-24T09:00:00.000Z",
      },

      {
        "id": 103,
        "companyId": 1,
        "orderNumber": "ORD-2026-003",
        "orderDate": "2026-02-20T00:00:00.000Z",
        "status": "COMPLETED",
        "totalAmount": 120000,
        "notes": "Delivered successfully",

        "customer": {
          "id": 1,
          "customerCode": "CUST-001",
          "name": "Rajesh Patel",
          "email": "rajesh.patel@example.com",
          "phone": "+91 9876543210",
          "city": "Ahmedabad",
          "state": "Gujarat",
          "isActive": true,
        },

        "project": {
          "id": 3,
          "projectCode": "PRJ-003",
          "name": "Bungalow Interior",
          "status": "IN_PROGRESS",
          "startDate": "2026-02-01T00:00:00.000Z",
          "endDate": null,
        },

        "items": [
          {
            "id": 5,
            "productName": "TV Unit Panel",
            "quantity": 8,
            "unitPrice": 15000,
            "totalPrice": 120000,
          },
        ],

        "createdAt": "2026-02-20T08:30:00.000Z",
        "updatedAt": "2026-02-22T18:00:00.000Z",
      },
    ],

    "meta": {"page": 1, "limit": 10, "total": 3},
  };
}

Map<String, dynamic> _mockShipmentsResponse(Map<String, dynamic> query) {
  return {
    "success": true,
    "message": "Shipment fetched successfully",
    "statusCode": 200,
    "data": [
      {
        "id": 501,
        "companyId": 1,
        "shipmentNumber": "SHP-2026-001",
        "shipmentDate": "2026-02-25T00:00:00.000Z",
        "dispatchDate": "2026-02-25T00:00:00.000Z",
        "deliveryDate": "2026-02-25T00:00:00.000Z",
        "actualDeliveryDate": "2026-02-25T00:00:00.000Z",
        "status": "DISPATCHED",
        "transportName": "Mahadev Logistics",
        "vehicleNumber": "GJ01AB1234",
        "trackingNumber": "TRK123456789",
        "totalPackages": 5,
        "totalWeight": 350.5,
        "notes": "Handle with care",
        "orderId": 101,
        "order": {
          "id": 101,
          "orderNumber": "ORD-2026-001",
          "status": "IN_CUTTING",
          "totalAmount": 185000,

          "customer": {
            "id": 1,
            "customerCode": "CUST-001",
            "name": "Rajesh Patel",
            "phone": "+91 9876543210",
            "city": "Ahmedabad",
            "state": "Gujarat",
          },

          "project": {
            "id": 3,
            "projectCode": "PRJ-003",
            "name": "Bungalow Interior",
            "status": "IN_PROGRESS",
            "startDate": "2026-02-01T00:00:00.000Z",
            "endDate": null,
          },
        },

        "packages": [
          {
            "id": 1,
            "packageNumber": "PKG-001",
            "weight": 80.5,
            "length": 120,
            "width": 60,
            "height": 30,
          },
          {
            "id": 2,
            "packageNumber": "PKG-002",
            "weight": 70.0,
            "length": 100,
            "width": 50,
            "height": 40,
          },
        ],

        "createdAt": "2026-02-25T09:00:00.000Z",
        "updatedAt": "2026-02-25T09:00:00.000Z",
      },
    ],
    "meta": {"page": 1, "limit": 10, "total": 3},
  };
}

Map<String, dynamic> _mockInventoriesResponse(Map<String, dynamic> query) {
  return {
    "success": true,
    "message": "Inventory fetched successfully",
    "statusCode": 200,
    "data": [
      {
        "id": 1,
        "companyId": 1,
        "itemCode": "MAT-001",
        "name": "18mm MDF Board",
        "type": "SHEET",
        "category": "Board",
        "unit": "SHEET",
        "availableQuantity": 120,
        "reservedQuantity": 20,
        "warehouse": {"id": 1, "name": "Main Warehouse"},
        "createdAt": "2026-02-20T08:00:00.000Z",
        "updatedAt": "2026-02-23T10:00:00.000Z",
      },
      {
        "id": 2,
        "companyId": 1,
        "itemCode": "HW-001",
        "name": "Soft Close Hinges",
        "type": "HARDWARE",
        "category": "Fittings",
        "unit": "PIECE",
        "availableQuantity": 500,
        "reservedQuantity": 50,
        "warehouse": {"id": 2, "name": "Hardware Store"},
        "createdAt": "2026-02-18T09:00:00.000Z",
        "updatedAt": "2026-02-22T11:00:00.000Z",
      },
    ],
    "meta": {"page": 1, "limit": 10, "total": 2},
  };
}
