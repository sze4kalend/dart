import 'dart:io';

void main() {
  String content = readFile('employees.txt');
  printContent(content);
}

// 3. feladat: readFile függvény
// Beolvassa a fájlt és String-ként adja vissza a tartalmát
String readFile(String fileName) {
  File file = File(fileName);
  if (file.existsSync()) {
    return file.readAsStringSync();
  } else {
    print('Hiba: A fájl nem található!');
    return '';
  }
}

// 3. feladat: printContent függvény
// Feldolgozza a szöveget: szétválasztja a nőket és férfiakat, majd kiírja őket
void printContent(String content) {
  if (content.isEmpty) return;

  // Sorokra bontom a tartalmát
  List<String> lines = content.split('\n');

  List<String> women = [];
  List<String> men = [];

  for (var line in lines) {
    if (line.trim().isEmpty) continue; // Üres sorok átugrása

    // Feltételezve, hogy a sor végén szerepel a "nő" vagy "férfi" szó
    if (line.toLowerCase().contains('nő')) {
      women.add(line);
    } else if (line.toLowerCase().contains('férfi')) {
      men.add(line);
    }
  }

  print('--- Nők ---');
  women.forEach((p) => print(p));

  print('\n--- Férfiak ---');
  men.forEach((p) => print(p));
}
