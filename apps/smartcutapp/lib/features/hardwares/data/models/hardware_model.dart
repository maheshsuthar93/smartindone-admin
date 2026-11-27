class HardwareBalanceModel {
  const HardwareBalanceModel({
    required this.warehouseId,
    required this.warehouseName,
    required this.onHand,
    required this.reserved,
    this.minStock = 0,
  });

  final String warehouseId;
  final String warehouseName;
  final double onHand;
  final double reserved;
  final int minStock;

  double get available => onHand - reserved;

  factory HardwareBalanceModel.fromJson(Map<String, dynamic> json) {
    final warehouse = json['warehouse'] as Map<String, dynamic>? ?? const {};
    return HardwareBalanceModel(
      warehouseId: json['warehouseId'] as String? ?? '',
      warehouseName: warehouse['name'] as String? ?? 'Warehouse',
      onHand: (json['onHand'] as num?)?.toDouble() ?? 0,
      reserved: (json['reserved'] as num?)?.toDouble() ?? 0,
      minStock: (json['minStock'] as num?)?.toInt() ?? 0,
    );
  }
}

class HardwareModel {
  const HardwareModel({
    required this.id,
    required this.companyId,
    required this.name,
    required this.code,
    required this.type,
    required this.unit,
    required this.isActive,
    this.brand,
    this.finish,
    this.specification,
    this.inventoryBalances = const [],
  });

  final String id;
  final String companyId;
  final String name;
  final String code;
  final String type;
  final String unit;
  final String? brand;
  final String? finish;
  final String? specification;
  final bool isActive;
  final List<HardwareBalanceModel> inventoryBalances;

  double get availableStock => inventoryBalances.fold<double>(
    0,
    (sum, balance) => sum + balance.available,
  );

  factory HardwareModel.fromJson(Map<String, dynamic> json) => HardwareModel(
    id: json['id'] as String,
    companyId: json['companyId'] as String,
    name: json['name'] as String,
    code: json['code'] as String,
    type: json['type'] as String,
    unit: json['unit'] as String,
    brand: json['brand'] as String?,
    finish: json['finish'] as String?,
    specification: json['specification'] as String?,
    isActive: json['isActive'] as bool? ?? true,
    inventoryBalances: (json['inventoryBalances'] as List<dynamic>? ?? const [])
        .map(
          (item) => HardwareBalanceModel.fromJson(item as Map<String, dynamic>),
        )
        .toList(),
  );
}
