class UserProfile {
  String name; // Required, cannot be null
  String? email; // Optional, can be null
  int? age; // Optional, can be null

  UserProfile(this.name, {this.email, this.age});

  void displayInfo() {
    print('Name: $name');
    print('Email: ${email ?? 'Not provided'}');
    print('Age: ${age ?? 'Not specified'}');

    // Safe method call
    int? emailLength = email?.length;
    if (emailLength != null) {
      print('Email length: $emailLength');
    }
  }
}

void main() {
  // Valid - name is required, others are optional
  var user = UserProfile('Alice', email: 'alice@example.com');
  user.displayInfo();
}
