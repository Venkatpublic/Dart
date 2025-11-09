// A hands-on, human-written collection of examples that explain
// Dart generics. Run this file with `dart run generics/main.dart`
// (from the repository root) to see the examples in action.

void main() {
  print('\n=== Dart Generics Examples ===\n');

  // 1) Generic function: returns the first non-null between two values.
  print('-- Generic function --');
  final a = firstNonNull<int?>(null, 42);
  final b = firstNonNull<String?>(null, 'hello');
  print('firstNonNull<int?>: $a');
  print('firstNonNull<String?>: $b\n');

  // 2) Generic class: a simple Box<T> that stores a value.
  print('-- Generic class --');
  final intBox = Box<int>(10);
  final strBox = Box<String>('dart');
  print('intBox: ${intBox.value}, strBox: ${strBox.value}');

  // Box with a generic method
  print('Box.map example: ${intBox.map((x) => x * 2).value}');

  // 3) Bounded type parameters: limits T to extend/implement a type.
  print('\n-- Bounded type parameter --');
  final dog = Dog('Buddy');
  final cat = Cat('Mittens');
  final dogWrapper = AnimalWrapper<Dog>(dog);
  final catWrapper = AnimalWrapper<Cat>(cat);
  print(dogWrapper.describe());
  print(catWrapper.describe());

  // 4) Generic typedefs (function types) and using them
  print('\n-- Generic typedef --');
  final Combiner<int> combiner = (a, b) => a + b;
  print('Combiner: ${combiner(2, 3)}');

  // 5) Collections with generics and simple covariance note
  print('\n-- Collections --');
  final List<int> ints = [1, 2, 3];
  final List<num> nums = [1.5, 2.5];
  // You cannot assign List<int> to List<num> (they're invariant)
  // nums = ints; // <-- compile-time error
  print('ints: $ints');
  print('nums: $nums');

  // 6) Generic constraints: using 'extends' and 'super' are for bounds
  print('\n-- Generic constraints and helper --');
  final printer = Printer<num>();
  printer.printValue(3.14);

  // 7) Practical example: a type-safe cache
  print('\n-- Practical: Type-safe Cache --');
  final cache = SimpleCache();
  cache.put<int>('count', 7);
  cache.put<String>('name', 'Venkat');
  final count = cache.get<int>('count');
  final name = cache.get<String>('name');
  print('cache count: $count, name: $name');

  print('\n=== End ===\n');
}

// ------------------ Generic function ------------------
// Returns the first argument that is not null. Demonstrates using
// a type parameter for return/input types.
T? firstNonNull<T>(T? a, T? b) => a ?? b;

// ------------------ Generic class ------------------
class Box<T> {
  T value;
  Box(this.value);

  // Generic method that transforms the contained value.
  Box<R> map<R>(R Function(T) f) => Box<R>(f(value));
}

// ------------------ Bounded type parameter ------------------
// We constrain T to be an Animal (or subtype). This allows us to call
// Animal methods on T safely inside the class.
abstract class Animal {
  final String name;
  Animal(this.name);
  String speak();
}

class Dog extends Animal {
  Dog(String name) : super(name);
  @override
  String speak() => 'Woof from $name';
}

class Cat extends Animal {
  Cat(String name) : super(name);
  @override
  String speak() => 'Meow from $name';
}

class AnimalWrapper<T extends Animal> {
  final T animal;
  AnimalWrapper(this.animal);
  String describe() => '${animal.speak()} (class: ${animal.runtimeType})';
}

// ------------------ Generic typedef ------------------
// A reusable generic function type alias. Here, Combiner<T> is a function
// that takes two Ts and returns a T.
typedef Combiner<T> = T Function(T a, T b);

// ------------------ Generic constraints example ------------------
// Demonstrates 'extends' bound for methods.
class Printer<T extends num> {
  void printValue(T value) {
    // We can call numeric operations because T extends num.
    print('Printing numeric value: ${value + 1}');
  }
}

// ------------------ Practical: Type-safe cache ------------------
// A small runtime-typed cache. Note: Dart generics are reified for
// checks such as `is T` at runtime for some operations, but type
// arguments are erased in many places — this cache uses runtime Type
// tokens to keep things safe.
class SimpleCache {
  final Map<String, Object?> _store = {};

  void put<T>(String key, T value) {
    _store[key] = value;
  }

  T? get<T>(String key) {
    final v = _store[key];
    if (v is T) return v;
    return null;
  }
}

// ---------- Notes (as comments) ----------
// - Dart generics are invariant: List<int> is not a subtype of List<num>.
// - You can bound type parameters with `extends` (e.g., <T extends Foo>).
// - Use type parameters on classes, methods, and typedefs.
// - For advanced variance control, Dart supports `covariant` for
//   parameter declarations on methods, but it's used sparingly.
// - This file is intentionally simple and 'human-written' — comments
//   explain why each example exists and what to observe when running.
