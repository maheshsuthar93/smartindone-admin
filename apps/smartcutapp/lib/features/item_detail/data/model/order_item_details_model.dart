import 'package:board_cut/core/core.dart';

class OrderItemDetailsModel {
  const OrderItemDetailsModel({
    required this.id,
    required this.orderId,
    required this.name,
    required this.quantity,
    required this.createdAt,
    this.itemNumber = 0,
    this.allocationStrategy = 'AUTO',
    this.overallWidth,
    this.overallHeight,
    this.overallDepth,
    this.updatedAt,
    this.progress,
  });

  final String id;
  final int itemNumber;
  final String orderId;
  final String name;
  final String allocationStrategy;
  final double? overallWidth;
  final double? overallHeight;
  final double? overallDepth;
  final int quantity;
  final DateTime createdAt;
  final DateTime? updatedAt;
  final ItemProgressDetailsModel? progress;

  factory OrderItemDetailsModel.fromJson(Map<String, dynamic> json) =>
      OrderItemDetailsModel(
        id: json['id'] as String,
        itemNumber: (json['itemNumber'] as num?)?.toInt() ?? 0,
        orderId: json['orderId'] as String,
        name: json['name'] as String,
        allocationStrategy: json['allocationStrategy'] as String? ?? 'AUTO',
        overallWidth: (json['overallWidth'] as num?)?.toDouble(),
        overallHeight: (json['overallHeight'] as num?)?.toDouble(),
        overallDepth: (json['overallDepth'] as num?)?.toDouble(),
        quantity: (json['quantity'] as num).toInt(),
        createdAt: DateTime.parse(json['createdAt'] as String),
        updatedAt: json['updatedAt'] == null
            ? null
            : DateTime.parse(json['updatedAt'] as String),
        progress: json['progress'] == null
            ? null
            : ItemProgressDetailsModel.fromJson(
                json['progress'] as Map<String, dynamic>,
              ),
      );
}

class ItemProgressDetailsModel {
  const ItemProgressDetailsModel({
    required this.status,
    required this.totalPieces,
    required this.completedPieces,
    required this.pendingPieces,
    required this.progressPercent,
    this.stages,
  });

  final ItemStatus status;
  final int totalPieces;
  final int completedPieces;
  final int pendingPieces;
  final double progressPercent;
  final List<ItemStageDetailsModel>? stages;

  factory ItemProgressDetailsModel.fromJson(Map<String, dynamic> json) =>
      ItemProgressDetailsModel(
        status: _itemStatus(json['status'] as String?),
        totalPieces: (json['totalPieces'] as num?)?.toInt() ?? 0,
        completedPieces: (json['completedPieces'] as num?)?.toInt() ?? 0,
        pendingPieces: (json['pendingPieces'] as num?)?.toInt() ?? 0,
        progressPercent: (json['progressPercent'] as num?)?.toDouble() ?? 0,
        stages: (json['stages'] as List<dynamic>?)
            ?.map(
              (stage) =>
                  ItemStageDetailsModel.fromJson(stage as Map<String, dynamic>),
            )
            .toList(),
      );
}

class ItemStageDetailsModel {
  const ItemStageDetailsModel({
    required this.name,
    required this.total,
    required this.completed,
    required this.progressPercent,
  });

  final String name;
  final int total;
  final int completed;
  final double progressPercent;

  factory ItemStageDetailsModel.fromJson(Map<String, dynamic> json) =>
      ItemStageDetailsModel(
        name: json['name'] as String,
        total: (json['total'] as num).toInt(),
        completed: (json['completed'] as num).toInt(),
        progressPercent: (json['progressPercent'] as num).toDouble(),
      );
}

ItemStatus _itemStatus(String? value) => switch (value) {
  'PENDING' => ItemStatus.pending,
  'IN_PROGRESS' => ItemStatus.inProgress,
  'COMPLETED' => ItemStatus.completed,
  _ => ItemStatus.unknown,
};
