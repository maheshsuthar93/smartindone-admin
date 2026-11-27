part of 'route_config.dart';

@TypedShellRoute<BasePageRoute>(
  routes: [
    TypedGoRoute<DashboardPageRoute>(path: '/'),
    TypedGoRoute<OrdersPageRoute>(
      path: '/orders',
      routes: [
        TypedGoRoute<OrderDetailPageRoute>(
          path: 'order-detail/:orderId',
          routes: [
            TypedGoRoute<CreateItemPageRoute>(path: 'add-item/:orderId'),
            TypedGoRoute<UploadItemsPageRoute>(path: 'upload-items/:orderId'),
            TypedGoRoute<ItemDetailPageRoute>(
              path: 'item-detail/:itemId',
              routes: [
                TypedGoRoute<CreatePartPageRoute>(path: 'add-part/:itemId'),
                TypedGoRoute<PartDetailPageRoute>(
                  path: 'part-detail/:partId',
                  routes: [
                    // TypedGoRoute<BoardsPageRoute>(
                    //   path: 'boards/:partId',
                    //   routes: [
                    //     TypedGoRoute<LayoutViewPageRoute>(
                    //       path: 'layout-view/:boardId',
                    //     ),
                    //   ],
                    // ),
                  ],
                ),
              ],
            ),
          ],
        ),
        TypedGoRoute<CreateOrderPageRoute>(path: 'create-order'),
      ],
    ),
    TypedGoRoute<OptimizationsPageRoute>(
      path: '/optimizations/:orderId',
      routes: [
        TypedGoRoute<LayoutViewPageRoute>(path: 'layout-view/:materialId'),
      ],
    ),
    TypedGoRoute<CustomersPageRoute>(
      path: '/customers',
      routes: [
        TypedGoRoute<CustomerDetailPageRoute>(
          path: 'customer-detail/:customerId',
          routes: [],
        ),
        TypedGoRoute<CreateCustomerPageRoute>(path: 'create-customer'),
      ],
    ),
    TypedGoRoute<ProjectsPageRoute>(
      path: '/projects',
      routes: [
        TypedGoRoute<CreateProjectPageRoute>(path: 'add-project'),
        TypedGoRoute<ProjectDetailPageRoute>(path: 'project-detail/:projectId'),
      ],
    ),
    TypedGoRoute<ShipmentsPageRoute>(
      path: '/shipments',
      routes: [
        TypedGoRoute<CreateShipmentPageRoute>(path: 'create-shipment'),
        TypedGoRoute<ShipmentDetailPageRoute>(
          path: 'shipment-detail/:shipmentId',
          routes: [
            TypedGoRoute<CreatePackagePageRoute>(path: 'create-package'),
          ],
        ),
      ],
    ),
    TypedGoRoute<InventoriesPageRoute>(
      path: '/inventories',
      routes: [
        TypedGoRoute<CreateInventoryPageRoute>(path: 'add-inventories'),
        TypedGoRoute<InventoryDetailPageRoute>(
          path: 'inventories-detail/:inventoryId',
        ),
      ],
    ),
    TypedGoRoute<MaterialsPageRoute>(
      path: '/materials',
      routes: [TypedGoRoute<MaterialFormPageRoute>(path: 'create-material')],
    ),
    TypedGoRoute<HardwaresPageRoute>(path: '/hardwares'),
    TypedGoRoute<DriversPageRoute>(path: '/drivers'),
    TypedGoRoute<InventoryTransactionsPageRoute>(
      path: '/inventory-transactions',
    ),
    TypedGoRoute<PhysicalSheetsPageRoute>(
      path: '/sheets',
      routes: [TypedGoRoute<PhysicalSheetFormPageRoute>(path: 'create-sheet')],
    ),
    TypedGoRoute<OptimizationWorkspacePageRoute>(
      path: '/optimization-workspace',
    ),
    TypedGoRoute<ShopFloorPageRoute>(path: '/shop-floor'),
    TypedGoRoute<UsersPageRoute>(
      path: '/users',
      routes: [
        TypedGoRoute<CreateUserPageRoute>(path: 'add-user'),
        // TypedGoRoute<InventoryDetailPageRoute>(
        //   path: 'inventory-detail/:inventoryId',
        // ),
      ],
    ),
    TypedGoRoute<WarehousesPageRoute>(
      path: '/ware-houses',
      routes: [
        TypedGoRoute<CreateWarehousePageRoute>(path: 'add-warehouse'),
        TypedGoRoute<WarehouseDetailPageRoute>(
          path: 'warehouse-detail/:warehouseId',
        ),
      ],
    ),
    TypedGoRoute<FactoriesPageRoute>(
      path: '/factories',
      routes: [TypedGoRoute<FactoryFormPageRoute>(path: 'add-factory')],
    ),
    TypedGoRoute<MachinesPageRoute>(
      path: '/machines',
      routes: [TypedGoRoute<MachineFormPageRoute>(path: 'create-machine')],
    ),
    TypedGoRoute<CompaniesPageRoute>(
      path: '/companies',
      routes: [TypedGoRoute<CompanyFormPageRoute>(path: 'add-company')],
    ),
    TypedGoRoute<ProcessTypesPageRoute>(
      path: '/process-types',
      routes: [
        TypedGoRoute<ProcessTypeFormPageRoute>(path: 'create-process-type'),
      ],
    ),
    TypedGoRoute<SettingsPageRoute>(path: '/settings', routes: []),
  ],
)
class BasePageRoute extends ShellRouteData {
  const BasePageRoute();

