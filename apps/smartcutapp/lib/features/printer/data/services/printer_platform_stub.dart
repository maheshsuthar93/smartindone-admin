Future<void> send(String ipAddress, int port, String data) =>
    Future.error(UnsupportedError('Direct printer networking is unavailable.'));

Future<void> checkConnection(String ipAddress, int port) =>
    Future.error(UnsupportedError('Direct printer networking is unavailable.'));
