import 'dart:convert';
import 'dart:ffi';
import 'dart:io';
import 'dart:isolate';

const String filename = 'data.json';

Future namer(dynamic input) {
  if (input.runtimeType == int) {
    return Future(() => input * 100);
  } else {
    throw "Input not expected type";
  }
}

Stream<int> staremInt() {
  return Stream.fromIterable([1, 3, 23, 43, 546, 3221]);
}

Future<void> bzzz() {
  throw Exception();
}

void main() async {
  await for (final d in staremInt()) {
    if (d > 100) {
      break;
    }
    print(d);
  }
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
