import 'dart:isolate';

import 'resilient_worker.dart';
import 'worker.dart';

Future saymyName() async {
  await Future.delayed(Duration(seconds: 2), () => print("Walter white"));
}

Future<String> returnmyName() async {
  return await Future.delayed(
      Duration(seconds: 2), () => "Walter white returned");
}
//Part 1
// print("Start");
// var name = await returnmyName();
// print(name);
// Isolate.run(() => saymyName());
// Isolate.run(() async =>
//     await Future.delayed(Duration(seconds: 2), () => print("Walter white")));

// print("End");

//Part 2
// final worker = Worker();
// await worker.spawn();
// await worker.parseJson('{"key":"value"}');
void main() async {
  var worker = await ResilientWorker.spawn();
  var data = await worker.parseJson('{"key":"value"}');
  var data2 = await worker.parseJson(
      '{"key":"value","key2":"value","key3":"value","key4":"value","key5":"value","key6":"value","key7":"value","key":"value"}');
  print("$data");
  print("$data2");
  worker.close();
}
