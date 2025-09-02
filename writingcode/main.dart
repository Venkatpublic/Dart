// Null Safety Basics Example
void main() {
  // 1. Non-nullable by default
  String name = "Alice";
  // name = null; // This would cause a compile error

  // 2. Nullable types
  String? nickname = null;
  nickname = "Al";

  // 3. Null check operators
  print(nickname?.toUpperCase()); // Safe call
  print(nickname!.toUpperCase()); // Assertion (only use when sure)

  // 4. Late initialization
  late String message;
  message = "Initialized later";
  print(message);

  // 5. Null coalescing
  String displayName = nickname ?? "Guest";
  print("Welcome, $displayName");

  // 6. Class with null safety
  User user = User(name: "Bob");
  print(user.name.toUpperCase());
}

class User {
  final String name;
  String? email;

  User({required this.name, this.email});

  void printDetails() {
    print("Name: $name");
    if (email != null) {
      print("Email: ${email!.toLowerCase()}");
    }
  }
}
