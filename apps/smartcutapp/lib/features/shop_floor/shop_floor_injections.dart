import 'package:board_cut/core/core_injection.dart';

import 'presentation/view_models/shop_floor_view_model.dart';

Future<void> initShopFloor() async {
  sl.registerFactory(
    () => ShopFloorViewModel(
      getPieceByCode: sl(),
      getPieceById: sl(),
      updatePieceProcessStatus: sl(),
    ),
  );
}
