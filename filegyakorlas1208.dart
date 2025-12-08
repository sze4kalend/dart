import "dart:io";

void main(){
  List<String> vers = fileOlvaso('vers.txt');
  //versKiiratas(vers);
  //harmadikVersszak(vers);
  List<String> students = fileOlvaso('students_en.csv');
  fizikasok(students);
  addStudent('students_en.csv', 'Adam', 'Sandler', 'adam@sandler.com', '12B', 'Mobile development');
  addStudent('students_en.csv', 'Luke', 'Lucky', 'Luke@lucky.com', '12B', 'Mobile development');
}

void addStudent(filename, fname, lname, email, clas, subject) {
  String ujsor = [fname, lname, email, clas, subject].join(';');
  File file = File(filename);
  file.writeAsString('\n' + ujsor, mode: FileMode.append);
}

void fizikasok(tanulok) {
  int lname = 0;
  int fname = 1;
  int subject = 4;
  for (String sor in tanulok) {
    List<String> tanulo = sor.split(';');
    if (tanulo.last == 'Physics'){
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
  List<String> tartalom = [];
  File file = File(fileName);
  tartalom = file.readAsLinesSync();
  return tartalom;
}