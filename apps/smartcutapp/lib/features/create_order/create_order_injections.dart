import 'package:board_cut/core/core_injection.dart';
import 'presentation/viewmodels/create_order_view_model.dart';

void initCreateOrder() {
  sl.registerFactory(
    () => CreateOrderViewModel(createOrder: sl(), updateOrder: sl()),
  );
}
