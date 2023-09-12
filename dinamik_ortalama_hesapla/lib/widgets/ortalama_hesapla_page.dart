import 'package:dinamik_ortalama_hesapla/constants/app_constants.dart';
import 'package:dinamik_ortalama_hesapla/helper/data_helper.dart';
import 'package:dinamik_ortalama_hesapla/model/dersler.dart';
import 'package:dinamik_ortalama_hesapla/widgets/ders_listesi.dart';
import 'package:dinamik_ortalama_hesapla/widgets/harf_dropdown_widget.dart';
import 'package:dinamik_ortalama_hesapla/widgets/kredi_dropdown_widget.dart';
import 'package:dinamik_ortalama_hesapla/widgets/ortalama_goster.dart';
import 'package:dinamik_ortalama_hesapla/widgets/text_form_widget.dart';
import 'package:flutter/material.dart';

class OrtalamaHesaplaPage extends StatefulWidget {
  const OrtalamaHesaplaPage({super.key});

  @override
  State<OrtalamaHesaplaPage> createState() => _OrtalamaHesaplaPageState();
}

class _OrtalamaHesaplaPageState extends State<OrtalamaHesaplaPage> {
  var formKey = GlobalKey<FormState>();
  
  double secilenHarfDegeri = 4;
  double secilenKrediDegeri = 1;
  String girilenDersAdi = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false, // klavye kullanırken olusan pıxel sorunu cozer
      appBar: AppBar(
        backgroundColor: Colors.transparent, //renksiz appbar
        elevation: 0,
        title: Center(
          child: Text(
            Sabitler.baslikText, // textin icini sabitlerde olusturdum
            style: Sabitler.baslikStyle, // textstyle sabitlerde olusturdum.
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Expanded(
                flex: 2,
                child: _buildForm(), // form kısmını ayrı bir fonk olarak yazdim
              ),
              Expanded(
                flex: 1,
                child: OrtalamaGoster(// ayrı bir widget olarak olusturdum
                    dersSayisi: DataHelper.tumEklenenDersler.length,
                    ortalama: DataHelper.ortalamaHesapla()), //ortalamayı hesaplıyo bu adımda
              ),
            ],
          ),
          Expanded(
            child: DersListesi(
              onElemanCikarildi: (index) { //yolladıgım ındex fonku tetıkledı
                DataHelper.tumEklenenDersler.removeAt(index);//listeden elemanı cıkarıdm
                setState(() {}); //bu sayfayı yeniledi ve ortalama goster widgetida bir daha calistu ve degisilşeri algıladı
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildForm() {
    return Form(
      key: formKey,
      child: Column(children: [
        Padding(
          padding: Sabitler.yatayPadding8,
          child: TextFormWigdet(
            onDersIsmiGirildi: (gelenIsim) {
              girilenDersAdi = gelenIsim;
            }
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Padding(
                padding: Sabitler.yatayPadding8,
                child: HarfDropDownWidget(
                  onHarfSecildi: (gelenHarf) {
                    secilenHarfDegeri = gelenHarf;
                  },
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: Sabitler.yatayPadding8,
                child: KrediDropDownWidget(
                  onKrediSecildi: (gelenKredi){
                    secilenKrediDegeri=gelenKredi; //callback ile yolladıhum degeri karsıladşım.m
                  },
                ),
              ),
            ),
            IconButton(
              onPressed: _dersEkleveOrtalamaAl,
              icon: const Icon(Icons.arrow_forward_ios_sharp),
              color: Sabitler.anaRenk,
              iconSize: 30,
            ),
          ],
        ),
        const SizedBox(
          height: 5,
        )
      ]),
    );
  }

  void _dersEkleveOrtalamaAl() {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      var eklenecekDers = Ders(
          ad: girilenDersAdi,
          harfDegeri: secilenHarfDegeri,
          krediDegeri: secilenKrediDegeri);
      DataHelper.dersEkle(eklenecekDers);
      formKey.currentState!.reset();
      setState(() {});  //liste guncellensin diye
    }
  }
}
