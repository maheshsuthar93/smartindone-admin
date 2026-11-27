import 'dart:convert';
import 'dart:io';

Future<void> send(String ipAddress, int port, String data) async {
  final socket = await Socket.connect(
    ipAddress,
    port,
    timeout: const Duration(seconds: 5),
  );
  try {
    socket.add(ascii.encode(data));
    await socket.flush();
  } finally {
    await socket.close();
  }
}

Future<void> checkConnection(String ipAddress, int port) async {
  final socket = await Socket.connect(
    ipAddress,
    port,
    timeout: const Duration(seconds: 5),
  );
  await socket.close();
}
