import 'dart:async';
import 'dart:isolate';
import 'dart:io';

bool hasMoreThanOne(List list, item) {
  return list.where((e) => e == item).length > 1;
}

void worker(Map msg) {
  final SendPort mainSendPort = msg['sendPort'] as SendPort;
  final int start = msg['start'] as int;
  final int end = msg['end'] as int;

  final List<int> results = [];

  for (var i = start; i <= end; i++) {
    if (i % 2 == 0) {
      var list = i.toString().split("");
      if (hasMoreThanOne(list, "2")) {
        results.add(i);
      }
    }
  }
  mainSendPort.send(results);
}

void main() async {
  final stopwatch = Stopwatch()..start();
  final isoLateCount = Platform.numberOfProcessors;
  print("Start");

  final ReceivePort receivePort = ReceivePort();
  final List<int> aggregated = [];
  int responsesExpected = 0;

  final completer = Completer<void>();

  receivePort.listen(
    (dynamic message) {
      if (message is List<int>) {
        // each worker sends a List<int>
        aggregated.addAll(message);
      } else {
        // ignore unexpected messages
      }

      responsesExpected--;
      if (responsesExpected == 0) {
        receivePort.close();
        completer.complete();
      }
    },
    onError: (e, st) {
      if (!completer.isCompleted) completer.completeError(e, st);
    },
  );

  // split the range into chunks and spawn isolates
  final int totalRange = 80_000_000 + 1; // 0..maxN inclusive
  final int chunkSize = (totalRange / isoLateCount).ceil();

  var start = 0;
  for (var i = 0; i < isoLateCount; i++) {
    final int end = (start + chunkSize - 1).clamp(0, 80_000_000);
    // spawn worker with the main receivePort's sendPort and assigned range
    await Isolate.spawn(worker, {
      'sendPort': receivePort.sendPort,
      'start': start,
      'end': end,
    });
    responsesExpected++;
    start = end + 1;
    if (start > 80_000_000) break;
  }

  // wait for all workers to respond
  await completer.future;

  stopwatch.stop();

  print("Execution Time: ${stopwatch.elapsedMilliseconds} ms");
}
