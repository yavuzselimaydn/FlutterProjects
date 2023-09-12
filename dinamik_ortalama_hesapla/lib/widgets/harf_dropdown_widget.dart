import 'package:dinamik_ortalama_hesapla/constants/app_constants.dart';
import 'package:dinamik_ortalama_hesapla/helper/data_helper.dart';
import 'package:flutter/material.dart';

class HarfDropDownWidget extends StatefulWidget {
  final Function onHarfSecildi; //callback fonku tanımlafdım.
  const HarfDropDownWidget({required this.onHarfSecildi,super.key});

  @override
  State<HarfDropDownWidget> createState() => _HarfDropDownWidgetState();
}

class _HarfDropDownWidgetState extends State<HarfDropDownWidget> {
  double secilenHarfDegeri = 4; // buildın dısına tasımam lazım
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: Sabitler.dropDownPadding,
      decoration: BoxDecoration(
          color: Sabitler.anaRenk.shade100.withOpacity(0.3),
          borderRadius: Sabitler.borderRadius),
      child: DropdownButton<double>(
        value: secilenHarfDegeri,
        onChanged: (deger) {
          setState(() {
            secilenHarfDegeri = deger!; 
            widget.onHarfSecildi(secilenHarfDegeri);//secilen bu harfi ust katmana callback fonksu ile yollmamam lazım
          });
        },
        items: DataHelper.tumDersler(),
        underline: Container(),
        iconEnabledColor: Sabitler.anaRenk.shade200, //tusun rengini degistim
        elevation: 16,
      ),
    );
  }
}