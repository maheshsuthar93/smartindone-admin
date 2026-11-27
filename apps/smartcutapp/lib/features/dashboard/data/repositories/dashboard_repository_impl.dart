import 'package:board_cut/core/core.dart';
import 'package:board_cut/features/dashboard/data/models/dashboard_order_model.dart';
import 'package:fpdart/fpdart.dart';

import '../../domain/repositories/dashboard_repository.dart';
import '../data_sources/remote/dashboard_remote_data_source.dart';
import '../models/dashboard_analytics_model.dart';

class DashboardRepositoryImpl implements DashboardRepository {
  final DashboardRemoteDataSource remoteDataSource;

  DashboardRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, DashboardAnalyticsModel>> getDashboardAnalytics() {
    return safeCall(() => remoteDataSource.getDashboardAnalytics());
  }

  @override
  Future<Either<Failure, PaginatedResult<DashboardOrderModel>>>
  getDashboardOrders({required int page, required int limit}) {
    return safeCall(() => remoteDataSource.getDashboardOrders(page: page, limit: limit));

  }
}
