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

void main() async {
  print("Starty");
  try {
    namer({"wefwef": "wefwe"}).then((data) => print(data));
  } catch (e) {
    print("oops:$e");
  } finally {
    print("final");
  }
  print("End");
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
