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
    // Felbontjuk a sort vesszők mentén: [Név, Kor, Nem, Magasság]
    List<String> parts = line.split(',');

    if (parts.length >= 3) {
      String gender = parts[2].trim().toLowerCase();

      if (gender == 'female') {
        women.add(line);
      } else if (gender == 'male') {
        men.add(line);
      }
    }
  }
  // Először a nők, utána a férfiak kiírása
  print('--- Nők (Females) ---');
  for (var person in women) {
    print(person.trim());
  }

  print('\n--- Férfiak (Males) ---');
  for (var person in men) {
    print(person.trim());
  }
}
