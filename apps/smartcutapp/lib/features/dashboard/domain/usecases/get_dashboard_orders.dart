import 'package:board_cut/core/core.dart';
import 'package:fpdart/fpdart.dart';

import '../../data/models/dashboard_order_model.dart';
import '../repositories/dashboard_repository.dart';

class GetDashboardOrders {
  final DashboardRepository repository;

  GetDashboardOrders(this.repository);

  Future<Either<Failure, PaginatedResult<DashboardOrderModel>>> call({
    required int page,
    required int limit,
  }) async {
    return repository.getDashboardOrders(page: page, limit: limit);
  }
}
