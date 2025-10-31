import 'dart:ffi';
import 'dart:io';
import 'dart:math';
import 'package:equatable/equatable.dart';
import 'learning_class.dart';
import 'privarte_class.dart';

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

abstract class pantInterface {
  late int hipSize;
  String? material;
  void wear() {
    print('im wearing a pant');
  }
}

class clothing {
  late final String gender;
  late String type;
  void wear() {
    print('im wearing $type');
  }

  external color();
}

class shirt extends clothing {
  void newwear() {
    super.wear();
  }
}

class pant implements clothing, pantInterface {
  String gender;
  String type;
  int hipSize = 34;
  String? material = 'cotton';

  pant({required this.gender, required this.type});
  void wear() {
    print("im wearing a pant");
  }

  void color() {
    print("this pant is nice but he color?");
  }
}

class testmixin {
  String? data;
  void sayit() {}
}

abstract class testmixintypetwo {
  String? datatwo;
  void sayittwo();
}

mixin testmixinthree {
  void sayitthree();
}

class userofmixin extends testmixintypetwo {
  String? data = 'wefwef';
  String? datatwo;
  void sayitthree() {}
  void sayittwo() {
    print("efewf");
  }

  void sayit() {
    print("ewfwef");
  }
}

class performer {
  void perform() => print("Starting to perform");
}

mixin guitarist {
  void playGuitar() => print("Playing guitar");
  void perform() => playGuitar();
}
mixin drummer on performer {
  void playDrums() => print("Playing drums");
  void perform() => perform();
  void test() => super.perform();
}

class musician extends performer with drummer, guitarist {}

class speaking_fruit extends fruit {
  speaking_fruit({required String fruit}) : super(name: fruit);
  void howmuchCalorie() {
    print("i have ${this.calorie}");
  }
}

class Box<T> {
  T value;
  Box(this.value);

  void showType() {
    print("Value is $value of type ${value.runtimeType}");
  }
}

T getFirst<T>(List<T> items) {
  return items.first;
}

void main(List<String> inputs) {
  print(getFirst<int>([1, 2, 3]).runtimeType);
  print(getFirst<String>(["A", "B"]).runtimeType);
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

// Function caller(int role) {
//   String role_name() {
//     if (role == 1) {
//       return 'Lord';
//     } else if (role == 2) {
//       return 'Master';
//     } else if (role == 3) {
//       return 'General';
//     } else {
//       return 'soldier';
//     }
//   }

//   return (String name) => memoriser(role_name(), name);
// }

// void memoriser(String role, String name) {
//   print("Well hello there, ${role}.${name}");
// }

class country {
  final List name;

  static late int population;
  void print_population() {
    print(population);
  }

  const country({required this.name});
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
