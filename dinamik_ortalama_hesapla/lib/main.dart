import 'package:dinamik_ortalama_hesapla/constants/app_constants.dart';
import 'package:dinamik_ortalama_hesapla/widgets/ortalama_hesapla_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp()); // mateapp

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Sabitler.anaRenk,                   //sabitleri ayrı yerde tutuyorum
        visualDensity: VisualDensity.adaptivePlatformDensity //farklı platformlarda tasarım bozulmasını onler.
      ),
      home: const OrtalamaHesaplaPage(),
    );
  }
}