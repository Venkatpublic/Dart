import 'dart:io';

void main() {
  final cpuCount = Platform.numberOfProcessors;
  print(cpuCount);
  Future.delayed(const Duration(seconds: 5), () => print("33ff3f"));
}
