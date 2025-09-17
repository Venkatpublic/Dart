import 'dart:ffi';
import 'custom_impl.dart';
import 'dart:math';
import 'package:equatable/equatable.dart';

final rng = Random();
late final int exp;
int global = 8;
void main(List<String> inputs) {
  var ids = [1, 2, 3, 4, 5];
  ids = ids.map((item) => item * 2).toList();
  print(ids);
  var f = ids.map((item) => item * 2).toList();
  print(f);
}

int printer(int item) {
  print("item:$item");
  return item * 2;
}

class A extends Equatable {
  final int a;
  final int b;
  const A(this.a, this.b);

  @override
  List<Object?> get props => [a, b];
}

class volkswagon {
  final int speed;
  volkswagon(this.speed);
}

class audi extends volkswagon {
  audi(int speed) : super(speed);
  String operator +(volkswagon other) => 'audi()';
}

class bmw extends volkswagon {
  bmw(int speed) : super(speed);
  String operator +(volkswagon other) => 'bmw()';
}

class dober {
  void call() => print('noiceeee');
}

void required_positional(int? a, int b) {
  print("$a,$b");
}

void optional_positional([int? a, int? b]) {
  print("$a,$b");
}

void required_named({int? a, required int b}) {
  print("$a,$b");
}

void optional_named({int a = 1, int b = 2}) {
  print("$a,$b");
}

Function greet(int role) {
  String role_name() {
    if (role == 1) {
      return 'Lord';
    } else if (role == 2) {
      return 'Master';
    } else if (role == 3) {
      return 'General';
    } else {
      return 'soldier';
    }
  }

  return (String name) => print("Well Hello there, ${role_name()}.$name");
}

Function caller(int role) {
  String role_name() {
    if (role == 1) {
      return 'Lord';
    } else if (role == 2) {
      return 'Master';
    } else if (role == 3) {
      return 'General';
    } else {
      return 'soldier';
    }
  }

  return (String name) => memoriser(role_name(), name);
}

void memoriser(String role, String name) {
  print("Well hello there, ${role}.${name}");
}

// void addrole(void Function(String) wish, String name, int role) {
//   String name_of_role() {
//     if (role == 1) {
//       return 'lord';
//     } else if (role == 2) {
//       return 'master';
//     } else if (role == 3) {
//       return 'general';
//     } else {
//       return 'soldier';
//     }
//   }

//   String name_with_role = name_of_role() + " " + name;
//   wish(name_with_role);
// }

// void greeter(String param) {
//   print("Hello there $param");
// }

// void test(String name) {
//   print("hello $name,good morning");
// }

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
