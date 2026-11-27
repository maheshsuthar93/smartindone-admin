import 'package:board_cut/features/printer/data/models/printer_settings.dart';
import 'package:board_cut/features/printer/data/services/printer_service.dart';
import 'package:flutter/foundation.dart';

class SettingsViewModel extends ChangeNotifier {
  SettingsViewModel(this._printerService);

  final PrinterService _printerService;

  bool isSavingPrinterSettings = false;
  bool isCheckingPrinter = false;
  String printerStatus = 'Not configured';

  Future<PrinterSettings> loadPrinterSettings() async {
    final settings = await _printerService.loadSettings();
    printerStatus = settings.ipAddress.isEmpty ? 'Not configured' : 'Not checked';
    notifyListeners();
    return settings;
  }

  Future<void> savePrinterSettings(PrinterSettings settings) async {
    isSavingPrinterSettings = true;
    notifyListeners();
    try {
      await _printerService.saveSettings(settings);
      printerStatus = settings.ipAddress.isEmpty ? 'Not configured' : 'Not checked';
    } finally {
      isSavingPrinterSettings = false;
      notifyListeners();
    }
  }

  Future<void> checkPrinterConnection({
    required String ipAddress,
    required int port,
  }) async {
    isCheckingPrinter = true;
    notifyListeners();
    try {
      await _printerService.checkConnection(ipAddress: ipAddress, port: port);
      printerStatus = 'Reachable';
    } on UnsupportedError {
      printerStatus = 'Check from native app';
      rethrow;
    } catch (_) {
      printerStatus = 'Not reachable';
      rethrow;
    } finally {
      isCheckingPrinter = false;
      notifyListeners();
    }
  }

  Future<void> forgetPrinter() async {
    await _printerService.forgetPrinter();
    printerStatus = 'Not configured';
    notifyListeners();
  }
}
