import 'printer_platform_stub.dart'
    if (dart.library.io) 'printer_platform_io.dart'
    as platform;

abstract interface class PrinterTransport {
  Future<void> send(String ipAddress, int port, String data);
  Future<void> checkConnection(String ipAddress, int port);
}

class TscTcpPrinterTransport implements PrinterTransport {
  const TscTcpPrinterTransport();

  @override
  Future<void> send(String ipAddress, int port, String data) =>
      platform.send(ipAddress, port, data);

  @override
  Future<void> checkConnection(String ipAddress, int port) =>
      platform.checkConnection(ipAddress, port);
}
