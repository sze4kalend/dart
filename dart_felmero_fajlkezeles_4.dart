import 'dart:io';

void main() {
  // 4. feladat
  List<int> newNumbers = [8, 0, 5, 1, 3, 2, 11, 19, 1];

  // 1. Számok hozzáadása a fájlhoz
  addNumbers('numbers.txt', newNumbers);

  // 2. Beolvasás a már létező readFile függvénnyel
  String content = readFile('numbers.txt');
  // 3. Feldolgozás és kiíratás növekvő sorrendben
  printNumbers(content);
}

// 3. feladatból megmaradt readFile
String readFile(String fileName) {
  File file = File(fileName);
  if (file.existsSync()) {
    return file.readAsStringSync();
  } else {
    return '';
  }
}

// 4. feladat: addNumbers függvény
void addNumbers(String fileName, List<int> numbers) {
  File file = File(fileName);

  // A számokat Stringgé alakítom, vesszővel vagy szóközzel elválasztva
  // A feladat szerint az új adatok új sorban legyenek
  String dataToWrite = numbers.join(', ');

  // FileMode.append-et használtam arra, hogy ne törölje a régit, hanem a végére írja
  file.writeAsStringSync('\n$dataToWrite', mode: FileMode.append);
  print('Számok hozzáadva a $fileName fájlhoz.');
}

// 4. feladat: printNumbers függvény
void printNumbers(String content) {
  if (content.isEmpty) return;

  // Az összes számot kigyűjtöm a szövegből (kezelve a vesszőket és újsorokat)
  // Reguláris kifejezéssel kiszedünk minden számjegyet
  RegExp regExp = RegExp(r'\d+');
  Iterable<Match> matches = regExp.allMatches(content);

  List<int> allNumbers = [];
  for (var match in matches) {
    allNumbers.add(int.parse(match.group(0)!));
  }

  // Növekvő sorrendbe rendezés
  allNumbers.sort();

  print('Számok növekvő sorrendben:');
  for (int number in allNumbers) {
    print(number); // Soronként íratom ki, int típusként
  }
}
