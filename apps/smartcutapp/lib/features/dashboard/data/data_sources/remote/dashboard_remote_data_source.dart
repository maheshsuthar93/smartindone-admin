import 'package:board_cut/core/core.dart';

import '../../models/dashboard_analytics_model.dart';
import '../../models/dashboard_order_model.dart';

abstract class DashboardRemoteDataSource {
  Future<DashboardAnalyticsModel> getDashboardAnalytics();

  Future<PaginatedResult<DashboardOrderModel>> getDashboardOrders({
    required int page,
    required int limit,
  });
}
