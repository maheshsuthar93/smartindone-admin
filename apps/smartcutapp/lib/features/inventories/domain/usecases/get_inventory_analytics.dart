import 'package:board_cut/core/core.dart';
import 'package:board_cut/features/inventories/data/models/inventory_analytics_model.dart';
import 'package:board_cut/features/inventories/domain/repositories/inventory_repository.dart';
import 'package:fpdart/fpdart.dart';

class GetInventoryAnalytics {
  final InventoryRepository repository;

  GetInventoryAnalytics(this.repository);

  Future<Either<Failure, InventoryAnalyticsModel>> call() async {
    return repository.getInventoryAnalytics();
  }
}
