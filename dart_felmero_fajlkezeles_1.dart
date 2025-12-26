import 'dart:io';

//1.feladat
void main() {
  // Meghívom a függvényt a kért fájlnevekkel
  createFile('players.txt');
  createFile('cars.txt');
}

void createFile(String fileName) {
  // Létrehozok egy File objektumot a megadott névvel
  File file = File(fileName);

  try {
    // A createSync(recursive: true) létrehozza a fájlt.
    // Ha már létezik, nem csinál semmit.
    file.createSync();

    // Ellenőrzöm, hogy tényleg létezik-e a fájl
    if (file.existsSync()) {
      print('A(z) "$fileName" fájl létrehozása sikeres volt.');
    } else {
      print('A(z) "$fileName" fájlt nem sikerült létrehozni.');
    }
  } catch (e) {
    // Ha hiba történik (pl. nincs jogosultság), azt itt leellenőrzöm/"elkapom"
    print('Hiba történt a(z) "$fileName" létrehozásakor: $e');
  }
}
