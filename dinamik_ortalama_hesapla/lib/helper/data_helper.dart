import 'package:dinamik_ortalama_hesapla/model/dersler.dart';
import 'package:flutter/material.dart';

class DataHelper {

  //harf notu icin dropdown 
  static List<String> _tumHarfler() {
    return ["AA", "BA", "BB", "CB", "CC", "DC", "DD", "FD", "FF"];
  }

  static double _harfiNotaCevir(String harf) {
    switch (harf) {
      case "AA":
        return 4;
      case "BA":
        return 3.5;
      case "BB":
        return 3;
      case "CB":
        return 2.5;
      case "CC":
        return 2;
      case "DC":
        return 1.5;
      case "DD":
        return 1;
      case "FD":
        return 0.5;
      case "FF":
        return 0;
      default:
        return 1;
    }
  }

  static String notuHarfeCevir(double not) {
    switch (not) {
      case 4:
        return "AA";
      case 3.5:
        return "BA";
      case 3:
        return "BB";
      case 2.5:
        return "CB";
      case 2:
        return "CC";
      case 1.5:
        return "DC";
      case 1:
        return "DD";
      case 0.5:
        return "FD";
      case 0:
        return "FF";
      default:
        return "DD";
    }
  }

  static List<DropdownMenuItem<double>> tumDersler() {
    //map ile istenilen yapıyı olusturdum
    return _tumHarfler()
        .map((okunanDeger) => DropdownMenuItem(
              value: _harfiNotaCevir(okunanDeger),
              child: Text(okunanDeger),
            ))
        .toList();
  }


  //krediler icin dropdown
  static List<int> krediler() {
    return List.generate(10, (index) => index + 1);
  }

  static List<DropdownMenuItem<double>> tumKrediler() {
    return krediler()
        .map((okunanDeger) => DropdownMenuItem(
              value: okunanDeger.toDouble(),
              child: Text(okunanDeger.toString()),
            ))
        .toList();
  }


  //ders listesini tutma
  static List<Ders> tumEklenenDersler = [];

  static dersEkle(Ders ders) {
    tumEklenenDersler.add(ders);
  }


  //ortalama  hesaplama
  static double ortalamaHesapla() {
    double toplamNot = 0;
    double toplamKredi = 0;

    tumEklenenDersler.forEach((anlikEleman) {
      toplamNot += anlikEleman.harfDegeri * anlikEleman.krediDegeri;
      toplamKredi += anlikEleman.krediDegeri;
    });

    return toplamNot / toplamKredi;
  }
}
