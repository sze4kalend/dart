import "dart:io";

void main(){
  List<String> vers = fileOlvaso('vers.txt');
  //versKiiratas(vers);
  //harmadikVersszak(vers);
  List<String> students = fileOlvaso('students_en.csv');
  fizikasok(students);
}

void fizikasok(tanulok) {
  
}

void harmadikVersszak(List<String> sorok) {
  int hanyadikSor = 0;
  for (var sor in sorok) {
    if (sor.isEmpty) {
      hanyadikSor++;
      if (hanyadiksor == 4) {
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