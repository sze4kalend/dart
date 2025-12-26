import 'dart:io';

void main() {
  // 1. feladat hívásai (hogy lássuk a folyamatot)
  createFile('players.txt');
  createFile('cars.txt');

  // 2. feladat hívása
  deleteFile('players.txt');
}

// 1. feladat: createFile függvény
void createFile(String fileName) {
  File file = File(fileName);
  file.createSync();
  if (file.existsSync()) {
    print('A(z) $fileName fájl létrehozása sikeres volt.');
  }
}

// 2. feladat: deleteFile függvény
void deleteFile(String fileName) {
  File file = File(fileName);

  // Előbb megnézzük, létezik-e a fájl
  if (file.existsSync()) {
    file.deleteSync(); // Törlés

    // Ellenőrizzük, hogy tényleg eltűnt-e
    if (!file.existsSync()) {
      print('A(z) $fileName törlése sikeres volt.');
    } else {
      print('A(z) $fileName törlése sikertelen.');
    }
  } else {
    print('A(z) $fileName nem törölhető, mert nem is létezik.');
  }
}
