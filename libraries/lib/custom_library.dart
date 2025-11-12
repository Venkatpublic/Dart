library first_library;

int get public => 12;
int get _private => 12;

class test {
  final int _privateFeld = 120000;
}

var frick = test();
int publicField = frick._privateFeld;
