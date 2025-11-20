import 'dart:async';
import 'dart:isolate';

// The entry point for the new isolate.
void isolateEntryPoint(SendPort sendPort) {
  final receivePort = ReceivePort();
  sendPort.send(receivePort.sendPort);

  receivePort.listen((message) {
    if (message is int) {
      final result = message * 2;
      sendPort.send(result);
    }
  });
}

Future<void> main() async {
  final mainReceivePort = ReceivePort();
  final isolate = await Isolate.spawn(
    isolateEntryPoint,
    mainReceivePort.sendPort,
  );

  late SendPort isolateSendPort;
  final completer = Completer<int>();

  mainReceivePort.listen((message) {
    if (message is SendPort) {
      isolateSendPort = message;
      isolateSendPort.send(10); // Send data to the isolate
    } else if (message is int) {
      completer.complete(message);
    }
  });

  final result = await completer.future;
  print('Result from isolate: $result');

  // Clean up
  mainReceivePort.close();
  isolate.kill(priority: Isolate.immediate);
  print('Isolate killed.');
}
