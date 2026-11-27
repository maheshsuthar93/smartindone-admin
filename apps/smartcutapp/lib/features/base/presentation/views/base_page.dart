import 'dart:async';

import 'package:board_cut/core/auth/role_access.dart';
import 'package:board_cut/core/core.dart';
import 'package:board_cut/core/core_injection.dart';
import 'package:board_cut/core/network/interceptors/auth_interceptor.dart';
import 'package:board_cut/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_side_menu/flutter_side_menu.dart';

class BasePage extends BaseStatefulScreen {
  const BasePage({super.key, required this.child});

  final Widget child;

  @override
  BaseState<BasePage> createState() => _BasePageState();
}

class _BasePageState extends BaseState<BasePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget buildResponsive(BuildContext context, ScreenType screenType) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      key: _scaffoldKey,
      drawer: screenType == ScreenType.mobile
          ? const DrawerWidget(isMobileDrawer: true)
          : null,
      body: Row(
        children: [
          if (screenType != ScreenType.mobile)
            DrawerWidget(isMobileDrawer: false),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ValueListenableBuilder<RouteInformation>(
                  valueListenable: router.routeInformationProvider,
                  builder: (context, routeInformation, _) => _pageHeader(
                    context,
                    routeInformation.uri.path,
                    screenType,
                  ),
                ),
                Expanded(child: widget.child),
                if (screenType != ScreenType.mobile) ...[
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: Text(
                      "© 2026 SmartIndOne • One platform for your whole business.",
                      style: AppTextStyle.labelSmall.copyWith(
                        color: AppColors.primaryColor.withValues(alpha: 0.5),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _pageHeader(BuildContext context, String path, ScreenType screenType) {
    final dialogParentPath = _dialogParentPath(path);
    final headerPath = dialogParentPath ?? path;
    final title = _titleForPath(headerPath);
    final canPop = router.canPop();
    final parentPath = _parentPath(headerPath);
    final showBack = dialogParentPath != null
        ? parentPath != null
        : canPop || parentPath != null;
    final isMobile = screenType == ScreenType.mobile;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: isMobile ? 8 : 16, vertical: 6),
      decoration: const BoxDecoration(
        color: AppColors.surfaceColor,
        border: Border(bottom: BorderSide(color: AppColors.borderColor)),
      ),
      child: Row(
        children: [
          if (showBack) ...[
            IconButton(
              tooltip: 'Back',
              onPressed: () {
                if (_isOrderOptimizationsPath(headerPath) && canPop) {
                  router.pop();
                } else if (_isOrderOptimizationsPath(headerPath)) {
                  const OptimizationWorkspacePageRoute().go(context);
                } else if (canPop) {
                  router.pop();
                } else if (parentPath != null) {
                  router.go(parentPath);
                }
              },
              icon: const Icon(Icons.arrow_back_rounded),
              color: AppColors.primaryColor,
            ),
            const SizedBox(width: 8),
          ] else if (isMobile) ...[
            IconButton(
              tooltip: 'Open navigation menu',
              onPressed: () => _scaffoldKey.currentState?.openDrawer(),
              icon: const Icon(Icons.menu_rounded),
              style: IconButton.styleFrom(
                foregroundColor: AppColors.primaryColor,
                backgroundColor: AppColors.primaryColor.withValues(alpha: .08),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(AppSize.borderRadius),
                ),
              ),
            ),
            const SizedBox(width: 8),
          ],
          Expanded(
            child: Text(
              title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: AppTextStyle.titleXSmall.copyWith(
                color: AppColors.primaryColor,
              ),
            ),
          ),
          const SizedBox(width: 12),
          _notificationIcon(),
          const SizedBox(width: 12),
          const AccountInfoWidget(compact: true),
        ],
      ),
    );
  }

  Widget _notificationIcon() {
    return Semantics(
      label: 'Notifications',
      child: SizedBox(
        width: 32,
        height: 36,
        child: Stack(
          alignment: Alignment.center,
          clipBehavior: Clip.none,
          children: [
            Icon(
              Icons.notifications_none_rounded,
              size: 30,
              color: AppColors.primaryColor,
            ),
            Positioned(
              top: 3,
              right: 3,
              child: Container(
                width: 12,
                height: 12,
                decoration: BoxDecoration(
                  color: const Color(0xFFE53935),
                  shape: BoxShape.circle,
                  border: Border.all(color: AppColors.surfaceColor, width: 1.5),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String? _dialogParentPath(String path) {
    final segments = Uri.parse(path).pathSegments;
    if (segments.isEmpty) return null;

    const dialogRoutes = {
      'create-order',
      'create-shipment',
      'add-item',
      'upload-items',
      'add-part',
      'create-customer',
      'create-project',
      'add-project',
      'add-inventories',
      'add-user',
      'add-warehouse',
      'add-factory',
      'add-company',
    };
    const routesWithTrailingPathParameter = {
      'add-item',
      'upload-items',
      'add-part',
    };

    final routeSegmentIndex = segments.length - 1;
    final lastSegment = segments[routeSegmentIndex];
    if (dialogRoutes.contains(lastSegment)) return _parentPath(path);

    if (segments.length >= 2) {
      final parentSegment = segments[segments.length - 2];
      if (routesWithTrailingPathParameter.contains(parentSegment)) {
        return _parentPath(path);
      }
    }

    return null;
  }

  String? _parentPath(String path) {
    final segments = Uri.parse(path).pathSegments;
    if (segments.length <= 1) return null;
    if (_isOrderOptimizationsPath(path)) return '/optimization-workspace';

    const parameterizedRoutes = {
      'order-detail',
      'add-item',
      'upload-items',
      'item-detail',
      'add-part',
      'part-detail',
      'optimizations',
      'layout-view',
      'customer-detail',
      'project-detail',
      'shipment-detail',
      'inventories-detail',
      'warehouse-detail',
    };

    final removeCount =
        parameterizedRoutes.contains(segments[segments.length - 2]) ? 2 : 1;
    final parentSegments = segments.take(segments.length - removeCount);
    return parentSegments.isEmpty ? '/' : '/${parentSegments.join('/')}';
  }

  bool _isOrderOptimizationsPath(String path) {
    final segments = Uri.parse(path).pathSegments;
    return segments.length == 2 && segments.first == 'optimizations';
  }

  String _titleForPath(String path) {
    final segments = Uri.parse(path).pathSegments;
    if (segments.isEmpty) return 'Dashboard';

    const nestedTitles = <String, String>{
      'order-detail': 'Order Details',
      'create-order': 'New Order',
      'add-item': 'Add Item',
      'upload-items': 'Upload Items',
      'item-detail': 'Item Details',
      'add-part': 'Add Part',
      'part-detail': 'Part Details',
      'optimizations': 'Order Optimizations',
      'layout-view': 'Sheet Viewer',
      'customer-detail': 'Customer Details',
      'create-customer': 'New Customer',
      'create-project': 'New Project',
      'add-project': 'Add Project',
      'project-detail': 'Project Details',
      'create-shipment': 'New Shipment',
      'shipment-detail': 'Shipment Details',
      'create-package': 'New Package',
      'add-inventories': 'New Inventory',
      'inventories-detail': 'Inventory Details',
      'add-user': 'New User',
      'add-warehouse': 'New Warehouse',
      'warehouse-detail': 'Warehouse Details',
      'add-factory': 'New Factory',
      'add-company': 'New Company',
      'boards': 'Boards',
    };
    for (final segment in segments.reversed) {
      final title = nestedTitles[segment];
      if (title != null) return title;
    }

    return switch (segments.first) {
      'orders' => 'Orders',
      'customers' => 'Customers',
      'projects' => 'Projects',
      'shipments' => 'Shipments',
      'inventories' => 'Inventory',
      'inventory-transactions' => 'Stock history',
      'sheets' => 'Physical sheets',
      'optimization-workspace' => 'Optimizations',
      'materials' => 'Materials',
      'hardwares' => 'Hardware',
      'users' => 'Users',
      'ware-houses' => 'Warehouses',
      'factories' => 'Factories',
      'machines' => 'Machines',
      'companies' => 'Companies',
      'process-types' => 'Process types',
      'settings' => 'Settings',
      _ => 'Dashboard',
    };
  }
}

class DrawerWidget extends StatefulWidget {
  const DrawerWidget({super.key, this.isMobileDrawer = false});

  final bool isMobileDrawer;

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  final _controller = SideMenuController();
  UserRole? _role;
  late final AuthInterceptor _authInterceptor;
  String? _activeCompanyId;

  @override
  void initState() {
    super.initState();
    _authInterceptor = sl<AuthInterceptor>();
    _activeCompanyId = _authInterceptor.activeCompanyId.value;
    _authInterceptor.activeCompanyId.addListener(_onActiveCompanyChanged);
    router.routeInformationProvider.addListener(_onRouteChanged);
    _loadRole();
  }

  @override
  void dispose() {
    _authInterceptor.activeCompanyId.removeListener(_onActiveCompanyChanged);
    router.routeInformationProvider.removeListener(_onRouteChanged);
    super.dispose();
  }

  void _onActiveCompanyChanged() {
    if (!mounted) return;
    setState(() => _activeCompanyId = _authInterceptor.activeCompanyId.value);
  }

  void _onRouteChanged() {
    if (!mounted) return;
    setState(() {});
  }

  Future<void> _loadRole() async {
    final storage = sl<FlutterSecureStorage>();
    final value = await storage.read(key: 'auth_user_role');
    final role = userRoleFromApi(value);
    if (!mounted) return;
    setState(() => _role = role);
  }

  bool _canAccess(String module) {
    final role = _role;
    if (role == null) return false;
    if (role == UserRole.superAdmin &&
        _activeCompanyId == null &&
        module != 'users' &&
        module != 'companies') {
      return false;
    }
    return canAccessModule(
      role,
      module == 'materials' || module == 'hardwares' ? 'inventory' : module,
    );
  }

  String get _currentRouteSegment {
    final segments = router.routeInformationProvider.value.uri.pathSegments;
    return segments.isEmpty ? '' : segments.first;
  }

  List<_DrawerGroup> _navigationGroups() =>
      [
            _DrawerGroup('Workspace', [
              _DrawerLink(
                'dashboard',
                'Dashboard',
                Icons.home,
                () => DashboardPageRoute().go(context),
                routeKey: '',
              ),
              _DrawerLink(
                'orders',
                'Orders',
                Icons.receipt_long_outlined,
                () => OrdersPageRoute().go(context),
                routeKey: 'orders',
              ),
              _DrawerLink(
                'customers',
                'Customers',
                Icons.people,
                () => CustomersPageRoute().go(context),
                routeKey: 'customers',
              ),
              _DrawerLink(
                'projects',
                'Projects',
                Icons.work,
                () => ProjectsPageRoute().go(context),
                routeKey: 'projects',
              ),
            ]),
            _DrawerGroup('Production', [
              _DrawerLink(
                'processTypes',
                'Process Types',
                Icons.account_tree_outlined,
                () => ProcessTypesPageRoute().go(context),
                routeKey: 'process-types',
              ),
              _DrawerLink(
                'inventory',
                'Inventory',
                Icons.inventory,
                () => InventoriesPageRoute().go(context),
                routeKey: 'inventories',
              ),
              _DrawerLink(
                'inventory',
                'Stock history',
                Icons.history,
                () => InventoryTransactionsPageRoute().go(context),
                routeKey: 'inventory-transactions',
              ),
              _DrawerLink(
                'inventory',
                'Physical sheets',
                Icons.crop_square,
                () => PhysicalSheetsPageRoute().go(context),
                routeKey: 'sheets',
              ),
              _DrawerLink(
                'production',
                'Optimizations',
                Icons.view_quilt_outlined,
                () => const OptimizationWorkspacePageRoute().go(context),
                routeKey: 'optimization-workspace',
              ),
              _DrawerLink(
                'production',
                'Shop Floor',
                Icons.qr_code_scanner,
                () => const ShopFloorPageRoute().go(context),
                routeKey: 'shop-floor',
              ),
              _DrawerLink(
                'materials',
                'Materials',
                Icons.layers_outlined,
                () => MaterialsPageRoute().go(context),
                routeKey: 'materials',
              ),
              _DrawerLink(
                'hardwares',
                'Hardware',
                Icons.hardware_outlined,
                () => HardwaresPageRoute().go(context),
                routeKey: 'hardwares',
              ),
            ]),
            _DrawerGroup('Logistics', [
              _DrawerLink(
                'warehouses',
                'Drivers',
                Icons.badge_outlined,
                () => DriversPageRoute().go(context),
                routeKey: 'drivers',
              ),
              _DrawerLink(
                'shipments',
                'Shipments',
                Icons.local_shipping,
                () => ShipmentsPageRoute().go(context),
                routeKey: 'shipments',
              ),
              _DrawerLink(
                'warehouses',
                'Warehouse',
                Icons.warehouse,
                () => WarehousesPageRoute().go(context),
                routeKey: 'ware-houses',
              ),
            ]),
            _DrawerGroup('Administration', [
              _DrawerLink(
                'users',
                'Users',
                Icons.people,
                () => UsersPageRoute().go(context),
                routeKey: 'users',
              ),
              _DrawerLink(
                'factories',
                'Factories',
                Icons.precision_manufacturing_outlined,
                () => FactoriesPageRoute().go(context),
                routeKey: 'factories',
              ),
              _DrawerLink(
                'factories',
                'Machines',
                Icons.settings_input_component_outlined,
                () => const MachinesPageRoute().go(context),
                routeKey: 'machines',
              ),
              _DrawerLink(
                'companies',
                'Companies',
                Icons.business,
                () => CompaniesPageRoute().go(context),
                routeKey: 'companies',
              ),
              _DrawerLink(
                'settings',
                'Settings',
                Icons.settings,
                () => SettingsPageRoute().go(context),
                routeKey: 'settings',
              ),
            ]),
          ]
          .map(
            (group) => group.withLinks(
              group.links.where((link) => _canAccess(link.module)).toList(),
            ),
          )
          .where((group) => group.links.isNotEmpty)
          .toList();

  List<SideMenuItemData> _menuItems(bool isOpen) {
    final items = <SideMenuItemData>[];
    for (final group in _navigationGroups()) {
      if (items.isNotEmpty) {
        items.add(
          SideMenuItemDataDivider(
            divider: Divider(
              height: 1,
              thickness: 1,
              color: Colors.white.withValues(alpha: 0.14),
            ),
            padding: const EdgeInsetsDirectional.fromSTEB(16, 10, 16, 10),
          ),
        );
      }
      if (isOpen) {
        items.add(
          SideMenuItemDataTitle(
            title: group.title.toUpperCase(),
            titleStyle: AppTextStyle.labelSmall
                .responsive(context)
                .bold
                .copyWith(
                  color: Colors.white.withValues(alpha: 0.55),
                  letterSpacing: 1.1,
                ),
            padding: const EdgeInsetsDirectional.fromSTEB(18, 8, 12, 8),
          ),
        );
      }
      for (final link in group.links) {
        items.add(
          SideMenuItemDataTile(
            isSelected: link.routeKey == _currentRouteSegment,
            onTap: () {
              link.onTap();
              if (widget.isMobileDrawer) Scaffold.of(context).closeDrawer();
            },
            title: link.title,
            icon: Icon(link.icon, size: 18),
            selectedIcon: Icon(link.icon, size: 18),
            hasSelectedLine: false,
            itemHeight: 44,
            margin: const EdgeInsetsDirectional.symmetric(
              horizontal: 8,
              vertical: 2,
            ),
            borderRadius: BorderRadius.circular(AppSize.borderRadius),
            tooltip: link.title,
          ),
        );
      }
    }
    return items;
  }

  Widget _header(bool isOpen) {
    if (!isOpen && !widget.isMobileDrawer) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _brandMark(),
            const SizedBox(height: 6),
            _collapseButton(isOpen: false),
          ],
        ),
      );
    }

    return Container(
      margin: const EdgeInsetsDirectional.fromSTEB(8, 12, 8, 14),
      padding: const EdgeInsetsDirectional.fromSTEB(8, 10, 6, 10),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: .06),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Colors.white.withValues(alpha: .1)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              _brandMark(),
              const Spacer(),
              if (isOpen && !widget.isMobileDrawer)
                _collapseButton(isOpen: true),
            ],
          ),
          const SizedBox(height: 10),
          _brandName(),
          const SizedBox(height: 4),
          _brandTagline(),
        ],
      ),
    );
  }

  Widget _brandMark() => Container(
    width: 38,
    height: 38,
    decoration: BoxDecoration(
      color: AppColors.secondaryColor,
      borderRadius: BorderRadius.circular(12),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withValues(alpha: .14),
          blurRadius: 8,
          offset: const Offset(0, 3),
        ),
      ],
    ),
    alignment: Alignment.center,
    child: Text(
      'S',
      style: AppTextStyle.titleXSmall.copyWith(
        color: AppColors.white,
        fontWeight: FontWeight.w800,
      ),
    ),
  );

  Widget _brandName() => Text(
    'SmartIndOne',
    maxLines: 1,
    overflow: TextOverflow.ellipsis,
    style: AppTextStyle.labelMedium
        .responsive(context)
        .bold
        .copyWith(color: AppColors.white, letterSpacing: .1),
  );

  Widget _brandTagline() => Text(
    'One platform for your whole business.',
    maxLines: 2,
    overflow: TextOverflow.ellipsis,
    style: AppTextStyle.labelSmall
        .responsive(context)
        .regular
        .copyWith(
          color: AppColors.white.withValues(alpha: 0.7),
          height: 1.3,
        ),
  );

  Widget _collapseButton({required bool isOpen}) => IconButton(
    tooltip: isOpen ? 'Collapse navigation' : 'Expand navigation',
    onPressed: _controller.toggle,
    constraints: const BoxConstraints.tightFor(width: 36, height: 36),
    padding: EdgeInsets.zero,
    style: IconButton.styleFrom(
      foregroundColor: Colors.white,
      backgroundColor: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSize.borderRadius),
      ),
    ),
    icon: Icon(
      isOpen ? Icons.chevron_left_rounded : Icons.chevron_right_rounded,
      size: 20,
    ),
  );

  Widget _footer(bool isOpen) => Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      Divider(
        height: 1,
        color: Colors.white.withValues(alpha: 0.14),
        indent: 16,
        endIndent: 16,
      ),
      Container(
        height: 48,
        margin: const EdgeInsetsDirectional.fromSTEB(8, 8, 8, 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppSize.borderRadius),
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(AppSize.borderRadius),
            hoverColor: scaffoldBackgroundColor,
            onTap: () {
              unawaited(sl<AuthInterceptor>().clearToken());
              unawaited(_clearAccount());
              const LoginPageRoute().go(context);
              if (widget.isMobileDrawer) Scaffold.of(context).closeDrawer();
            },
            child: Row(
              children: [
                SizedBox(
                  width: 64 - 16,
                  child: const Icon(
                    Icons.logout,
                    size: 18,
                    color: Colors.white70,
                  ),
                ),
                if (isOpen)
                  Text(
                    'Logout',
                    style: AppTextStyle.labelSmall
                        .responsive(context)
                        .regular
                        .copyWith(color: Colors.white.withValues(alpha: 0.75)),
                  ),
              ],
            ),
          ),
        ),
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    final mobileWidth = (MediaQuery.sizeOf(context).width - 56)
        .clamp(220.0, 304.0)
        .toDouble();
    return SideMenu(
      controller: _controller,
      mode: SideMenuMode.open,
      minWidth: 64,
      maxWidth: widget.isMobileDrawer ? mobileWidth : 200,
      hasResizer: false,
      hasResizerToggle: false,
      backgroundColor: canvasColor,
      builder: (data) => SideMenuData(
        header: _header(data.isOpen),
        items: _menuItems(data.isOpen),
        footer: _footer(data.isOpen),
        defaultTileData: SideMenuItemTileDefaults(
          titleStyle: AppTextStyle.labelSmall
              .responsive(context)
              .regular
              .copyWith(color: Colors.white.withValues(alpha: 0.75)),
          selectedTitleStyle: AppTextStyle.labelSmall
              .responsive(context)
              .bold
              .copyWith(color: Colors.white),
          borderRadius: BorderRadius.circular(AppSize.borderRadius),
          hoverColor: scaffoldBackgroundColor,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppSize.borderRadius),
          ),
          selectedDecoration: BoxDecoration(
            color: Colors.white.withValues(alpha: 0.14),
            borderRadius: BorderRadius.circular(AppSize.borderRadius),
            border: Border.all(color: Colors.white.withValues(alpha: 0.18)),
          ),
        ),
      ),
    );
  }

  Future<void> _clearAccount() async {
    final storage = sl<FlutterSecureStorage>();
    await storage.delete(key: 'auth_user_name');
    await storage.delete(key: 'auth_user_email');
    await storage.delete(key: 'auth_user_role');
    await storage.delete(key: 'auth_active_company_id');
  }
}

class _DrawerGroup {
  const _DrawerGroup(this.title, this.links);

  final String title;
  final List<_DrawerLink> links;

  _DrawerGroup withLinks(List<_DrawerLink> visibleLinks) =>
      _DrawerGroup(title, visibleLinks);
}

class _DrawerLink {
  const _DrawerLink(
    this.module,
    this.title,
    this.icon,
    this.onTap, {
    this.routeKey,
  });

  final String module;
  final String title;
  final IconData icon;
  final VoidCallback onTap;
  final String? routeKey;
}

const canvasColor = AppColors.primaryColor;
final scaffoldBackgroundColor = AppColors.secondaryColor.withValues(alpha: 0.2);
const white = Colors.white;
final actionColor = AppColors.secondaryColor.withValues(alpha: 0.6);
final divider = Divider(color: white.withValues(alpha: 0.3), height: 1);
