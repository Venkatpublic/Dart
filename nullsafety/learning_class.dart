class somo {
  int? named_instance;
  static late int gizz;
  void say() {
    print('${gizz + named_instance!}');
  }
}