  /// REQUIRED for shell navigation
  static final GlobalKey<NavigatorState> $navigatorKey =
      GlobalKey<NavigatorState>();

  @override
  Widget builder(BuildContext context, GoRouterState state, Widget navigator) {
    return BasePage(child: navigator);
  }
}

@immutable
class OrdersPageRoute extends GoRouteData with $OrdersPageRoute {
  const OrdersPageRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const OrdersPage();
  }
}

@immutable
class MaterialsPageRoute extends GoRouteData with $MaterialsPageRoute {
  const MaterialsPageRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const MaterialsPage();
}

@immutable
class MaterialFormPageRoute extends GoRouteData with $MaterialFormPageRoute {
  const MaterialFormPageRoute([this.$extra]);

  final MaterialModel? $extra;

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) =>
      DialogPage(builder: (_) => MaterialFormPage(material: $extra));
}

@immutable
class HardwaresPageRoute extends GoRouteData with $HardwaresPageRoute {
  const HardwaresPageRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const HardwaresPage();
}

@immutable
class MachinesPageRoute extends GoRouteData with $MachinesPageRoute {
  const MachinesPageRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const MachinesPage();
}

@immutable
class MachineFormPageRoute extends GoRouteData with $MachineFormPageRoute {
  const MachineFormPageRoute(this.$extra);

  final WidgetBuilder $extra;

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) =>
      DialogPage(builder: $extra);
}

@immutable
class DriversPageRoute extends GoRouteData with $DriversPageRoute {
  const DriversPageRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const DriversPage();
}

@immutable
class InventoryTransactionsPageRoute extends GoRouteData
    with $InventoryTransactionsPageRoute {
  const InventoryTransactionsPageRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const InventoryTransactionsPage();
}

@immutable
class PhysicalSheetsPageRoute extends GoRouteData
    with $PhysicalSheetsPageRoute {
  const PhysicalSheetsPageRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const PhysicalSheetsPage();
}

@immutable
class PhysicalSheetFormPageRoute extends GoRouteData
    with $PhysicalSheetFormPageRoute {
  const PhysicalSheetFormPageRoute(this.$extra);

  final WidgetBuilder $extra;

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) =>
      CustomTransitionPage<void>(
        key: state.pageKey,
        opaque: false,
        barrierDismissible: true,
        barrierColor: Colors.black.withAlpha(150),
        child: Dialog(
          backgroundColor: Colors.transparent,
          surfaceTintColor: Colors.transparent,
          elevation: 0,
          child: Builder(builder: $extra),
        ),
        transitionsBuilder: (context, animation, secondaryAnimation, child) =>
            FadeTransition(opacity: animation, child: child),
      );
}

@immutable
class CustomerDetailPageRoute extends GoRouteData
    with $CustomerDetailPageRoute {
  const CustomerDetailPageRoute(this.customerId);

  final String customerId;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return CustomerDetailPage(customerId: customerId);
  }
}

@immutable
class ShipmentDetailPageRoute extends GoRouteData
    with $ShipmentDetailPageRoute {
  const ShipmentDetailPageRoute(this.shipmentId);

  final String shipmentId;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return ShipmentDetailPage(shipmentId: shipmentId);
  }
}

@immutable
class InventoryDetailPageRoute extends GoRouteData
    with $InventoryDetailPageRoute {
  const InventoryDetailPageRoute(this.inventoryId);

  final String inventoryId;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const InventoryDetailPage();
  }
}

@immutable
class CreatePackagePageRoute extends GoRouteData with $CreatePackagePageRoute {
  const CreatePackagePageRoute(this.shipmentId, this.$extra);

