import "dart:io";

void main() {
  List<String> vers = fileOlvaso('vers.txt');
  // versKiiratas(vers);
  // harmadikVersszak(vers);

  List<String> students = fileOlvaso('students_en.csv');
  fizikasok(students);

  // addStudent('students_en.csv', 'Adam', 'Sandler', 'adam@sandler.com', '12B', 'Mobile development');
  // addStudent('students_en.csv', 'Luke', 'Lucky', 'Luke@lucky.com', '12B', 'Mobile development');

  Map<String, List<String>> osztalyok = osztalyokszerint(students);
  print(osztalyok);
}

// JAVÍTVA: A függvénynek kell egy visszatérési típus és egy rendes törzs
Map<String, List<String>> osztalyokszerint(List<String> tanulok) {
  Map<String, List<String>> eredmeny = {}; // Ebbe gyűjtjük az adatokat

  int lname = 0;
  int fname = 1;
  int clas = 3;

  for (String sor in tanulok) {
    List<String> tanulo = sor.split(';');

    // Ellenőrizzük, hogy a sor nem üres-e
    if (tanulo.length > 3) {
      String osztalyNev = tanulo[clas];
      String teljesNev = "${tanulo[fname]} ${tanulo[lname]}";

      // Ha az osztály még nincs benne a Map-ben, létrehozzuk a listáját
      if (!eredmeny.containsKey(osztalyNev)) {
        eredmeny[osztalyNev] = [];
      }
      // Hozzáadjuk a tanulót az osztály listájához
      eredmeny[osztalyNev]!.add(teljesNev);
    }
  }
  return eredmeny;
}

void addStudent(filename, fname, lname, email, clas, subject) {
  String ujsor = [fname, lname, email, clas, subject].join(';');
  File file = File(filename);
  // A Sync verzió biztosabb konzolos környezetben
  file.writeAsStringSync('\n' + ujsor, mode: FileMode.append);
}

void fizikasok(tanulok) {
  int lname = 0;
  int fname = 1;
  // int subject = 4; // Ez az órai kódban szerepelt
  for (String sor in tanulok) {
    List<String> tanulo = sor.split(';');
    if (tanulo.isNotEmpty && tanulo.last == 'Physics') {
      print(tanulo[fname] + ' ' + tanulo[lname]);
    }
  }
}

void harmadikVersszak(List<String> sorok) {
  int hanyadikSor = 0;
  for (var sor in sorok) {
    if (sor.isEmpty) {
      hanyadikSor++;
      if (hanyadikSor == 4) {
        break;
      }
    }
  }
}

void versKiiratas(sorok) {
  for (var sor in sorok) {
    print(sor);
  }
}

List<String> fileOlvaso(fileName) {
  File file = File(fileName);
  if (file.existsSync()) {
    return file.readAsLinesSync();
  }
  return [];
}
