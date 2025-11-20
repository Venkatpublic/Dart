import 'dart:io';

void main() {
  List<String> names = [
    'Alice',
    'AliceWonder',
    'Abraham',
    'Allin',
    'Buhavnesh',
    'bob',
    'Charlie',
    'Catherine',
    'david',
    'davidane',
    'Diana',
    'Eve',
    'eve'
  ];

  stdout.write("Enter your name: ");
  String? userQuery = stdin.readLineSync();
  String searchResult = searchName(names, userQuery);
  print(searchResult);
}

String searchName(List<String> names, String? query) {
  if (query == null || query.trim().isEmpty) {
    return 'Name not found';
  }

  String searchQuery = query.toLowerCase();

  final List<MapEntry<String, int>> scored = [];

  for (String item in names) {
    final lower = item.toLowerCase();
    final score = stringCompareScore(lower, searchQuery);
    if (score > 0) {
      scored.add(MapEntry(item, score)); // keep original name
    }
  }

  if (scored.isEmpty) return 'Name not found';

  // sort by score DESC
  scored.sort((a, b) => b.value.compareTo(a.value));

  // return names in order of score
  return scored.map((e) => e.key).join(',');
}

int stringCompareScore(String main, String comp) {
  int score = 0;

  if (comp.isEmpty) return 0;

  // exact match → strong score
  if (main == comp) {
    return 5;
  }

  // contains
  if (main.contains(comp)) {
    score += 1;
  }

  // main starts with comp
  // (equivalent to your substring check, but clearer)
  if (main.startsWith(comp)) {
    score += 1;
  }

  // prefix character matching (dynamic instead of hard-coded 0/1/2/3)
  // e.g. +1 for first char match, +1 for first 2, etc.
  final int maxPrefix = main.length < comp.length ? main.length : comp.length;

  int prefixLen = 0;
  for (int i = 0; i < maxPrefix && i < 6; i++) {
    // limit to first 4 chars if you like
    if (main.codeUnitAt(i) == comp.codeUnitAt(i)) {
      prefixLen++;
    } else {
      break; // stop as soon as they differ
    }
  }
  score += prefixLen;

  return score;
}
