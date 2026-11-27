import 'package:board_cut/core/core.dart';
import 'package:fpdart/fpdart.dart';

import '../../data/models/dashboard_analytics_model.dart';
import '../repositories/dashboard_repository.dart';

class GetDashboardAnalytics {
  final DashboardRepository repository;

  GetDashboardAnalytics(this.repository);

  Future<Either<Failure, DashboardAnalyticsModel>> call() async {
    return repository.getDashboardAnalytics();
  }
}