  final String shipmentId;
  final Map<String, dynamic> $extra;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    final extra = state.extra as Map<String, dynamic>?;
    return CreatePackagePage(
      shipmentId: shipmentId,
      orderId: extra?['orderId'] ?? '',
      packageId: extra?['packageId'],
    );
  }
}

@immutable
class CreateOrderPageRoute extends GoRouteData with $CreateOrderPageRoute {
  const CreateOrderPageRoute();

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    final order = state.extra;
    return DialogPage(
      builder: (_) =>
          CreateOrderPage(order: order is OrderModel ? order : null),
    );
  }
}

@immutable
class CreateShipmentPageRoute extends GoRouteData
    with $CreateShipmentPageRoute {
  const CreateShipmentPageRoute();

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) => DialogPage(
    builder: (_) =>
        CreateShipmentPage(shipmentId: state.uri.queryParameters['shipmentId']),
  );
}

@immutable
class DashboardPageRoute extends GoRouteData with $DashboardPageRoute {
  const DashboardPageRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const DashboardPage();
  }
}

@immutable
class OrderDetailPageRoute extends GoRouteData with $OrderDetailPageRoute {
  const OrderDetailPageRoute({required this.orderId});

  final String orderId;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return OrderDetailPage(orderId: orderId);
  }
}

@immutable
class ProjectDetailPageRoute extends GoRouteData with $ProjectDetailPageRoute {
  const ProjectDetailPageRoute({required this.projectId});

  final String projectId;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return ProjectDetailPage(projectId: projectId);
  }
}

@immutable
class CreateItemPageRoute extends GoRouteData with $CreateItemPageRoute {
  const CreateItemPageRoute(this.orderId);

  final String orderId;

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) => DialogPage(
    builder: (_) => CreateItemPage(
      orderId: orderId,
      itemId: state.uri.queryParameters['itemId'],
      onSaved: state.extra is Future<void> Function()
          ? state.extra as Future<void> Function()
          : null,
    ),
  );
}

@immutable
class UploadItemsPageRoute extends GoRouteData with $UploadItemsPageRoute {
  const UploadItemsPageRoute(this.orderId);

  final String orderId;

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) =>
      DialogPage(builder: (_) => UploadItemsPage());
}

@immutable
class CreatePartPageRoute extends GoRouteData with $CreatePartPageRoute {
  const CreatePartPageRoute(this.itemId, this.orderId, this.partId);

  final String itemId;
  final String orderId;
  final String partId;

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) => DialogPage(
    builder: (_) =>
        CreatePartPage(itemId: itemId, partId: partId.isEmpty ? null : partId),
  );
}

@immutable
class ItemDetailPageRoute extends GoRouteData with $ItemDetailPageRoute {
  const ItemDetailPageRoute(this.itemId, this.orderId, this.$extra);

  final String itemId;
  final String orderId;
  final Map<String, dynamic>? $extra;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    var clientName = '';
    var projectName = '';
    var orderCode = '';

    final extra = state.extra as Map<String, dynamic>?;
    if (extra != null) {
      clientName = extra['clientName'] ?? '';
      projectName = extra['projectName'] ?? '';
      orderCode = extra['orderCode'] ?? '';
    }
    return ItemDetailPage(
      itemId: itemId,
      orderId: orderId,
      orderCode: orderCode,
      projectName: projectName,
      clientName: clientName,
    );
  }
}

@immutable
class PartDetailPageRoute extends GoRouteData with $PartDetailPageRoute {
  const PartDetailPageRoute(
    this.partId,
    this.itemId,
    this.orderId,
    this.$extra,
  );

  final String itemId;
  final String orderId;
  final String partId;
  final Map<String, dynamic> $extra;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return PartDetailPage(partId: partId, itemId: itemId, orderId: orderId);
  }
}

// @immutable
// class BoardsPageRoute extends GoRouteData with $BoardsPageRoute {
//   const BoardsPageRoute(this.cutId, this.itemId, this.orderId, this.partId);
//
//   final String itemId;
//   final String orderId;
//   final String cutId;
//   final String partId;
//
//   @override
//   Widget build(BuildContext context, GoRouterState state) {
//     return const BoardsPage();
//   }
// }

@immutable
class LayoutViewPageRoute extends GoRouteData with $LayoutViewPageRoute {
  const LayoutViewPageRoute(this.materialId, this.orderId, this.$extra);

  final String materialId;
  final String orderId;
  final Map<String, dynamic> $extra;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return LayoutViewPage(optimizationMaterialGroupId: materialId);
  }
}

@immutable
class CustomersPageRoute extends GoRouteData with $CustomersPageRoute {
  const CustomersPageRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const CustomersPage();
  }
}

