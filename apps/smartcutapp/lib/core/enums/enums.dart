import 'package:freezed_annotation/freezed_annotation.dart';

@JsonEnum(alwaysCreate: true)
enum UserRole {
  @JsonValue('SUPER_ADMIN')
  superAdmin,
  @JsonValue('ADMIN')
  admin,
  @JsonValue('MANAGER')
  manager,
  @JsonValue('OPERATOR')
  operator,
  @JsonValue('SALES')
  sales,
}

@JsonEnum(alwaysCreate: true)
enum UserStatus {
  @JsonValue('ACTIVE')
  active,
  @JsonValue('INACTIVE')
  inActive,
  @JsonValue('SUSPENDED')
  suspended,
}

@JsonEnum(alwaysCreate: true)
enum CustomerStatus {
  @JsonValue('ACTIVE')
  active,
  @JsonValue('INACTIVE')
  inActive,
}

@JsonEnum(alwaysCreate: true)
enum OrderStatus {
  @JsonValue('DRAFT')
  draft,
  @JsonValue('APPROVED')
  approved,
  @JsonValue('IN_PRODUCTION')
  inProduction,
  @JsonValue('COMPLETED')
  completed,
  @JsonValue('SHIPPED')
  shipped,
  @JsonValue('DELIVERED')
  delivered,
  @JsonValue('CANCELLED')
  cancelled,
}

@JsonEnum(alwaysCreate: true)
enum ProjectStatus {
  @JsonValue('PLANNING')
  planning,
  @JsonValue('IN_PROGRESS')
  inProgress,
  @JsonValue('ON_HOLD')
  onHold,
  @JsonValue('COMPLETED')
  completed,
  @JsonValue('CANCELLED')
  cancelled,
  @JsonValue('UNKNOWN')
  unknown,
}

@JsonEnum(alwaysCreate: true)
enum ProductionStatus {
  @JsonValue('PENDING')
  pending,
  @JsonValue('IN_PROGRESS')
  inProgress,
  @JsonValue('DONE')
  done,
  @JsonValue('REJECTED')
  rejected,
  @JsonValue('UNKNOWN')
  unknown,
}

@JsonEnum(alwaysCreate: true)
enum SheetType {
  @JsonValue('FULL')
  full,
  @JsonValue('OFFCUT')
  offcut,
  @JsonValue('UNKNOWN')
  unknown,
}

@JsonEnum(alwaysCreate: true)
enum SheetStatus {
  @JsonValue('AVAILABLE')
  available,
  @JsonValue('RESERVED')
  reserved,
  @JsonValue('IN_PRODUCTION')
  inProduction,
  @JsonValue('USED')
  used,
  @JsonValue('SCRAPPED')
  scraped,
  @JsonValue('UNKNOWN')
  unknown,
}

@JsonEnum(alwaysCreate: true)
enum HardwareType {
  @JsonValue('HINGE')
  hinge,
  @JsonValue('HANDLE')
  handle,
  @JsonValue('CHANNEL')
  channel,
  @JsonValue('LOCK')
  lock,
  @JsonValue('SCREW')
  screw,
  @JsonValue('CONNECTOR')
  connector,
  @JsonValue('GAS_SPRING')
  gasSpring,
  @JsonValue('OTHER')
  other,
}

@JsonEnum(alwaysCreate: true)
enum HardwareUnit {
  @JsonValue('PCS')
  pcs,
  @JsonValue('BOX')
  box,
  @JsonValue('PACK')
  pack,
  @JsonValue('SET')
  set,
  @JsonValue('PAIR')
  pair,
  @JsonValue('METER')
  meter,
  @JsonValue('KG')
  kg,
}

enum MachineType {
  @JsonValue('CNC')
  cnc,
  @JsonValue('PANEL_SAW')
  panelSaw,
  @JsonValue('EDGE_BANDER')
  edgeBander,
  @JsonValue('DRILLING')
  drilling,
  @JsonValue('OTHER')
  other,
}

@JsonEnum(alwaysCreate: true)
enum InventoryStatus {
  @JsonValue('AVAILABLE')
  available,
  @JsonValue('RESERVED')
  reserved,
  @JsonValue('USED')
  used,
  @JsonValue('SCRAP')
  scrap,
}

@JsonEnum(alwaysCreate: true)
enum StockMovementType {
  @JsonValue('ADMIN')
  inStock,
  @JsonValue('OUT')
  out,
  @JsonValue('ADJUSTMENT')
  reserve,
  @JsonValue('RELEASE')
  release,
  @JsonValue('ADJUSTMENT')
  adjustment,
  @JsonValue('UNKNOWN')
  unknown,
}

@JsonEnum(alwaysCreate: true)
enum ShipmentStatus {
  @JsonValue('PENDING')
  pending,
  @JsonValue('DISPATCHED')
  dispatched,
  @JsonValue('IN_TRANSIT')
  inTransit,
  @JsonValue('DELIVERED')
  delivered,
  @JsonValue('CANCELLED')
  cancelled,
  @JsonValue('UNKNOWN')
  unknown,
}

@JsonEnum(alwaysCreate: true)
enum DriverStatus {
  @JsonValue('ADMIN')
  active,
  @JsonValue('INACTIVE')
  inactive,
  @JsonValue('ON_LEAVE')
  onLeave,
  @JsonValue('UNKNOWN')
  unknown,
}

