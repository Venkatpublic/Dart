import 'dart:async';
import 'dart:ffi';
import 'dart:isolate';
import 'dart:io';

Map<String, int> studentMarkList = {
  "Aarav": 67,
  "Vihaan": 54,
  "Ishaan": 78,
  "Rohan": 52,
  "Arjun": 29,
  "Kartik": 76,
  "Dev": 35,
  "Sanjay": 87,
  "Pranav": 45,
  "Ritesh": 32,
  "Aditya": 90,
  "Harsh": 90,
  "Raghav": 85,
};
void main(List<String> args) {
  int firstMark = studentMarkList.values.toList().reduce(whichIsBigger);
  List<String> failedList = List.empty(growable: true);
  List<String> toppersList = List.empty(growable: true);
  studentMarkList.forEach(
    (name, mark) => (mark < 35) ? failedList.add(name) : null,
  );
  double passPercentage =
      ((studentMarkList.length - failedList.length) / studentMarkList.length) *
      100;
  var topper = studentMarkList.entries
      .where((element) => element.value == firstMark)
      .toList();
  for (int i = 0; i < topper.length; i++) {
    toppersList.add(topper[i].key);
  }
  print(
    "First mark:$firstMark,pass percentage:$passPercentage,toppers:${toppersList.join(',')}",
  );
}

int whichIsBigger(int prev, int curr) {
  if (prev > curr) {
    return prev;
  } else {
    return curr;
  }
}
