import 'dart:isolate';

Future saymyName() async {
  await Future.delayed(Duration(seconds: 2), () => print("Walter white"));
}

Future<String> returnmyName() async {
  return await Future.delayed(
      Duration(seconds: 2), () => "Walter white returned");
}

void main() async {
  print("Start");
  var name = await returnmyName();
  print(name);
  Isolate.run(() => saymyName());
  Isolate.run(() async =>
      await Future.delayed(Duration(seconds: 2), () => print("Walter white")));

  print("End");
}
