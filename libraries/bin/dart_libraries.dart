import 'dart:async';
import 'dart:ffi';
import 'dart:isolate';
import 'dart:io';

void main(List<String> args) {
  var func = callableClass();
  func(10000);
}

class callableClass {
  void call(dynamic param) => print("User have given $param as input");
}
