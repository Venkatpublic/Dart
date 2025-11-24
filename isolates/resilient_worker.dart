import 'dart:async';
import 'dart:convert';
import 'dart:isolate';

class ResilientWorker {
  final SendPort _commands;
  final ReceivePort _responses;
  final Map<int, Completer> _activeRequests = {};
  int _idCounter = 0;
  bool _closed = false;
  ResilientWorker._(this._responses, this._commands) {
    _responses.listen(_handleResponsesFromIsolate);
  }
  Future<Object?> parseJson(String message) async {
    if (_closed) {
      throw StateError("Isolate is closed");
    }
    final completer = Completer.sync();
    final id = _idCounter++;
    _activeRequests[id] = completer;
    _commands.send((id, message));
    return await completer.future;
  }

  static Future<ResilientWorker> spawn() async {
    final initport = RawReceivePort();
    final connection = Completer<(ReceivePort, SendPort)>.sync();
    initport.handler = (initialMessage) {
      final commandPort = initialMessage as SendPort;
      connection
          .complete((ReceivePort.fromRawReceivePort(initport), commandPort));
    };
    try {
      await Isolate.spawn(_startRemoteIsolate, initport.sendPort);
    } on Object {
      initport.close();
      rethrow;
    }
    final (ReceivePort receiveport, SendPort sendport) =
        await connection.future;
    return ResilientWorker._(receiveport, sendport);
  }

  void _handleResponsesFromIsolate(dynamic message) {
    final (int id, Object data) = message as (int, Object);
    final completer = _activeRequests.remove(id)!;
    if (message is RemoteError) {
      completer.completeError(data);
    } else {
      completer.complete(data);
    }
  }

  static void _handleCommandsToIsolate(ReceivePort rp, SendPort sp) async {
    rp.listen((message) {
      if (message == 'shutdown') {
        rp.close();
        return;
      }
      final (int id, String jsonText) = message as (int, String);
      try {
        final data = jsonDecode(jsonText);
        sp.send((id, data));
      } catch (e) {
        sp.send((id, RemoteError(e.toString(), '')));
      }
    });
  }

  static void _startRemoteIsolate(SendPort sendPort) async {
    final receivePort = ReceivePort();
    sendPort.send(receivePort.sendPort);
    _handleCommandsToIsolate(receivePort, sendPort);
  }

  void close() {
    if (!_closed) {
      _closed = true;
      _commands.send('shutdown');
      if (_activeRequests.isEmpty) {
        _responses.close();
      }
      print('--- port closed --- ');
    }
  }
}
