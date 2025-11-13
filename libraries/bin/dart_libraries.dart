import 'dart:async';
import 'dart:ffi';
import 'dart:isolate';
import 'dart:io';

void main() async {
  final ReceivePort receivePort = ReceivePort();
  final stopwatch = Stopwatch()..start();
  num total = 0;

  num isolateCount = Platform.numberOfProcessors;
  final int totalRange = 80_000_000 + 1;
  final int chunkSize = (totalRange / isolateCount).ceil();
  var start = 0;
  num some = 0;
  for (num i = 1; i <= Platform.numberOfProcessors; i++) {
    final int end = (start + chunkSize - 1).clamp(0, 80_000_000);
    await Isolate.spawn(findSumFromLimt, {
      "start": start,
      "end": end,
      'sendPort': receivePort.sendPort,
    });
    start = end + 1;
    if (start > 80_000_000) break;
  }
  num hits = 0;
  receivePort.listen((dynamic message) {
    hits++;
    total = total + message;
    if (hits == isolateCount) {
      print("$total");
      receivePort.close();
      stopwatch.stop();
      print("Execution Time: ${stopwatch.elapsedMicroseconds} micros");
    }
  });
}

findSumFromLimt(Map param) async {
  final SendPort mainSendPort = param['sendPort'] as SendPort;
  List numList = List.empty(growable: true);
  int start = param['start'] as int;
  int end = param['end'] as int;
  for (num i = start; i <= end; i++) {
    numList.add(i);
  }
  mainSendPort.send(numList.reduce((sum, item) => sum + item));
}
