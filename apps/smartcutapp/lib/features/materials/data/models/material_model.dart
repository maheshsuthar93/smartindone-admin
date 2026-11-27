class MaterialModel {
  const MaterialModel({
    required this.id,
    required this.companyId,
    required this.name,
    required this.code,
    required this.type,
    required this.unit,
    required this.isActive,
    this.thickness,
    this.createdAt,
    this.updatedAt,
  });

  final String id;
  final String companyId;
  final String name;
  final String code;
  final String type;
  final String unit;
  final bool isActive;
  final double? thickness;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  factory MaterialModel.fromJson(Map<String, dynamic> json) => MaterialModel(
    id: json['id'] as String,
    companyId: json['companyId'] as String,
    name: json['name'] as String,
    code: json['code'] as String,
    type: json['type'] as String,
    unit: json['unit'] as String,
    isActive: json['isActive'] as bool? ?? true,
    thickness: (json['thickness'] as num?)?.toDouble(),
    createdAt: json['createdAt'] == null
        ? null
        : DateTime.tryParse(json['createdAt'] as String),
    updatedAt: json['updatedAt'] == null
        ? null
        : DateTime.tryParse(json['updatedAt'] as String),
  );
}
