import 'package:board_cut/core/core_injection.dart';
import 'package:board_cut/features/project_detail/presentation/viewmodels/project_detail_view_model.dart';
import 'package:board_cut/features/projects/domain/usecases/get_project_by_id.dart';
import 'package:board_cut/features/orders/domain/usecases/get_orders.dart';

Future<void> initProjectDetail() async {
  sl.registerFactory(
    () => ProjectDetailViewModel(
      getProjectById: sl<GetProjectById>(),
      getOrders: sl<GetOrders>(),
    ),
  );
}
