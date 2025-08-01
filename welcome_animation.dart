import 'dart:io';
import 'dart:async';
import 'dart:math';

// ANSI color codes
class Colors {
  static const String red = '\x1B[31m';
  static const String green = '\x1B[32m';
  static const String yellow = '\x1B[33m';
  static const String blue = '\x1B[34m';
  static const String magenta = '\x1B[35m';
  static const String cyan = '\x1B[36m';
  static const String white = '\x1B[37m';
  static const String reset = '\x1B[0m';
  static const String bold = '\x1B[1m';
  static const String bright = '\x1B[1m';
}

void main() async {
  // Clear screen
  _clearScreen();
  
  // Show loading animation
  await _showLoadingAnimation();
  
  // Show welcome banner
  await _showWelcomeBanner();
  
  // Animated messages
  List<Map<String, String>> messages = [
    {'text': '🎯 Welcome to the Ultimate Dart Experience! 🎯', 'color': Colors.cyan},
    {'text': '✨ Get ready for some coding magic! ✨', 'color': Colors.yellow},
    {'text': '🚀 Dart: Fast, Modern, and Powerful! 🚀', 'color': Colors.green},
    {'text': '💻 Cross-platform development made easy! 💻', 'color': Colors.magenta},
    {'text': '🎉 Let the coding adventure begin! 🎉', 'color': Colors.red}
  ];

  for (var message in messages) {
    await _typewriterEffect(message['text']!, message['color']!);
    await Future.delayed(Duration(milliseconds: 1500));
  }
  
  await _showFinalMessage();
}

void _clearScreen() {
  if (Platform.isWindows) {
    Process.runSync('cls', [], runInShell: true);
  } else {
    Process.runSync('clear', [], runInShell: true);
  }
}

Future<void> _showLoadingAnimation() async {
  List<String> spinners = ['⠋', '⠙', '⠹', '⠸', '⠼', '⠴', '⠦', '⠧', '⠇', '⠏'];
  
  stdout.write('${Colors.cyan}${Colors.bold}Loading Dart Magic ');
  for (int i = 0; i < 30; i++) {
    stdout.write('\r${Colors.cyan}${Colors.bold}Loading Dart Magic ${spinners[i % spinners.length]}');
    await Future.delayed(Duration(milliseconds: 100));
  }
  stdout.write('\r${Colors.green}${Colors.bold}✅ Ready to go!${Colors.reset}\n\n');
  await Future.delayed(Duration(milliseconds: 500));
}

Future<void> _showWelcomeBanner() async {
  String banner = '''
${Colors.blue}${Colors.bold}
╔══════════════════════════════════════════════════════════════╗
║                                                              ║
║              🎯  DART TERMINAL EXPERIENCE  🎯               ║
║                                                              ║
║           Built for macOS & Windows Terminals               ║
║                                                              ║
╚══════════════════════════════════════════════════════════════╝
${Colors.reset}
''';
  
  List<String> lines = banner.split('\n');
  for (String line in lines) {
    print(line);
    await Future.delayed(Duration(milliseconds: 100));
  }
}

Future<void> _typewriterEffect(String message, String color) async {
  stdout.write('  ${color}${Colors.bold}');
  for (int i = 0; i < message.length; i++) {
    stdout.write(message[i]);
    await Future.delayed(Duration(milliseconds: 50));
  }
  stdout.write('${Colors.reset}\n');
}

Future<void> _showFinalMessage() async {
  await Future.delayed(Duration(milliseconds: 1000));
  
  // Pulsing effect
  for (int i = 0; i < 3; i++) {
    stdout.write('\r${Colors.green}${Colors.bold}🌟 All systems ready! Happy coding! 🌟');
    await Future.delayed(Duration(milliseconds: 500));
    stdout.write('\r${Colors.bright}🌟 All systems ready! Happy coding! 🌟');
    await Future.delayed(Duration(milliseconds: 500));
  }
  stdout.write('${Colors.reset}\n\n');
  
  // Show compilation info
  print('${Colors.cyan}📦 This executable was compiled with Dart ${Platform.version}${Colors.reset}');
  print('${Colors.yellow}🖥️  Running on: ${Platform.operatingSystem} ${Platform.operatingSystemVersion}${Colors.reset}');
  print('${Colors.magenta}⚡ Performance: Native AOT compilation${Colors.reset}');
  
  // Random tech tip
  List<String> tips = [
    '💡 Tip: Use "dart compile exe" to create native executables!',
    '💡 Tip: Dart can compile to JavaScript, ARM, and x64!',
    '💡 Tip: Hot reload makes Dart development super fast!',
    '💡 Tip: Dart has built-in null safety for safer code!',
    '💡 Tip: Use "dart pub" to manage your project dependencies!'
  ];
  
  Random random = Random();
  String randomTip = tips[random.nextInt(tips.length)];
  
  await Future.delayed(Duration(milliseconds: 1000));
  print('\n${Colors.blue}${randomTip}${Colors.reset}\n');
}
