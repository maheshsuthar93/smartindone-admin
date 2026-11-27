class FactoryModel {
  const FactoryModel({
    required this.id,
    required this.name,
    required this.code,
    required this.companyId,
    required this.isActive,
    required this.createdAt,
    required this.updatedAt,
    this.address,
    this.city,
    this.state,
    this.phone,
    this.email,
    this.kerf,
    this.warehouseCount = 0,
    this.orderCount = 0,
  });

  final String id;
  final String name;
  final String code;
  final String companyId;
  final String? address;
  final String? city;
  final String? state;
  final String? phone;
  final String? email;
  final double? kerf;
  final bool isActive;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int warehouseCount;
  final int orderCount;

  factory FactoryModel.fromJson(Map<String, dynamic> json) {
    final counts = json['_count'] as Map<String, dynamic>? ?? const {};
    return FactoryModel(
      id: json['id'] as String,
      name: json['name'] as String,
      code: json['code'] as String,
      companyId: json['companyId'] as String,
      address: json['address'] as String?,
      city: json['city'] as String?,
      state: json['state'] as String?,
      phone: json['phone'] as String?,
      email: json['email'] as String?,
      kerf: (json['kerf'] as num?)?.toDouble(),
      isActive: json['isActive'] as bool? ?? true,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      warehouseCount: (counts['warehouses'] as num?)?.toInt() ?? 0,
      orderCount: (counts['orders'] as num?)?.toInt() ?? 0,
    );
  }
}
