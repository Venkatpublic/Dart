class fruit {
  int calorie = 100;
  String name;
  fruit({required this.name});
  var pri = _privateFruit();
  void pvr() {
    pri.sayit();
    print("wqqwdqdw");
  }
}

final class final_fruit {
  String? name;
  void sayname() {
    print("I am a final private ${name}");
  }
}

sealed class sealed_fruit {
  String name = "fruit but sealed";
}

class _privateFruit {
  void sayit() => print("I am private");
}
