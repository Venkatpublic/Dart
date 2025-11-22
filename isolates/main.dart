import 'dart:async';
import 'dart:isolate';

import 'resilient_worker.dart';
import 'worker.dart';

Future saymyName() async {
  await Future.delayed(Duration(seconds: 2), () => print("Walter white"));
}

Future<String> returnmyName() async {
  return await Future.delayed(
    Duration(seconds: 2),
    () => "Walter white returned",
  );
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

//Part 3
// var worker = await ResilientWorker.spawn();
// var data = await worker.parseJson('{"key":"value"}');
// var data2 = await worker.parseJson(
//     '{"key":"value","key2":"value","key3":"value","key4":"value","key5":"value","key6":"value","key7":"value","key":"value"}');
// print("$data");
// print("$data2");
// worker.close();

Future<String> completeFunction(state) {
  final complete = Completer<String>();
  Future<String> data = complete.future;
  Future.delayed(Duration(seconds: 3), () {
    if (state == true) {
      complete.complete("Hello");
    } else {
      complete.completeError(Exception("Failure case"));
    }
  });
  return data;
}

//part 4
//  final completer = Completer<String>();
//   Future<String> future = completer.future;
//   Future.delayed(Duration(seconds: 2), () => completer.complete("Whassup"));
//   print("Waiting...");
//   String val = await future;
//   print(val);
//   try {
//     print(await completeFunction(true));
//   } catch (e) {
//     print(e);
//   }
//   try {
//     print(await completeFunction(false));
//   } catch (e) {
//     print("ERROR:$e");
//   }
//   ;
Future<int> firstEvenInStream(Stream stream) {
  final completer = Completer<int>();
  late StreamSubscription sub;
  sub = stream.listen(
    (value) {
      if (value is int) {
        if (value.isEven && !completer.isCompleted) {
          completer.complete(value);
          sub.cancel();
        }
      }
    },
    onError: (error) {
      if (!completer.isCompleted) {
        completer.completeError(error);
      }
    },
    onDone: () {
      if (!completer.isCompleted) {
        completer.completeError("even numbers not found");
      }
    },
  );
  return completer.future;
}

void main() async {
  final stream = Stream.fromIterable([1, 2, 3, 4, 5, 6]);
  try {
    int firstEven = await firstEvenInStream(stream);
    print(firstEven);
  } catch (e) {
    print(e);
  }
}
