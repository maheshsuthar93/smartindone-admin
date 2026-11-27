import '../enums/enums.dart';

UserRole? userRoleFromApi(String? value) => switch (value) {
  'SUPER_ADMIN' => UserRole.superAdmin,
  'ADMIN' => UserRole.admin,
  'MANAGER' => UserRole.manager,
  'OPERATOR' => UserRole.operator,
  'SALES' => UserRole.sales,
  _ => null,
};

/// Mirrors the backend module grants for app navigation and route visibility.
/// API authorization remains authoritative for every operation.
bool canAccessModule(UserRole role, String module) {
  return canPerformModule(role, module, 'read');
}

bool canPerformModule(UserRole role, String module, String action) {
  if (role == UserRole.superAdmin) return true;
  if (role == UserRole.admin) return module != 'companies';

  final allowedActions = switch (role) {
    UserRole.manager
        when const {
          'orders',
          'customers',
          'projects',
          'shipments',
          'inventory',
          'warehouses',
          'factories',
          'production',
          'dashboard',
        }.contains(module) =>
      const {'read', 'create', 'update'},
    UserRole.sales
        when const {
          'orders',
          'customers',
          'projects',
          'dashboard',
        }.contains(module) =>
      const {'read', 'create', 'update'},
    UserRole.sales when module == 'shipments' => const {'read'},
    UserRole.operator when const {'production'}.contains(module) => const {
      'read',
      'create',
      'update',
    },
    UserRole.operator
        when const {'dashboard', 'orders', 'inventory'}.contains(module) =>
      const {'read'},
    UserRole.operator when module == 'shipments' => const {'read', 'update'},
    _ => const <String>{},
  };
  return allowedActions.contains(action);
}

String moduleForPath(String path) {
  final segments = Uri.parse(path).pathSegments;
  final first = segments.isEmpty ? null : segments.first;
  return switch (first) {
    null => 'dashboard',
    'orders' || 'order-items' || 'order-item-parts' => 'orders',
    'customers' => 'customers',
    'projects' => 'projects',
    'shipments' || 'packages' => 'shipments',
    'inventories' ||
    'materials' ||
    'sheets' ||
    'hardwares' ||
    'inventory-balances' ||
    'inventory-transactions' => 'inventory',
    'ware-houses' || 'warehouses' || 'drivers' => 'warehouses',
    'factories' || 'machines' => 'factories',
    'companies' => 'companies',
    'process-types' => 'processTypes',
    'users' => 'users',
    'optimizations' => 'orders',
    'optimization-material-groups' ||
    'optimization-sheets' ||
    'optimization-layouts' ||
    'order-part-pieces' ||
    'piece-process-types' ||
    'piece-processes' ||
    'optimization-workspace' ||
    'shop-floor' => 'production',
    'settings' => 'settings',
    _ => 'dashboard',
  };
}
