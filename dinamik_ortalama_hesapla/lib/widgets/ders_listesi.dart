import 'package:dinamik_ortalama_hesapla/constants/app_constants.dart';
import 'package:dinamik_ortalama_hesapla/helper/data_helper.dart';
import 'package:flutter/material.dart';

class DersListesi extends StatelessWidget {
  final Function onElemanCikarildi; //Derslistesi widgeti cagrıldıgı yerde bu fonku tanımlamam lazım
  const DersListesi({required this.onElemanCikarildi,super.key});

  @override
  Widget build(BuildContext context) {
    var tumDersler = DataHelper.tumEklenenDersler;
    return tumDersler.isNotEmpty
        ? ListView.builder(
            itemCount: tumDersler.length,
            itemBuilder: (context, index) {
              return Dismissible(//yana kaydırıp yok etme 
                direction: DismissDirection.startToEnd, //kaydırma yonu
                key: UniqueKey(),
                onDismissed: (a) {
                  onElemanCikarildi(index); //fonksyonu kulanacagım yere bilgi yolluyom ve fonku tetikledim
                },
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Card(
                    child: ListTile(
                      title: Text(tumDersler[index].ad),
                      subtitle: Text(
                          "${tumDersler[index].krediDegeri.toInt()} Kredi, Not Değeri ${tumDersler[index].harfDegeri}"),
                      leading: CircleAvatar(
                        backgroundColor: Sabitler.anaRenk,
                        child: Text(DataHelper.notuHarfeCevir(tumDersler[index].harfDegeri)),
                      ),
                    ),
                  ),
                ),
              );
            })
        : Center(
            child: Text(
              "Lütfen Ders Ekleyin",
              style: Sabitler.baslikStyle,
            ),
          );
  }
}
