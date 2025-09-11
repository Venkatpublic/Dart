import 'dart:ffi';
import 'custom_impl.dart';
import 'dart:math';

final rng = Random();
late final int exp;
int global = 8;
void main() {
  String greet = "Hello i'm venkat";
  String message =
      greet +
      'i am a'
          'hero \u{1F399}';
  String quote = '''we hoo
  hallla
  noice''';
  print(message);
}

class country {
  final List name;

  static late int population;
  void print_population() {
    print(population);
  }

  const country({required this.name});
}

late final String cacheddata = heavy_computations();
String uncached = heavy_computations();
String heavy_computations() {
  int random = rng.nextInt(10);
  return 'done work $random';
}

class weather_station {
  static const h = 12;
  late int weather = temparature();
  int temparature() {
    print('calculating');
    return 25;
  }
}

class test_class {
  String name;
  int age;
  int? run;
  int? speed;
  static late String amiokay;
  String? what_i_need;
  test_class({required this.name}) : age = 20 {}
}

void posiitonlaMandatory(int a, int b) {
  print("$a,$b");
}

void posiitonlaOptional([int? a, int? b]) {
  print("$a,$b");
}

void namedMandatory({required int a, required int b}) {
  print("$a,$b");
}

void namedOptional({int a = 0, int b = 1}) {
  print("$a,$b");
}

void gitter(String wish, String? greet) {
  wish.toUpperCase();
  if (greet != null) {
    greet.toUpperCase();
  }
}

String string_returner(int? input, int? level) {
  int age;
  if (input == 1) {
    return 'Investor';
  } else if (input == 2) {
    return 'CEO/CTO';
  } else if (level! >= 10) {
    return 'senior';
  } else {
    throw ArgumentError();
  }
}

void sample() {
  int g;
  g = 10;
  print(g + 5);
}

Function test1 = () => (print('one'));
void test2() {
  print('two');
}

String heavyComputation() {
  print('Computing...');
  return 'Result';
}

void test3(param) {
  param();
  print(param.runtimeType);
}

String cached = heavyComputation();

void type_system() {
  BigInt big = BigInt.parse('1242568568678568568341242342345235');
  BigInt bigB = BigInt.parse('1242568568678568568341242342345235');
  BigInt bigC = big * bigB;
  double has = 10.00;
  String name = 'bond';
  bool noice = true;
  List a = [1, 2, 'wetwetwet', null, 4];
  List<String?> b = ['fqwqwf', 'qwqwf', null];
  Set h = {1, 2, 3, 4, 'me', 'you', 'we', 'me'};
  Map<String, int> K = {name: 12};
  void Function(String) printer = (msg) => print(msg);
  Function(String) hiter = (param) => print("hit with $param");
  int Function(int) tellage = (param) => 2025 - param;
  int decider(param1, param2) {
    if (param1) {
      return 100;
    } else if (param2) {
      return 200;
    } else {
      return 50;
    }
  }

  ;
  var ghh = 'venkat';
  print(ghh != 'venkat');
}

void whato_watch(String? time, String? mood, int? credits, int? offer) {
  if (offer != null && credits != null) {
    credits = credits + offer;
  } else if (offer != null && credits == null) {
    credits = offer;
  }
  print(credits);
  if (time != null &&
      credits != null &&
      time.endsWith("AM") &&
      mood == ("Happy")) {
    print("Action as it is morning and you are happy");
  } else if (time != null &&
      credits != null &&
      time.endsWith("AM") &&
      mood == ("Sad")) {
    print('Thriller as it is morning and you are sad');
  } else if (time != null &&
      credits != null &&
      time.endsWith("PM") &&
      mood == ("Happy")) {
    print('Romance as it is evening and you are happy');
  } else if (time != null &&
      credits != null &&
      time.endsWith("PM") &&
      mood == ("Sad")) {
    print('Adventure as it is evening and you are sad');
  } else if (credits == null) {
    print("user dont have enough credits");
  } else {
    print('No inputs from user');
  }
}
