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
  print("Enter your name:");
  String? userQuery = stdin.readLineSync();
  String searchResult = searchName(names, userQuery);
  print(searchResult);
}

String searchName(List<String> names, String? query) {
  String searchQuery = query is String ? query.toLowerCase() : '';
  List<String> results = List.empty(growable: true);
  Map<String, int> data = Map();
  for (String item in names) {
    String name = item.toLowerCase();
    int score = stringCompareScore(name, searchQuery);
    if (score > 0) {
      data.addEntries([MapEntry(name, score)]);
    }
  }

  var sortedByKey = Map.fromEntries(
    data.entries.toList()..sort((a, b) => a.value.compareTo(b.value)),
  );
  return sortedByKey.keys.toList().reversed.join(',');
}

int stringCompareScore(String main, String comp) {
  int score = 0;
  if (main == comp) {
    return 5;
  }
  if (main.contains(comp)) {
    score += 1;
  }
  if (main.substring(
          0, main.length >= comp.length ? comp.length : main.length) ==
      comp) {
    score += 1;
  }
  for (int i = 0; (i < main.length) && (i < comp.length); i++) {
    if (prefixCondition(main, comp, 0)) {
      score += 1;
    }
  }
  return score;
}

bool prefixCondition(String main, String comp, int index) {
  if ((main.length > (index + 1)) && (comp.length > (index + 1))) {
    return (main[index] == comp[index]) &&
        prefixCondition(main, comp, index + 1);
  } else if ((main.length > index) && (comp.length > index)) {
    return (main[index] == comp[index]);
  }
  return false;
}
