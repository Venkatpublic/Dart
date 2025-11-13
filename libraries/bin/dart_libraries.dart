import 'dart:async';
import 'dart:isolate';
import 'dart:io';

void main() {
  final stopwatch = Stopwatch()..start();
  Iterable<num> numList = generateNumberNormal(20);
  print(numList.first);
  stopwatch.stop();
  print("Execution Time: ${stopwatch.elapsedMicroseconds} micros");
}

List<num> generateNumberNormal(num limit) {
  List<num> result = List.empty(growable: true);
  for (num i = 1; i <= limit; i++) {
    result.add(i);
  }
  return result;
}

Iterable<num> generateNumGenerator(num limit) sync* {
  for (num i = 1; i <= limit; i++) {
    yield i;
  }
}
