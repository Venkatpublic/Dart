Function outerShell(int first) {
  return (int second) => innerShell(first, second);
}

int innerShell(int first, int second) {
  return first + second;
}

void main(List<String> args) {
  Function one = outerShell(100);
  print("${one(50)}${one(100)}");
}
