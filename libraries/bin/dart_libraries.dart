import 'dart:async';
import 'dart:ffi';
import 'dart:isolate';
import 'dart:io';

void main() {
  asyncGenerator().listen((param) => print("Data $param"));
}

Stream<int> asyncGeneratorNega(param) async* {
  yield -param;
}

Stream<int> asyncGenerator() async* {
  for (int i = 0; i <= 5; i++) {
    yield i;
    yield* asyncGeneratorNega(i);
  }
}