@JsonEnum(alwaysCreate: true)
enum BoardStatus {
  @JsonValue('ADMIN')
  pending,
  @JsonValue('IN_CUTTING')
  cutting,
  @JsonValue('CUT_DONE')
  cutDone,
  @JsonValue('CANCELLED')
  cancelled,
  @JsonValue('UNKNOWN')
  unknown,
}

@JsonEnum(alwaysCreate: true)
enum AllocationStrategy {
  @JsonValue('ADMIN')
  auto,
  @JsonValue('OFFCUT_ONLY')
  offcutOnly,
  @JsonValue('FULL_SHEET_ONLY')
  fullSheetOnly,
  @JsonValue('MIN_WASTE')
  offcutPriority,
  @JsonValue('MIN_WASTE')
  minWaste,
  @JsonValue('UNKNOWN')
  unknown,
}

@JsonEnum(alwaysCreate: true)
enum PackageStatus {
  @JsonValue('ADMIN')
  packing,
  @JsonValue('PACKED')
  packed,
  @JsonValue('LOADED')
  loaded,
  @JsonValue('UNKNOWN')
  unknown,
}

@JsonEnum(alwaysCreate: true)
enum PackingStatus {
  @JsonValue('ADMIN')
  notPacked,
  @JsonValue('PACKED')
  packed,
  @JsonValue('SHIPPED')
  shipped,
  @JsonValue('UNKNOWN')
  unknown,
}

@JsonEnum(alwaysCreate: true)
enum InventoryType {
  @JsonValue('SHEET')
  sheet,
  @JsonValue('HARDWARE')
  hardware,
  @JsonValue('OFFCUT')
  offcut,
  @JsonValue('FINISHED_GOOD')
  finishedGood,
  @JsonValue('UNKNOWN')
  unknown,
}

@JsonEnum(alwaysCreate: true)
enum MaterialType {
  @JsonValue('MDF')
  mdf,
  @JsonValue('HDHMR')
  hdhmr,
  @JsonValue('PLYWOOD')
  plywood,
  @JsonValue('PARTICLE_BOARD')
  particleBoard,
  @JsonValue('LAMINATE')
  laminate,
  @JsonValue('ACRYLIC')
  acrylic,
  @JsonValue('ALUMINIUM')
  aluminium,
  @JsonValue('OTHER')
  other,
  @JsonValue('CONSUMABLE')
  consumable,
  @JsonValue('UNKNOWN')
  unknown,
}

enum ScreenType { mobile, tablet, desktop }

@JsonEnum(alwaysCreate: true)
enum PieceStatus {
  @JsonValue('PENDING')
  pending,
  @JsonValue('IN_PROGRESS')
  inProgress,
  @JsonValue('FAILED')
  failed,
  @JsonValue('COMPLETED')
  completed,
}

@JsonEnum(alwaysCreate: true)
enum WarehouseStatus {
  @JsonValue('ACTIVE')
  active,
  @JsonValue('INACTIVE')
  inActive,
  @JsonValue('UNDER_MAINTENANCE')
  underMaintenance,
}

@JsonEnum(alwaysCreate: true)
enum OptimizationStatus {
  @JsonValue('DRAFT')
  draft,
  @JsonValue('IN_PROGRESS')
  inProgress,
  @JsonValue('COMPLETED')
  completed,
  @JsonValue('CANCELLED')
  cancelled,
  @JsonValue('UNKNOWN')
  unknown,
}

@JsonEnum(alwaysCreate: true)
enum MaterialGroupStatus {
  @JsonValue('READY')
  ready,
  @JsonValue('OPTIMIZING')
  optimizing,
  @JsonValue('COMPLETED')
  completed,
  @JsonValue('FAILED')
  failed,
  @JsonValue('UNKNOWN')
  unknown,
}

@JsonEnum(alwaysCreate: true)
enum LayoutStatus {
  @JsonValue('GENERATED')
  generated,
  @JsonValue('SELECTED')
  selected,
  @JsonValue('IN_PRODUCTION')
  inProduction,
  @JsonValue('COMPLETED')
  completed,
  @JsonValue('CANCELLED')
  cancelled,
  @JsonValue('UNKNOWN')
  unknown,
}

@JsonEnum(alwaysCreate: true)
enum GrainDirection {
  @JsonValue('LENGTH')
  length,
  @JsonValue('WIDTH')
  width,
  @JsonValue('NONE')
  none,
}

extension GrainDirectionLabel on GrainDirection {
  String get label => switch (this) {
    GrainDirection.length => 'Length',
    GrainDirection.width => 'Width',
    GrainDirection.none => 'None',
  };
}

@JsonEnum(alwaysCreate: true)
enum ProcessStatus {
  @JsonValue('PENDING')
  pending,
  @JsonValue('IN_PROGRESS')
  inProgress,
  @JsonValue('COMPLETED')
  completed,
  @JsonValue('FAILED')
  failed,
}

@JsonEnum(alwaysCreate: true)
enum RemainingAreaStatus {
  @JsonValue('PENDING')
  pending,
  @JsonValue('OFFCUT')
  offcut,
  @JsonValue('SCRAP')
  scrap,
}

@JsonEnum(alwaysCreate: true)
enum ItemStatus {
  @JsonValue('PENDING')
  pending,
  @JsonValue('IN_PROGRESS')
  inProgress,
  @JsonValue('COMPLETED')
  completed,
  @JsonValue('UNKNOWN')
  unknown,
}
