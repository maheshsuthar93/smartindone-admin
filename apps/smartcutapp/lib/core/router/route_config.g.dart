// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'route_config.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [$basePageRoute, $loginPageRoute];

RouteBase get $basePageRoute => ShellRouteData.$route(
  navigatorKey: BasePageRoute.$navigatorKey,
  factory: $BasePageRouteExtension._fromState,
  routes: [
    GoRouteData.$route(
      path: '/',
      hasOverriddenOnExit: false,
      factory: $DashboardPageRoute._fromState,
    ),
    GoRouteData.$route(
      path: '/orders',
      hasOverriddenOnExit: false,
      factory: $OrdersPageRoute._fromState,
      routes: [
        GoRouteData.$route(
          path: 'order-detail/:orderId',
          hasOverriddenOnExit: false,
          factory: $OrderDetailPageRoute._fromState,
          routes: [
            GoRouteData.$route(
              path: 'add-item/:orderId',
              hasOverriddenOnExit: false,
              factory: $CreateItemPageRoute._fromState,
            ),
            GoRouteData.$route(
              path: 'upload-items/:orderId',
              hasOverriddenOnExit: false,
              factory: $UploadItemsPageRoute._fromState,
            ),
            GoRouteData.$route(
              path: 'item-detail/:itemId',
              hasOverriddenOnExit: false,
              factory: $ItemDetailPageRoute._fromState,
              routes: [
                GoRouteData.$route(
                  path: 'add-part/:itemId',
                  hasOverriddenOnExit: false,
                  factory: $CreatePartPageRoute._fromState,
                ),
                GoRouteData.$route(
                  path: 'part-detail/:partId',
                  hasOverriddenOnExit: false,
                  factory: $PartDetailPageRoute._fromState,
                ),
              ],
            ),
          ],
        ),
        GoRouteData.$route(
          path: 'create-order',
          hasOverriddenOnExit: false,
          factory: $CreateOrderPageRoute._fromState,
        ),
      ],
    ),
    GoRouteData.$route(
      path: '/optimizations/:orderId',
      hasOverriddenOnExit: false,
      factory: $OptimizationsPageRoute._fromState,
      routes: [
        GoRouteData.$route(
          path: 'layout-view/:materialId',
          hasOverriddenOnExit: false,
          factory: $LayoutViewPageRoute._fromState,
        ),
      ],
    ),
    GoRouteData.$route(
      path: '/customers',
      hasOverriddenOnExit: false,
      factory: $CustomersPageRoute._fromState,
      routes: [
        GoRouteData.$route(
          path: 'customer-detail/:customerId',
          hasOverriddenOnExit: false,
          factory: $CustomerDetailPageRoute._fromState,
        ),
        GoRouteData.$route(
          path: 'create-customer',
          hasOverriddenOnExit: false,
          factory: $CreateCustomerPageRoute._fromState,
        ),
      ],
    ),
    GoRouteData.$route(
      path: '/projects',
      hasOverriddenOnExit: false,
      factory: $ProjectsPageRoute._fromState,
      routes: [
        GoRouteData.$route(
          path: 'add-project',
          hasOverriddenOnExit: false,
          factory: $CreateProjectPageRoute._fromState,
        ),
        GoRouteData.$route(
          path: 'project-detail/:projectId',
          hasOverriddenOnExit: false,
          factory: $ProjectDetailPageRoute._fromState,
        ),
      ],
    ),
    GoRouteData.$route(
      path: '/shipments',
      hasOverriddenOnExit: false,
      factory: $ShipmentsPageRoute._fromState,
      routes: [
        GoRouteData.$route(
          path: 'create-shipment',
          hasOverriddenOnExit: false,
          factory: $CreateShipmentPageRoute._fromState,
        ),
        GoRouteData.$route(
          path: 'shipment-detail/:shipmentId',
          hasOverriddenOnExit: false,
          factory: $ShipmentDetailPageRoute._fromState,
          routes: [
            GoRouteData.$route(
              path: 'create-package',
              hasOverriddenOnExit: false,
              factory: $CreatePackagePageRoute._fromState,
            ),
          ],
        ),
      ],
    ),
    GoRouteData.$route(
      path: '/inventories',
      hasOverriddenOnExit: false,
      factory: $InventoriesPageRoute._fromState,
      routes: [
        GoRouteData.$route(
          path: 'add-inventories',
          hasOverriddenOnExit: false,
          factory: $CreateInventoryPageRoute._fromState,
        ),
        GoRouteData.$route(
          path: 'inventories-detail/:inventoryId',
          hasOverriddenOnExit: false,
          factory: $InventoryDetailPageRoute._fromState,
        ),
      ],
    ),
    GoRouteData.$route(
      path: '/materials',
      hasOverriddenOnExit: false,
      factory: $MaterialsPageRoute._fromState,
      routes: [
        GoRouteData.$route(
          path: 'create-material',
          hasOverriddenOnExit: false,
          factory: $MaterialFormPageRoute._fromState,
        ),
      ],
    ),
    GoRouteData.$route(
      path: '/hardwares',
      hasOverriddenOnExit: false,
      factory: $HardwaresPageRoute._fromState,
    ),
    GoRouteData.$route(
      path: '/drivers',
      hasOverriddenOnExit: false,
      factory: $DriversPageRoute._fromState,
    ),
    GoRouteData.$route(
      path: '/inventory-transactions',
      hasOverriddenOnExit: false,
      factory: $InventoryTransactionsPageRoute._fromState,
    ),
    GoRouteData.$route(
      path: '/sheets',
      hasOverriddenOnExit: false,
      factory: $PhysicalSheetsPageRoute._fromState,
      routes: [
        GoRouteData.$route(
          path: 'create-sheet',
          hasOverriddenOnExit: false,
          factory: $PhysicalSheetFormPageRoute._fromState,
        ),
      ],
    ),
    GoRouteData.$route(
      path: '/optimization-workspace',
      hasOverriddenOnExit: false,
      factory: $OptimizationWorkspacePageRoute._fromState,
    ),
    GoRouteData.$route(
      path: '/shop-floor',
      hasOverriddenOnExit: false,
      factory: $ShopFloorPageRoute._fromState,
    ),
    GoRouteData.$route(
      path: '/users',
      hasOverriddenOnExit: false,
      factory: $UsersPageRoute._fromState,
      routes: [
        GoRouteData.$route(
          path: 'add-user',
          hasOverriddenOnExit: false,
          factory: $CreateUserPageRoute._fromState,
        ),
      ],
    ),
    GoRouteData.$route(
      path: '/ware-houses',
      hasOverriddenOnExit: false,
      factory: $WarehousesPageRoute._fromState,
      routes: [
        GoRouteData.$route(
          path: 'add-warehouse',
          hasOverriddenOnExit: false,
          factory: $CreateWarehousePageRoute._fromState,
        ),
        GoRouteData.$route(
          path: 'warehouse-detail/:warehouseId',
          hasOverriddenOnExit: false,
          factory: $WarehouseDetailPageRoute._fromState,
        ),
      ],
    ),
    GoRouteData.$route(
      path: '/factories',
      hasOverriddenOnExit: false,
      factory: $FactoriesPageRoute._fromState,
      routes: [
        GoRouteData.$route(
          path: 'add-factory',
          hasOverriddenOnExit: false,
          factory: $FactoryFormPageRoute._fromState,
        ),
      ],
    ),
    GoRouteData.$route(
      path: '/machines',
      hasOverriddenOnExit: false,
      factory: $MachinesPageRoute._fromState,
      routes: [
        GoRouteData.$route(
          path: 'create-machine',
          hasOverriddenOnExit: false,
          factory: $MachineFormPageRoute._fromState,
        ),
      ],
    ),
    GoRouteData.$route(
      path: '/companies',
      hasOverriddenOnExit: false,
      factory: $CompaniesPageRoute._fromState,
      routes: [
        GoRouteData.$route(
          path: 'add-company',
          hasOverriddenOnExit: false,
          factory: $CompanyFormPageRoute._fromState,
        ),
      ],
    ),
    GoRouteData.$route(
      path: '/process-types',
      hasOverriddenOnExit: false,
      factory: $ProcessTypesPageRoute._fromState,
      routes: [
        GoRouteData.$route(
          path: 'create-process-type',
          hasOverriddenOnExit: false,
          factory: $ProcessTypeFormPageRoute._fromState,
        ),
      ],
    ),
    GoRouteData.$route(
      path: '/settings',
      hasOverriddenOnExit: false,
      factory: $SettingsPageRoute._fromState,
    ),
  ],
);

