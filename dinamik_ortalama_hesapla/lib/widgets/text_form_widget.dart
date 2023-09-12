import 'package:dinamik_ortalama_hesapla/constants/app_constants.dart';
import 'package:flutter/material.dart';

class TextFormWigdet extends StatefulWidget {
  final Function onDersIsmiGirildi;
  const TextFormWigdet({required this.onDersIsmiGirildi,super.key});

  @override
  State<TextFormWigdet> createState() => _TextFormWigdetState();
}

class _TextFormWigdetState extends State<TextFormWigdet> {
  String girilenDersAdi = "";
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onSaved: (newValue) {
        setState(() {
          girilenDersAdi = newValue!;
          widget.onDersIsmiGirildi(girilenDersAdi);
        });
      },
      validator: (value) {
        if (value!.isEmpty) {
          return "Ders adını giriniz.";
        } else {
          return null;
        }
      },
      decoration: InputDecoration(
          hintText: "Ders ismini giriniz",
          border: OutlineInputBorder(
              borderRadius: Sabitler.borderRadius, borderSide: BorderSide.none),
          filled: true,
          fillColor: Sabitler.anaRenk.shade100.withOpacity(0.3)),
    );
  }
}