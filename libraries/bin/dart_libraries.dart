import 'dart:async';
import 'dart:ffi';
import 'dart:isolate';
import 'dart:io';

void main() async {
  // Stream.periodic(
  //   const Duration(seconds: 1),
  //   (x) => x,
  // ).listen((item) => print(item));
  // Stream.fromFutures([Future(() => 3), Future.value(33)]).listen(print);

  final streamController = StreamController.broadcast();
  final subScriber = streamController.stream.listen(print);
  final subScriber2 = streamController.stream.listen((param) {
    print("second $param");
  });
  var val = 0;
  Timer.periodic(const Duration(seconds: 1), (timer) {
    if (val == 5) {
      timer.cancel();
      streamController.close();
      subScriber.cancel();
      subScriber2.cancel();
    } else {
      streamController.add(val++);
    }
  });
  var max = 0;
  await for (final value in streamController.stream) {
    max = (value > max) ? value : max;
  }
  print("max is $max");
}