extension $BasePageRouteExtension on BasePageRoute {
  static BasePageRoute _fromState(GoRouterState state) => const BasePageRoute();
}

mixin $DashboardPageRoute on GoRouteData {
  static DashboardPageRoute _fromState(GoRouterState state) =>
      const DashboardPageRoute();

  @override
  String get location => GoRouteData.$location('/');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $OrdersPageRoute on GoRouteData {
  static OrdersPageRoute _fromState(GoRouterState state) =>
      const OrdersPageRoute();

  @override
  String get location => GoRouteData.$location('/orders');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $OrderDetailPageRoute on GoRouteData {
  static OrderDetailPageRoute _fromState(GoRouterState state) =>
      OrderDetailPageRoute(orderId: state.pathParameters['orderId']!);

  OrderDetailPageRoute get _self => this as OrderDetailPageRoute;

  @override
  String get location => GoRouteData.$location(
    '/orders/order-detail/${Uri.encodeComponent(_self.orderId)}',
  );

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $CreateItemPageRoute on GoRouteData {
  static CreateItemPageRoute _fromState(GoRouterState state) =>
      CreateItemPageRoute(state.pathParameters['orderId']!);

  CreateItemPageRoute get _self => this as CreateItemPageRoute;

  @override
  String get location => GoRouteData.$location(
    '/orders/order-detail/${Uri.encodeComponent(_self.orderId)}/add-item/${Uri.encodeComponent(_self.orderId)}',
  );

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $UploadItemsPageRoute on GoRouteData {
  static UploadItemsPageRoute _fromState(GoRouterState state) =>
      UploadItemsPageRoute(state.pathParameters['orderId']!);

  UploadItemsPageRoute get _self => this as UploadItemsPageRoute;

  @override
  String get location => GoRouteData.$location(
    '/orders/order-detail/${Uri.encodeComponent(_self.orderId)}/upload-items/${Uri.encodeComponent(_self.orderId)}',
  );

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $ItemDetailPageRoute on GoRouteData {
  static ItemDetailPageRoute _fromState(GoRouterState state) =>
      ItemDetailPageRoute(
        state.pathParameters['itemId']!,
        state.pathParameters['orderId']!,
        state.extra as Map<String, dynamic>?,
      );

  ItemDetailPageRoute get _self => this as ItemDetailPageRoute;

  @override
  String get location => GoRouteData.$location(
    '/orders/order-detail/${Uri.encodeComponent(_self.orderId)}/item-detail/${Uri.encodeComponent(_self.itemId)}',
  );

  @override
  void go(BuildContext context) => context.go(location, extra: _self.$extra);

  @override
  Future<T?> push<T>(BuildContext context) =>
      context.push<T>(location, extra: _self.$extra);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location, extra: _self.$extra);

  @override
  void replace(BuildContext context) =>
      context.replace(location, extra: _self.$extra);
}

mixin $CreatePartPageRoute on GoRouteData {
  static CreatePartPageRoute _fromState(GoRouterState state) =>
      CreatePartPageRoute(
        state.pathParameters['itemId']!,
        state.pathParameters['orderId']!,
        state.uri.queryParameters['part-id']!,
      );

  CreatePartPageRoute get _self => this as CreatePartPageRoute;

  @override
  String get location => GoRouteData.$location(
    '/orders/order-detail/${Uri.encodeComponent(_self.orderId)}/item-detail/${Uri.encodeComponent(_self.itemId)}/add-part/${Uri.encodeComponent(_self.itemId)}',
    queryParams: {'part-id': _self.partId},
  );

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $PartDetailPageRoute on GoRouteData {
  static PartDetailPageRoute _fromState(GoRouterState state) =>
      PartDetailPageRoute(
        state.pathParameters['partId']!,
        state.pathParameters['itemId']!,
        state.pathParameters['orderId']!,
        state.extra as Map<String, dynamic>,
      );

  PartDetailPageRoute get _self => this as PartDetailPageRoute;

  @override
  String get location => GoRouteData.$location(
    '/orders/order-detail/${Uri.encodeComponent(_self.orderId)}/item-detail/${Uri.encodeComponent(_self.itemId)}/part-detail/${Uri.encodeComponent(_self.partId)}',
  );

  @override
  void go(BuildContext context) => context.go(location, extra: _self.$extra);

  @override
  Future<T?> push<T>(BuildContext context) =>
      context.push<T>(location, extra: _self.$extra);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location, extra: _self.$extra);

  @override
  void replace(BuildContext context) =>
      context.replace(location, extra: _self.$extra);
}

mixin $CreateOrderPageRoute on GoRouteData {
  static CreateOrderPageRoute _fromState(GoRouterState state) =>
      const CreateOrderPageRoute();

  @override
  String get location => GoRouteData.$location('/orders/create-order');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $OptimizationsPageRoute on GoRouteData {
  static OptimizationsPageRoute _fromState(GoRouterState state) =>
      OptimizationsPageRoute(state.pathParameters['orderId']!);

  OptimizationsPageRoute get _self => this as OptimizationsPageRoute;

  @override
  String get location => GoRouteData.$location(
    '/optimizations/${Uri.encodeComponent(_self.orderId)}',
  );

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $LayoutViewPageRoute on GoRouteData {
  static LayoutViewPageRoute _fromState(GoRouterState state) =>
      LayoutViewPageRoute(
        state.pathParameters['materialId']!,
        state.pathParameters['orderId']!,
        state.extra as Map<String, dynamic>,
      );

  LayoutViewPageRoute get _self => this as LayoutViewPageRoute;

  @override
  String get location => GoRouteData.$location(
    '/optimizations/${Uri.encodeComponent(_self.orderId)}/layout-view/${Uri.encodeComponent(_self.materialId)}',
  );

  @override
  void go(BuildContext context) => context.go(location, extra: _self.$extra);

  @override
  Future<T?> push<T>(BuildContext context) =>
      context.push<T>(location, extra: _self.$extra);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location, extra: _self.$extra);

  @override
  void replace(BuildContext context) =>
      context.replace(location, extra: _self.$extra);
}

mixin $CustomersPageRoute on GoRouteData {
  static CustomersPageRoute _fromState(GoRouterState state) =>
      const CustomersPageRoute();

  @override
  String get location => GoRouteData.$location('/customers');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $CustomerDetailPageRoute on GoRouteData {
  static CustomerDetailPageRoute _fromState(GoRouterState state) =>
      CustomerDetailPageRoute(state.pathParameters['customerId']!);

  CustomerDetailPageRoute get _self => this as CustomerDetailPageRoute;

  @override
  String get location => GoRouteData.$location(
    '/customers/customer-detail/${Uri.encodeComponent(_self.customerId)}',
  );

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $CreateCustomerPageRoute on GoRouteData {
  static CreateCustomerPageRoute _fromState(GoRouterState state) =>
      const CreateCustomerPageRoute();

  @override
  String get location => GoRouteData.$location('/customers/create-customer');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $ProjectsPageRoute on GoRouteData {
  static ProjectsPageRoute _fromState(GoRouterState state) =>
      const ProjectsPageRoute();

  @override
  String get location => GoRouteData.$location('/projects');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $CreateProjectPageRoute on GoRouteData {
  static CreateProjectPageRoute _fromState(GoRouterState state) =>
      const CreateProjectPageRoute();

  @override
  String get location => GoRouteData.$location('/projects/add-project');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $ProjectDetailPageRoute on GoRouteData {
  static ProjectDetailPageRoute _fromState(GoRouterState state) =>
      ProjectDetailPageRoute(projectId: state.pathParameters['projectId']!);

  ProjectDetailPageRoute get _self => this as ProjectDetailPageRoute;

  @override
  String get location => GoRouteData.$location(
    '/projects/project-detail/${Uri.encodeComponent(_self.projectId)}',
  );

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $ShipmentsPageRoute on GoRouteData {
  static ShipmentsPageRoute _fromState(GoRouterState state) =>
      const ShipmentsPageRoute();

  @override
  String get location => GoRouteData.$location('/shipments');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $CreateShipmentPageRoute on GoRouteData {
  static CreateShipmentPageRoute _fromState(GoRouterState state) =>
      const CreateShipmentPageRoute();

  @override
  String get location => GoRouteData.$location('/shipments/create-shipment');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $ShipmentDetailPageRoute on GoRouteData {
  static ShipmentDetailPageRoute _fromState(GoRouterState state) =>
      ShipmentDetailPageRoute(state.pathParameters['shipmentId']!);

  ShipmentDetailPageRoute get _self => this as ShipmentDetailPageRoute;

  @override
  String get location => GoRouteData.$location(
    '/shipments/shipment-detail/${Uri.encodeComponent(_self.shipmentId)}',
  );

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $CreatePackagePageRoute on GoRouteData {
  static CreatePackagePageRoute _fromState(GoRouterState state) =>
      CreatePackagePageRoute(
        state.pathParameters['shipmentId']!,
        state.extra as Map<String, dynamic>,
      );

  CreatePackagePageRoute get _self => this as CreatePackagePageRoute;

  @override
  String get location => GoRouteData.$location(
    '/shipments/shipment-detail/${Uri.encodeComponent(_self.shipmentId)}/create-package',
  );

  @override
  void go(BuildContext context) => context.go(location, extra: _self.$extra);

  @override
  Future<T?> push<T>(BuildContext context) =>
      context.push<T>(location, extra: _self.$extra);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location, extra: _self.$extra);

  @override
  void replace(BuildContext context) =>
      context.replace(location, extra: _self.$extra);
}

mixin $InventoriesPageRoute on GoRouteData {
  static InventoriesPageRoute _fromState(GoRouterState state) =>
      const InventoriesPageRoute();

  @override
  String get location => GoRouteData.$location('/inventories');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $CreateInventoryPageRoute on GoRouteData {
  static CreateInventoryPageRoute _fromState(GoRouterState state) =>
      CreateInventoryPageRoute();

  @override
  String get location => GoRouteData.$location('/inventories/add-inventories');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $InventoryDetailPageRoute on GoRouteData {
  static InventoryDetailPageRoute _fromState(GoRouterState state) =>
      InventoryDetailPageRoute(state.pathParameters['inventoryId']!);

  InventoryDetailPageRoute get _self => this as InventoryDetailPageRoute;

  @override
  String get location => GoRouteData.$location(
    '/inventories/inventories-detail/${Uri.encodeComponent(_self.inventoryId)}',
  );

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $MaterialsPageRoute on GoRouteData {
  static MaterialsPageRoute _fromState(GoRouterState state) =>
      const MaterialsPageRoute();

  @override
  String get location => GoRouteData.$location('/materials');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $MaterialFormPageRoute on GoRouteData {
  static MaterialFormPageRoute _fromState(GoRouterState state) =>
      MaterialFormPageRoute(state.extra as MaterialModel?);

  MaterialFormPageRoute get _self => this as MaterialFormPageRoute;

  @override
  String get location => GoRouteData.$location('/materials/create-material');

  @override
  void go(BuildContext context) => context.go(location, extra: _self.$extra);

  @override
  Future<T?> push<T>(BuildContext context) =>
      context.push<T>(location, extra: _self.$extra);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location, extra: _self.$extra);

  @override
  void replace(BuildContext context) =>
      context.replace(location, extra: _self.$extra);
}

mixin $HardwaresPageRoute on GoRouteData {
  static HardwaresPageRoute _fromState(GoRouterState state) =>
      const HardwaresPageRoute();

  @override
  String get location => GoRouteData.$location('/hardwares');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $DriversPageRoute on GoRouteData {
  static DriversPageRoute _fromState(GoRouterState state) =>
      const DriversPageRoute();

  @override
  String get location => GoRouteData.$location('/drivers');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $InventoryTransactionsPageRoute on GoRouteData {
  static InventoryTransactionsPageRoute _fromState(GoRouterState state) =>
      const InventoryTransactionsPageRoute();

  @override
  String get location => GoRouteData.$location('/inventory-transactions');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $PhysicalSheetsPageRoute on GoRouteData {
  static PhysicalSheetsPageRoute _fromState(GoRouterState state) =>
      const PhysicalSheetsPageRoute();

  @override
  String get location => GoRouteData.$location('/sheets');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $PhysicalSheetFormPageRoute on GoRouteData {
  static PhysicalSheetFormPageRoute _fromState(GoRouterState state) =>
      PhysicalSheetFormPageRoute(state.extra as Widget Function(BuildContext));

  PhysicalSheetFormPageRoute get _self => this as PhysicalSheetFormPageRoute;

  @override
  String get location => GoRouteData.$location('/sheets/create-sheet');

  @override
  void go(BuildContext context) => context.go(location, extra: _self.$extra);

  @override
  Future<T?> push<T>(BuildContext context) =>
      context.push<T>(location, extra: _self.$extra);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location, extra: _self.$extra);

  @override
  void replace(BuildContext context) =>
      context.replace(location, extra: _self.$extra);
}

mixin $OptimizationWorkspacePageRoute on GoRouteData {
  static OptimizationWorkspacePageRoute _fromState(GoRouterState state) =>
      const OptimizationWorkspacePageRoute();

  @override
  String get location => GoRouteData.$location('/optimization-workspace');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $ShopFloorPageRoute on GoRouteData {
  static ShopFloorPageRoute _fromState(GoRouterState state) =>
      const ShopFloorPageRoute();

  @override
  String get location => GoRouteData.$location('/shop-floor');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $UsersPageRoute on GoRouteData {
  static UsersPageRoute _fromState(GoRouterState state) =>
      const UsersPageRoute();

  @override
  String get location => GoRouteData.$location('/users');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $CreateUserPageRoute on GoRouteData {
  static CreateUserPageRoute _fromState(GoRouterState state) =>
      CreateUserPageRoute();

  @override
  String get location => GoRouteData.$location('/users/add-user');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $WarehousesPageRoute on GoRouteData {
  static WarehousesPageRoute _fromState(GoRouterState state) =>
      const WarehousesPageRoute();

  @override
  String get location => GoRouteData.$location('/ware-houses');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $CreateWarehousePageRoute on GoRouteData {
  static CreateWarehousePageRoute _fromState(GoRouterState state) =>
      CreateWarehousePageRoute(state.extra as WarehouseModel?);

  CreateWarehousePageRoute get _self => this as CreateWarehousePageRoute;

  @override
  String get location => GoRouteData.$location('/ware-houses/add-warehouse');

  @override
  void go(BuildContext context) => context.go(location, extra: _self.$extra);

  @override
  Future<T?> push<T>(BuildContext context) =>
      context.push<T>(location, extra: _self.$extra);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location, extra: _self.$extra);

  @override
  void replace(BuildContext context) =>
      context.replace(location, extra: _self.$extra);
}

mixin $WarehouseDetailPageRoute on GoRouteData {
  static WarehouseDetailPageRoute _fromState(GoRouterState state) =>
      WarehouseDetailPageRoute(state.pathParameters['warehouseId']!);

  WarehouseDetailPageRoute get _self => this as WarehouseDetailPageRoute;

  @override
  String get location => GoRouteData.$location(
    '/ware-houses/warehouse-detail/${Uri.encodeComponent(_self.warehouseId)}',
  );

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $FactoriesPageRoute on GoRouteData {
  static FactoriesPageRoute _fromState(GoRouterState state) =>
      const FactoriesPageRoute();

  @override
  String get location => GoRouteData.$location('/factories');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $FactoryFormPageRoute on GoRouteData {
  static FactoryFormPageRoute _fromState(GoRouterState state) =>
      FactoryFormPageRoute(state.extra as FactoryModel?);

  FactoryFormPageRoute get _self => this as FactoryFormPageRoute;

  @override
  String get location => GoRouteData.$location('/factories/add-factory');

  @override
  void go(BuildContext context) => context.go(location, extra: _self.$extra);

  @override
  Future<T?> push<T>(BuildContext context) =>
      context.push<T>(location, extra: _self.$extra);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location, extra: _self.$extra);

  @override
  void replace(BuildContext context) =>
      context.replace(location, extra: _self.$extra);
}

mixin $MachinesPageRoute on GoRouteData {
  static MachinesPageRoute _fromState(GoRouterState state) =>
      const MachinesPageRoute();

  @override
  String get location => GoRouteData.$location('/machines');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $MachineFormPageRoute on GoRouteData {
  static MachineFormPageRoute _fromState(GoRouterState state) =>
      MachineFormPageRoute(state.extra as Widget Function(BuildContext));

  MachineFormPageRoute get _self => this as MachineFormPageRoute;

  @override
  String get location => GoRouteData.$location('/machines/create-machine');

  @override
  void go(BuildContext context) => context.go(location, extra: _self.$extra);

  @override
  Future<T?> push<T>(BuildContext context) =>
      context.push<T>(location, extra: _self.$extra);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location, extra: _self.$extra);

  @override
  void replace(BuildContext context) =>
      context.replace(location, extra: _self.$extra);
}

mixin $CompaniesPageRoute on GoRouteData {
  static CompaniesPageRoute _fromState(GoRouterState state) =>
      const CompaniesPageRoute();

  @override
  String get location => GoRouteData.$location('/companies');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $CompanyFormPageRoute on GoRouteData {
  static CompanyFormPageRoute _fromState(GoRouterState state) =>
      CompanyFormPageRoute(state.extra as CompanyModel?);

  CompanyFormPageRoute get _self => this as CompanyFormPageRoute;

  @override
  String get location => GoRouteData.$location('/companies/add-company');

  @override
  void go(BuildContext context) => context.go(location, extra: _self.$extra);

  @override
  Future<T?> push<T>(BuildContext context) =>
      context.push<T>(location, extra: _self.$extra);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location, extra: _self.$extra);

  @override
  void replace(BuildContext context) =>
      context.replace(location, extra: _self.$extra);
}

mixin $ProcessTypesPageRoute on GoRouteData {
  static ProcessTypesPageRoute _fromState(GoRouterState state) =>
      const ProcessTypesPageRoute();

  @override
  String get location => GoRouteData.$location('/process-types');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

mixin $ProcessTypeFormPageRoute on GoRouteData {
  static ProcessTypeFormPageRoute _fromState(GoRouterState state) =>
      ProcessTypeFormPageRoute(state.extra as Widget Function(BuildContext));

  ProcessTypeFormPageRoute get _self => this as ProcessTypeFormPageRoute;

  @override
  String get location =>
      GoRouteData.$location('/process-types/create-process-type');

  @override
  void go(BuildContext context) => context.go(location, extra: _self.$extra);

  @override
  Future<T?> push<T>(BuildContext context) =>
      context.push<T>(location, extra: _self.$extra);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location, extra: _self.$extra);

  @override
  void replace(BuildContext context) =>
      context.replace(location, extra: _self.$extra);
}

mixin $SettingsPageRoute on GoRouteData {
  static SettingsPageRoute _fromState(GoRouterState state) =>
      const SettingsPageRoute();

  @override
  String get location => GoRouteData.$location('/settings');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $loginPageRoute => GoRouteData.$route(
  path: '/login',
  hasOverriddenOnExit: false,
  factory: $LoginPageRoute._fromState,
);

mixin $LoginPageRoute on GoRouteData {
  static LoginPageRoute _fromState(GoRouterState state) =>
      const LoginPageRoute();

  @override
  String get location => GoRouteData.$location('/login');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}
