import 'package:board_cut/core/enums/enums.dart';

class CustomerModel {
  const CustomerModel({
    required this.id,
    required this.name,
    this.phone,
    this.email,
    this.address,
    this.contactName,
    this.contactPhone,
    this.contactEmail,
    this.companyId,
    this.projectCount = 0,
    this.orderCount = 0,
    this.status = CustomerStatus.active,
    this.createdAt,
    this.updatedAt,
  });

  final String id;
  final String name;
  final String? phone;
  final String? email;
  final String? address;
  final String? contactName;
  final String? contactPhone;
  final String? contactEmail;
  final String? companyId;
  final int projectCount;
  final int orderCount;
  final CustomerStatus status;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  factory CustomerModel.fromJson(Map<String, dynamic> json) {
    final counts = json['_count'] as Map<String, dynamic>? ?? const {};
    return CustomerModel(
      id: json['id'] as String,
      name: json['name'] as String,
      phone: json['phone'] as String?,
      email: json['email'] as String?,
      address: json['address'] as String?,
      contactName: json['contactName'] as String?,
      contactPhone: json['contactPhone'] as String?,
      contactEmail: json['contactEmail'] as String?,
      companyId: json['companyId'] as String?,
      projectCount: (counts['projects'] as num?)?.toInt() ?? 0,
      orderCount: (counts['orders'] as num?)?.toInt() ?? 0,
      status: switch (json['status'] as String?) {
        'INACTIVE' => CustomerStatus.inActive,
        _ => CustomerStatus.active,
      },
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'phone': phone,
    'email': email,
    'address': address,
    'contactName': contactName,
    'contactPhone': contactPhone,
    'contactEmail': contactEmail,
    'companyId': companyId,
    'status': status == CustomerStatus.active ? 'ACTIVE' : 'INACTIVE',
    'createdAt': createdAt?.toIso8601String(),
    'updatedAt': updatedAt?.toIso8601String(),
  };
}
