import 'dart:async';
import 'dart:ffi';
import 'dart:isolate';
import 'dart:io';

void main() async {
  List<int> input = [23, 24, 234325, 563, 234, 45612, 4, 235];
  print("Start");
  Future.value(
    findBiggest(input),
  ).then((param) => print("value from future is $param"));
  scheduleMicrotask(() => Future(() => print("Future micro task")));
  scheduleMicrotask(() => print("Micro task"));
  print("End");
}

int findBiggest(List<int> param) {
  return param.reduce((prev, curr) {
    if (prev < curr) {
      return prev;
    } else {
      return curr;
    }
  });
}
