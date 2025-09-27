import 'dart:ffi';
import 'dart:io';
import 'custom_impl.dart';
import 'dart:math';
import 'package:equatable/equatable.dart';
import 'learning_class.dart';

final rng = Random();
late final int exp;
var global = 10;

enum user { darth, sithlord, yoda, kenobi, padme }

class failed_in_language implements Exception {
  final String message;
  failed_in_language({required this.message});
}

class failed_in_core implements Exception {
  final String message;
  failed_in_core({required this.message});
}

class failed_in_social implements Exception {
  final String message;
  failed_in_social({required this.message});
}

class differ {
  @override
  int get hashCode => 100;
  @override
  bool operator ==(Object other) {
    return this.hashCode == other.hashCode;
  }
}

class differTwo {
  @override
  int get hashCode => 100;
  @override
  bool operator ==(Object other) {
    return this.hashCode == other.hashCode;
  }
}

class instances_test {
  int age = 25;
  String? name;
  final int speed = 30;
  late final int weight;
  late final int working_efficiency = 20;
  static bool is_good = true;
  static late final int groot;
  static const int topo = 10;
}

class hazardus {
  hazardus(int g, this.name) : hj = 100, gg = g {
    gg = gg * 2;
  }
  final String name;
  int b = 99;
  int gg = 10;
  late int a;
  int hj;
}

class employee {
  employee({
    required this.employee_code,
    required this.name,
    this.years_of_experience,
    this.tech_stack,
    this.salary,
  });
  employee.custom({required List<dynamic> data})
    : employee_code = data[0]!,
      name = data[1]! {}
  static late String department;
  final int employee_code;
  final String name;
  double? years_of_experience;
  List<String>? tech_stack;
  late int? salary;
}

class resign {
  const resign(this.x, this.y);
  resign.zerox(int z) : this(0, z);
  resign.zeroy(int z) : this(z, 0);
  static const resign some = resign(0, 0);
  final int x;
  final int y;
}

class firstSingleTon {
  firstSingleTon.privateConstructor();
  static final instance = firstSingleTon.privateConstructor();
  factory firstSingleTon() => instance;
  String? name;
  void custom_print() {
    print("Hello to $name");
  }
}

class ccustomClass {
  String? name;
  void custom_print() {
    print("Hello to $name");
  }
}

class Country {
  final String country_name;
  int population = 1463865525;
  static final String national_flower = 'Lotus';
  int number_of_states = 36;
  String? national_language = null;
  Country({required String name, String? national_language})
    : country_name = name {
    this.national_language = national_language;
  }
  Country.initializeAsinda() : country_name = 'india';
  void create_new_state(List<String> newStates) {
    number_of_states = number_of_states + newStates.length;
  }

  void who_has_power() {
    print("Central government has more power");
  }
}

class State extends Country {
  final String name;
  State({
    required String country_name,
    required String name,
    String? national_language,
  }) : this.name = name,
       super(name: country_name, national_language: national_language);
  factory State.autoLang({required String name, required String country_name}) {
    if (name == 'Tamilnadu') {
      return State(
        country_name: country_name,
        name: name,
        national_language: null,
      );
    } else {
      return State(
        country_name: country_name,
        name: name,
        national_language: 'Hindi',
      );
    }
  }
  @override
  void who_has_power() {
    print("State and central government has equal power");
  }
}

class Animal {
  final String name;
  Animal({required String name}) : this.name = name;
  void whatAmi() => print("I am $name");
  void chase(Animal animal) {
    print("I chase ${animal.name}");
  }
}

class mouse extends Animal {
  mouse({required name}) : super(name: name);
  @override
  void chase(Animal? animal) {
    print("I cant chase anyone");
  }
}

class cat extends Animal {
  cat({required name}) : super(name: name);
  @override
  void chase(Animal mouse) {
    print('I chase ${mouse.name} the mouse');
  }
}

class dog extends Animal {
  dog({required String name}) : super(name: name);
  @override
  void chase(covariant cat Cat) {
    print("I chase an ${Cat.name}");
  }
}

void main(List<String> inputs) {
  var jerry = mouse(name: "Jerry the mouse");
  var tom = cat(name: "Tom the cat");
  var Dog = dog(name: "The dog");
  tom.chase(jerry);
  Dog.chase(tom);
  jerry.chase(null);
}

void test_throw(var param) {
  try {
    var w = double.parse(param);
    print(w);
  } catch (e) {
    print("catched in inner block $e");
    rethrow;
  }
}

void greettoUser(user? name) {
  switch (name) {
    case user.sithlord:
      print("galactic ruler sithlord");
    case user.yoda:
      print("Master yoda");
    case user.padme:
      print("Padme is dead");
    default:
      print("nor result");
  }
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
