import 'dart:async';
import 'dart:convert';
import 'dart:isolate';

class Worker {
  late SendPort _sendPort;
  final Completer<void> _isolateReady = Completer.sync();
  Future<void> spawn() async {
    final receiverPort = ReceivePort();
    receiverPort.listen(_handleResponseFromIsolate);
    await Isolate.spawn(_startRemoteIsolate, receiverPort.sendPort);
  }

  void _handleResponseFromIsolate(dynamic message) {
    if (message is SendPort) {
      _sendPort = message;
      _isolateReady.complete();
    } else if (message is Map<String, dynamic>) {
      print(message);
    }
  }

  static void _startRemoteIsolate(SendPort sendPort) {
    final receivePort = ReceivePort();
    sendPort.send(receivePort.sendPort);
    receivePort.listen((dynamic message) {
      if (message is String) {
        final decoded = jsonDecode(message);
        sendPort.send(decoded);
      }
    });
  }

  Future<void> parseJson(String message) async {
    await _isolateReady.future;
    _sendPort.send(message);
  }
}
