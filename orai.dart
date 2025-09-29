import 'dart:io';
import 'dart:math';
void main() {
  //1.feladat
  print('Kérek 1 egész számot: ');
  int szam = int.parse(stdin.readLineSync()!);
  //2.feladat
  if (szam % 2 == 0) {
    print('$szam : Ez egy páros szám.');
  } else {
    print('$szam : Ez egy páratlan szám.');
  }
  //3.feladat
  if (szam == 5) {
    print('Jeles (5)');
  } else if (szam == 4) {
    print('Jó (4)');
  } else if (szam == 3) {
    print('Közepes (3)');
  } else if (szam == 2) {
    print('Elégséges (2)');
  } else if (szam == 1) {
    print('Elégtelen (1)');
  } else {
    print('Érvénytelen osztályzat: $szam. Kérlek, adj meg 1 és 5 közötti számot.');
  }
  //4.feladat
  switch (szam) {
    case 5:
      print('Kiváló (5)');
      break;
    case 4:
      print('Jó (4)');
      break;
    case 3:
      print('Közepes (3)');
      break;
    case 2:
      print('Elégséges (2)');
      break;
    case 1:
      print('Elégtelen (1)');
      break;
    default:
      print('Érvénytelen osztályzat: $szam. Kérlek, adj meg 1 és 5 közötti számot.');
  }
  //5.feladat
  print('Kérek 1 egész számot: ');
  int szam1 = int.parse(stdin.readLineSync()!);
  print('Kérek mégegy egész számot: ');
  int szam2 = int.parse(stdin.readLineSync()!);
  if (szam1 > szam2) {
    print('A nagyobb szám az első bekért szám: $szam1');
  } else if (szam2 > szam1) {
    print('A nagyobb szám a MÁSODIK bekért szám: $szam2');
  } else {
    print('A két szám egyenlő: $szam1');
  }
  //6.feladat
  stdout.write("Kérek egy egész számot: ");
  int szam3 = int.parse(stdin.readLineSync()!);  
  if (szam3 % 2 == 0) {
    print('A szám páros');
  } else {
    print('A szám páratlan');
  }
  if (szam3 > 0) {
    print('A szám pozitív');
  } else if (szam3 < 0) {
    print('A szám negatív');
  } else {
    print('A szám nulla');
  }
  if (szam3 < 0) {
    print('Ez a szám negatív tehát a szám nem négyzetszám');
  } else {
    double gyok = sqrt(szam3);
    if (gyok == gyok.toInt()) {
      print('A szám négyzetszám : gyöke: ${gyok.toInt()}.');
    } else {
      print('A szám nem négyzetszám!');
    }
  }
  //7.feladat
  stdout.write("Kérem az összpontszámot: ");
  int osszPont = int.parse(stdin.readLineSync()!);
  stdout.write("Kérem az elért pontszámot: ");
  int elertPont = int.parse(stdin.readLineSync()!);
  double szazalek = (elertPont / osszPont) * 100;
  int kerekitettSzazalek = szazalek.round();
  print('Elért százalék: ${szazalek.toStringAsFixed(2)}% (Kerekítve: $kerekitettSzazalek%)');
  String ertekeles;
  switch (kerekitettSzazalek) {
    case >= 90:
      ertekeles = 'A';
      break;
    case >= 80:
      ertekeles = 'B';
      break;
    case >= 70:
      ertekeles = 'C';
      break;
    case >= 60:
      ertekeles = 'D';
      break;
    case >= 50:
      ertekeles = 'E';
      break;
    default: 
      ertekeles = 'F';
  }
  print('Amerikai értékelés: $ertekeles');
}
