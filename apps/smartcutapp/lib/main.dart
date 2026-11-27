import 'package:board_cut/core/core_injection.dart';
import 'package:board_cut/core/network/api_error_feedback.dart';
import 'package:board_cut/core/network/interceptors/auth_interceptor.dart';
import 'package:board_cut/core/router/route_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/url_strategy.dart';

import 'core/theme/app_theme.dart';
import 'features/features.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  usePathUrlStrategy();
  await init();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late final AuthInterceptor _authInterceptor;

  @override
  void initState() {
    super.initState();
    _authInterceptor = sl<AuthInterceptor>();
    _authInterceptor.onCompanyInactive = () => router.go('/login');
  }

  @override
  void dispose() {
    _authInterceptor.onCompanyInactive = null;
    super.dispose();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      scaffoldMessengerKey: apiScaffoldMessengerKey,
      routerConfig: router,
      title: 'SmartIndOne',
      theme: appTheme,
      builder: (context, child) {
        final screenWidth = MediaQuery.sizeOf(context).width;
        final snackBarWidth = screenWidth <= 600
            ? null
            : (screenWidth * 0.6).clamp(420.0, 520.0).toDouble();

        return Theme(
          data: appTheme.copyWith(
            snackBarTheme: appTheme.snackBarTheme.copyWith(
              width: snackBarWidth,
            ),
          ),
          child: child ?? const SizedBox.shrink(),
        );
      },
      //home: const OrdersPage(),
    );
  }
}

Future<void> init() async {
  await initCore(); // if needed
  initPrinter();
  initUsers();
  initLogin();
  initWarehouses();
  initFactories();
  initMachines();
  initCompanies();
  initProcessTypes();
  initProjects();
  initCustomers();
  initOrders();
  initCreateOrder();
  initShipments();
  initInventories();
  initMaterials();
  initHardwares();
  initDrivers();
  initInventoryTransactions();
  initPhysicalSheets();
  initDashboard();
  initOptimizations();
  initOrderDetail();
  initProjectDetail();
  initItemDetail();
  initPartDetail();
  initCreatePart();
  initLayoutView();
  initSelectedPieceDetail();
  initShopFloor();
  initShipmentDetail();
  initCreateProject();
  initCreateItem();
  initCreateShipment();
  initCreatePackage();
}
