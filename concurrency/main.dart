import 'dart:convert';
import 'dart:ffi';
import 'dart:io';
import 'dart:isolate';

const String filename = 'data.json';

void main() {
  final stopwatch = Stopwatch()..start();
  int slowFib(int n) => n <= 1 ? 1 : slowFib(n - 1) + slowFib(n - 2);

  // Compute without blocking current isolate.
  void fib40() {
    print('Fib(40) = ${slowFib(40)}');
  }

  fib40();
  print("Execution Time: ${stopwatch.elapsedMicroseconds} micros");
}

Stream<int> sumStream(Stream<int> stream) async* {
  var sum = 0;
  await for (final value in stream) {
    yield sum += value;
  }
}

void _readFileSync() {
  final file = File(filename);
  final contents = file.readAsStringSync();
  final jsonData = jsonDecode(contents.trim());
  print(jsonData);
}

void _readFileAsync() async {
  final file = File(filename);
  final contents = await file.readAsString();
  final jsonData = jsonDecode(contents.trim());
  print(jsonData);
}
