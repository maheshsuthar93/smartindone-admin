import 'package:board_cut/core/core.dart';
import 'package:board_cut/features/orders/data/models/order_analytics_model.dart';
import 'package:board_cut/features/orders/domain/repositories/order_repository.dart';
import 'package:fpdart/fpdart.dart';

class GetProjectAnalytics {
  final OrderRepository repository;

  GetProjectAnalytics(this.repository);

  Future<Either<Failure, OrderAnalyticsModel>> call() async {
    return repository.getOrderAnalytics();
  }
}
