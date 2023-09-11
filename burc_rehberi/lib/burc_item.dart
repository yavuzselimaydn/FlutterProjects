import 'package:burc_rehberi/burc_detay.dart';
import 'package:burc_rehberi/model/burc.dart';
import 'package:flutter/material.dart';

class BurcItem extends StatelessWidget {                             //listemdeki her bir elemanı bu widget ile olusturcam
  final Burc oAnkiListelenecekBurc;                                  // ekrana yazılacak burcun bılgısı    
  const BurcItem({required this.oAnkiListelenecekBurc, super.key});  // burcıtem kullnaılacak ise parametre olarak oankıburc u vermelıyım.

  @override
  Widget build(BuildContext context) {
    var myTextStyle = Theme.of(context).textTheme;                   // mainde belirlediğim temayı kullanıyorum. Ve boylece her yere text style yazmama gerek kalmıyo
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Card(
        elevation: 4,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            onTap: () {                                             // burc detay sayfasını acma ıslemı
              Navigator.pushNamed(                                  //onGeneratod tetıklemek ıcın named kullandım.
                context, 
                "/burcDetay", 
                arguments: oAnkiListelenecekBurc                    // veriyi yolluyorum , routee generatorde karsılşa verıyı
              );
              //kolayNavigoter(context);
            },
            leading: Image.asset(                                         // baş kısmı
              "images/${oAnkiListelenecekBurc.burcKucukResim}",           // resımlerde genıslık  verme genelde fit  ikullan.
            ),  
            title: Text(
              oAnkiListelenecekBurc.burcAdi,
              style: myTextStyle.headline5,
              ),
            subtitle: Text(
              oAnkiListelenecekBurc.burcTarihi,
              style: myTextStyle.subtitle1,
              ),
            trailing:const Icon(                                          // son kısım
              Icons.arrow_forward_ios, 
              color: Colors.pink,
            ),
          ),
        ),
      ),
    );
  }

  void kolayNavigoter(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => BurcDetay(secilenBurc: oAnkiListelenecekBurc),  // detay ayfasında const ıle ıstedıgım parametreyı aldım
      )
    );
  }
}