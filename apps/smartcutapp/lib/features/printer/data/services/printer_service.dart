import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../models/piece_label_data.dart';
import '../models/printer_settings.dart';
import 'printer_transport.dart';

class PrinterService {
  const PrinterService(this._storage, this._transport);

  static const _ipKey = 'piece_printer_ip';
  static const _portKey = 'piece_printer_port';
  static const _widthKey = 'piece_label_width_mm';
  static const _heightKey = 'piece_label_height_mm';

  final FlutterSecureStorage _storage;
  final PrinterTransport _transport;

  Future<PrinterSettings> loadSettings() async {
    final values = await Future.wait([
      _storage.read(key: _ipKey),
      _storage.read(key: _portKey),
      _storage.read(key: _widthKey),
      _storage.read(key: _heightKey),
    ]);
    return PrinterSettings(
      ipAddress: values[0]?.trim() ?? '',
      port: int.tryParse(values[1] ?? '') ?? PrinterSettings.defaults.port,
      labelWidthMm:
          int.tryParse(values[2] ?? '') ??
          PrinterSettings.defaults.labelWidthMm,
      labelHeightMm:
          int.tryParse(values[3] ?? '') ??
          PrinterSettings.defaults.labelHeightMm,
    );
  }

  Future<void> saveSettings(PrinterSettings settings) async {
    _validate(settings);
    await Future.wait([
      _storage.write(key: _ipKey, value: settings.ipAddress.trim()),
      _storage.write(key: _portKey, value: settings.port.toString()),
      _storage.write(key: _widthKey, value: settings.labelWidthMm.toString()),
      _storage.write(key: _heightKey, value: settings.labelHeightMm.toString()),
    ]);
  }

  Future<void> forgetPrinter() async {
    await Future.wait([
      _storage.delete(key: _ipKey),
      _storage.delete(key: _portKey),
      _storage.delete(key: _widthKey),
      _storage.delete(key: _heightKey),
    ]);
  }

  Future<void> checkConnection({String? ipAddress, int? port}) async {
    final settings = await loadSettings();
    final targetIp = (ipAddress ?? settings.ipAddress).trim();
    final targetPort = port ?? settings.port;
    if (targetIp.isEmpty) {
      throw StateError('Printer IP address is not configured.');
    }
    if (targetPort < 1 || targetPort > 65535) {
      throw ArgumentError.value(targetPort, 'port', 'Invalid printer port.');
    }
    await _transport.checkConnection(targetIp, targetPort);
  }

  Future<void> printPieceLabel(PieceLabelData label) async {
    final settings = await loadSettings();
    if (settings.ipAddress.isEmpty) {
      throw StateError('Printer IP address is not configured.');
    }
    _validate(settings);
    await _transport.send(
      settings.ipAddress,
      settings.port,
      _buildPieceLabelCommands(settings, label),
    );
  }

  void _validate(PrinterSettings settings) {
    if (settings.port < 1 || settings.port > 65535) {
      throw ArgumentError.value(settings.port, 'port', 'Invalid printer port.');
    }
    if (settings.labelWidthMm < 20 || settings.labelWidthMm > 110) {
      throw ArgumentError.value(
        settings.labelWidthMm,
        'labelWidthMm',
        'Label width must be between 20 and 110 mm.',
      );
    }
    if (settings.labelHeightMm < 50 || settings.labelHeightMm > 300) {
      throw ArgumentError.value(
        settings.labelHeightMm,
        'labelHeightMm',
        'Label height must be between 50 and 300 mm.',
      );
    }
  }

  String _buildPieceLabelCommands(
    PrinterSettings settings,
    PieceLabelData label,
  ) {
    final heightDots = settings.labelHeightMm * 8;
    final serial = label.serialNumber?.trim().isNotEmpty == true
        ? 'TEXT 24,${heightDots - 44},"3",0,1,1,"${_text(label.serialNumber!)}"\r\n'
        : '';
    return 'SIZE ${settings.labelWidthMm} mm,${settings.labelHeightMm} mm\r\n'
        'GAP 2 mm,0 mm\r\n'
        'DIRECTION 1\r\n'
        'REFERENCE 0,0\r\n'
        'CLS\r\n'
        'TEXT 24,20,"4",0,1,1,"${_text(label.pieceCode)}"\r\n'
        'TEXT 24,62,"3",0,1,1,"${_text(label.partName)}"\r\n'
        'TEXT 24,98,"3",0,1,1,"ORDER ${_text(label.orderReference)}"\r\n'
        'BARCODE 24,132,"128",62,1,0,2,4,"${_text(label.pieceCode)}"\r\n'
        'TEXT 24,218,"3",0,1,1,"SIZE ${_text(label.size)}"\r\n'
        'TEXT 24,252,"3",0,1,1,"MAT ${_text(label.material)}"\r\n'
        'TEXT 24,286,"3",0,1,1,"GRAIN ${_text(label.grain)}"\r\n'
        'TEXT 24,320,"3",0,1,1,"EDGE LTRB ${_text(label.edgeBands)}"\r\n'
        '$serial'
        'PRINT 1,1\r\n';
  }

  String _text(String value) => value
      .replaceAll('"', "'")
      .replaceAll('\r', ' ')
      .replaceAll('\n', ' ')
      .replaceAll(RegExp(r'[^\x20-\x7E]'), '?');
}