@immutable
class ProjectsPageRoute extends GoRouteData with $ProjectsPageRoute {
  const ProjectsPageRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const ProjectsPage();
  }
}

@immutable
class UsersPageRoute extends GoRouteData with $UsersPageRoute {
  const UsersPageRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const UsersPage();
  }
}

@immutable
class SettingsPageRoute extends GoRouteData with $SettingsPageRoute {
  const SettingsPageRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const SettingsPage();
  }
}

@immutable
class WarehousesPageRoute extends GoRouteData with $WarehousesPageRoute {
  const WarehousesPageRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const WarehousesPage();
  }
}

@immutable
class FactoriesPageRoute extends GoRouteData with $FactoriesPageRoute {
  const FactoriesPageRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const FactoriesPage();
}

@immutable
class FactoryFormPageRoute extends GoRouteData with $FactoryFormPageRoute {
  const FactoryFormPageRoute(this.$extra);

  final FactoryModel? $extra;

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) =>
      DialogPage(builder: (_) => FactoryFormPage(factory: $extra));
}

@immutable
class CompaniesPageRoute extends GoRouteData with $CompaniesPageRoute {
  const CompaniesPageRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const CompaniesPage();
}

@immutable
class ProcessTypesPageRoute extends GoRouteData with $ProcessTypesPageRoute {
  const ProcessTypesPageRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const ProcessTypesPage();
}

@immutable
class ProcessTypeFormPageRoute extends GoRouteData
    with $ProcessTypeFormPageRoute {
  const ProcessTypeFormPageRoute(this.$extra);

  final WidgetBuilder $extra;

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) =>
      DialogPage(builder: $extra);
}

@immutable
class CompanyFormPageRoute extends GoRouteData with $CompanyFormPageRoute {
  const CompanyFormPageRoute(this.$extra);

  final CompanyModel? $extra;

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) =>
      DialogPage(builder: (_) => CompanyFormPage(company: $extra));
}

@immutable
class CreateWarehousePageRoute extends GoRouteData
    with $CreateWarehousePageRoute {
  const CreateWarehousePageRoute([this.$extra]);

  final WarehouseModel? $extra;

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) =>
      DialogPage(builder: (_) => CreateWarehousePage(warehouse: $extra));
}

@immutable
class WarehouseDetailPageRoute extends GoRouteData
    with $WarehouseDetailPageRoute {
  const WarehouseDetailPageRoute(this.warehouseId);

  final String warehouseId;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const WarehouseDetailPage();
  }
}

@immutable
class CreateUserPageRoute extends GoRouteData with $CreateUserPageRoute {
  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    final user = state.extra;
    return DialogPage(
      builder: (_) => CreateUserPage(user: user is UserModel ? user : null),
    );
  }
}

@immutable
class InventoriesPageRoute extends GoRouteData with $InventoriesPageRoute {
  const InventoriesPageRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const InventoriesPage();
  }
}

@immutable
class ShipmentsPageRoute extends GoRouteData with $ShipmentsPageRoute {
  const ShipmentsPageRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const ShipmentsPage();
  }
}

@immutable
class OptimizationsPageRoute extends GoRouteData with $OptimizationsPageRoute {
  const OptimizationsPageRoute(this.orderId);

  final String orderId;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return OptimizationsPage(orderId: orderId);
  }
}

@immutable
class OptimizationWorkspacePageRoute extends GoRouteData
    with $OptimizationWorkspacePageRoute {
  const OptimizationWorkspacePageRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const OptimizationWorkspacePage();
}

@immutable
class ShopFloorPageRoute extends GoRouteData with $ShopFloorPageRoute {
  const ShopFloorPageRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const ShopFloorPage();
}

@immutable
class CreateProjectPageRoute extends GoRouteData with $CreateProjectPageRoute {
  const CreateProjectPageRoute();

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) => DialogPage(
    builder: (_) => CreateProjectPage(
      projectId: state.uri.queryParameters['projectId'],
      readOnly: state.uri.queryParameters['readOnly'] == 'true',
      customerId: state.uri.queryParameters['customerId'],
    ),
  );
}

@immutable
class CreateInventoryPageRoute extends GoRouteData
    with $CreateInventoryPageRoute {
  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) =>
      DialogPage(builder: (_) => CreateInventoryPage());
}

@immutable
class CreateCustomerPageRoute extends GoRouteData
    with $CreateCustomerPageRoute {
  const CreateCustomerPageRoute();

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) => DialogPage(
    builder: (_) =>
        CreateCustomerPage(customerId: state.uri.queryParameters['customerId']),
  );
}
