import 'dart:async';
import 'dart:isolate';
import 'dart:io';

void main() {
  final stopwatch = Stopwatch()..start();
  List values = List.empty(growable: true);
  int? vlauesAdded = 100;
  print("in beginning");
  Future(
    () => values.reduce((item, val) => item + val),
  ).then((param) => vlauesAdded = param);
  Future(() => Future(() => print("Double Future $vlauesAdded")));
  Future.value(() => vlauesAdded).then(print);
  Future.microtask(() => print("micro task $vlauesAdded"));
  Future.delayed(
    const Duration(seconds: 1),
    () => print("$vlauesAdded,With timer"),
  );
  Future.microtask(() => print("$vlauesAdded,Microtasked"));
  for (int i = 1; i <= 10; i++) {
    values.add(i * 12);
  }

  stopwatch.stop();
  print("Execution Time: ${stopwatch.elapsedMicroseconds} micros");
}
