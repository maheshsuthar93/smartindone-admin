import 'package:board_cut/core/auth/role_access.dart';
import 'package:board_cut/core/router/dialog.dart';
import 'package:board_cut/features/customer_detail/customer_detail.dart';
import 'package:board_cut/features/features.dart';
import 'package:board_cut/features/materials/data/models/material_model.dart';
import 'package:board_cut/features/orders/data/models/order_model.dart';
import 'package:board_cut/features/warehouses/data/models/warehouse_model.dart';
import 'package:board_cut/shared/data/model/company_model.dart';
import 'package:board_cut/shared/data/model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:go_router/go_router.dart';

import '../enums/enums.dart';

part 'app_routes.dart';

part 'auth_routes.dart';

part 'route_config.g.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();

final router = GoRouter(
  initialLocation: "/login",
  debugLogDiagnostics: true,
  routes: [...$appRoutes],
  navigatorKey: _rootNavigatorKey,
  redirect: (_, state) async {
    final path = state.uri.path;
    if (path == '/login' || path == '/forgot-password') return null;
    const storage = FlutterSecureStorage();
    final roleValue = await storage.read(key: 'auth_user_role');
    final role = userRoleFromApi(roleValue);
    if (role == null) return '/login';
    if (role == UserRole.superAdmin &&
        !{'companies', 'users'}.contains(moduleForPath(path)) &&
        (await storage.read(key: 'auth_active_company_id')) == null) {
      return '/companies';
    }
    final segments = state.uri.pathSegments;
    final isWritePage = segments.any(
      (segment) =>
          segment.startsWith('create-') ||
          segment.startsWith('add-') ||
          segment.startsWith('upload-'),
    );
    final action = isWritePage ? 'create' : 'read';
    if (!canPerformModule(role, moduleForPath(path), action)) return '/';
    return null;
  },
);
