import 'package:dinamik_ortalama_hesapla/constants/app_constants.dart';
import 'package:flutter/material.dart';

class OrtalamaGoster extends StatelessWidget {
  final int dersSayisi;
  final double ortalama;

  const OrtalamaGoster({required this.dersSayisi, required this.ortalama,super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          dersSayisi > 0 ? "$dersSayisi Ders Girildi" : "Ders Seciniz",
          style: Sabitler.ortalamaGosterBodyStyle,
        ),
        Text(
          ortalama >= 0 ? ortalama.toStringAsFixed(2) : "0.0",   // virgulden sonra 2 basamak aldım.
          style: Sabitler.ortalamaStyle,
        ),
        Text(
          "Ortalama",
          style: Sabitler.ortalamaGosterBodyStyle,
        ),
      ],
    );
  }
}