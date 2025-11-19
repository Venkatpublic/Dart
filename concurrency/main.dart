import 'dart:convert';
import 'dart:ffi';
import 'dart:io';

const String filename = 'data.json';

void main() {
  Stream<int> stream = Stream.periodic(const Duration(seconds: 1), (i) {
    print("emitting $i");
    return i;
  });
  sumStream(stream).listen((j) => print("looped $j"));
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
