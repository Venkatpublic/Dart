import 'dart:convert';
import 'dart:ffi';
import 'dart:io';

const String filename = 'data.json';

void main() {
  print("Start");

  _readFileSync();
  _readFileAsync();
  print("End");
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
