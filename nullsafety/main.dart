void main() {
  type_system();
}

void type_system() {
  BigInt big = BigInt.parse('1242568568678568568341242342345235');
  BigInt bigB = BigInt.parse('1242568568678568568341242342345235');
  BigInt bigC = big * bigB;
  print(bigC.runtimeType);
  print(bigC);
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
