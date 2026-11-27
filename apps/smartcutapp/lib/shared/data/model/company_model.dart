class CompanyModel {
  const CompanyModel({
    required this.id,
    required this.name,
    required this.createdAt,
    this.updatedAt,
    this.isActive = true,
    this.serviceType,
    this.ownerName,
    this.ownerEmail,
    this.ownerPhone,
  });

  final String id;
  final String name;
  final DateTime createdAt;
  final DateTime? updatedAt;
  final bool isActive;
  final String? serviceType;
  final String? ownerName;
  final String? ownerEmail;
  final String? ownerPhone;

  factory CompanyModel.fromJson(Map<String, dynamic> json) => CompanyModel(
    id: json['id'] as String,
    name: json['name'] as String,
    createdAt: DateTime.parse(json['createdAt'] as String),
    updatedAt: json['updatedAt'] == null
        ? null
        : DateTime.parse(json['updatedAt'] as String),
    isActive: json['isActive'] as bool? ?? true,
    serviceType: json['serviceType'] as String?,
    ownerName: json['ownerName'] as String?,
    ownerEmail: json['ownerEmail'] as String?,
    ownerPhone: json['ownerPhone'] as String?,
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'createdAt': createdAt.toIso8601String(),
    'updatedAt': updatedAt?.toIso8601String(),
    'isActive': isActive,
    'serviceType': serviceType,
    'ownerName': ownerName,
    'ownerEmail': ownerEmail,
    'ownerPhone': ownerPhone,
  };
}
