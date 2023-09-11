import 'package:burc_rehberi/burc_item.dart';
import 'package:burc_rehberi/data/strings.dart';
import 'package:burc_rehberi/model/burc.dart';
import 'package:flutter/material.dart';

class BurcListesi extends StatelessWidget {  //late ıle lısteyi başlatmadan kullanmıyacağımı belırtıyorum dart'a.
  late final List<Burc> tumBurclar;                //listeyi build ın dısında olusturdum cunku sınıfın heryerınden ersımek ıstıyorum.              
  BurcListesi(){                             //constructor ile sınıf olusturudlugunda lısteyi başlatıyorum(initilaze).
    tumBurclar = veriKaynaginiHazirla();
    print(tumBurclar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:const Text("Burçlar Listesi")),
      body: Center(
        child: ListView.builder(
          itemBuilder: (context,index) {   // listedeki her bır elemanı ele alan ayrı bir widget yapmam perfornms sağlar. Yani farklı bir widgeta bolmem ıyı bır sey.
            return BurcItem(oAnkiListelenecekBurc: tumBurclar[index]);   
          },
          itemCount: tumBurclar.length,
        )
      ),
    );
  }
  
  List<Burc> veriKaynaginiHazirla() {
    List<Burc> gecici= [];

    for(int i = 0; i<12; i++) {
      var burcAdi = Strings.BURC_ADLARI[i];
      var burcTarihi = Strings.BURC_TARIHLERI[i];
      var burcDetay = Strings.BURC_GENEL_OZELLIKLERI[i];
      var burcKucukResim = "${Strings.BURC_ADLARI[i].toLowerCase()}${i + 1}.png";
      var burcBuyukResim = "${Strings.BURC_ADLARI[i].toLowerCase()}_buyuk${i + 1}.png";
      Burc eklenecekBurc = Burc(burcAdi, burcTarihi, burcDetay, burcKucukResim, burcBuyukResim);
      gecici.add(eklenecekBurc);
    }
  
    return gecici;
  }
}