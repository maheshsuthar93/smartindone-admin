import 'package:freezed_annotation/freezed_annotation.dart';

part 'printer_settings.freezed.dart';

@freezed
abstract class PrinterSettings with _$PrinterSettings {
  const factory PrinterSettings({
    required String ipAddress,
    required int port,
    required int labelWidthMm,
    required int labelHeightMm,
  }) = _PrinterSettings;

  static const defaults = PrinterSettings(
    ipAddress: '',
    port: 9100,
    labelWidthMm: 100,
    labelHeightMm: 50,
  );
}
