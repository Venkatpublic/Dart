import 'dart:io';
import 'dart:math';

void main() {
  print('Welcome to Guess the Number!');
  print('I have picked a number between 1 and 100. Can you guess it?');

  final random = Random();
  final int secretNumber = random.nextInt(100) + 1; // Number between 1 and 100
  int attempts = 0;
  int? guess;

  while (guess != secretNumber) {
    stdout.write('Enter your guess: ');
    String? input = stdin.readLineSync();

    if (input == null || input.isEmpty) {
      print('Please enter a number.');
      continue;
    }

    try {
      guess = int.parse(input);
      attempts++;

      if (guess! < secretNumber) {
        print('Too low! Try again.');
      } else if (guess > secretNumber) {
        print('Too high! Try again.');
      }
    } on FormatException {
      print('Invalid input. Please enter a whole number.');
    }
  }

  print(
    'Congratulations! You guessed the number $secretNumber in $attempts attempts.',
  );
}
