import 'package:board_cut/core/core.dart';
import 'package:board_cut/features/dashboard/data/models/dashboard_analytics_model.dart';
import 'package:fpdart/fpdart.dart';

import '../../data/models/dashboard_order_model.dart';

abstract class DashboardRepository {
  Future<Either<Failure, DashboardAnalyticsModel>> getDashboardAnalytics();

  Future<Either<Failure, PaginatedResult<DashboardOrderModel>>>
  getDashboardOrders({required int page, required int limit});
}
