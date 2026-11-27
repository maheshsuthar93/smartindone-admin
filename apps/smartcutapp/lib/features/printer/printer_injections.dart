import 'package:board_cut/core/core_injection.dart';
import 'package:board_cut/features/settings/presentation/viewmodels/settings_view_model.dart';

import 'data/services/printer_service.dart';
import 'data/services/printer_transport.dart';

void initPrinter() {
  sl.registerLazySingleton<PrinterTransport>(
    () => const TscTcpPrinterTransport(),
  );
  sl.registerLazySingleton<PrinterService>(() => PrinterService(sl(), sl()));
  sl.registerFactory(() => SettingsViewModel(sl()));
}
