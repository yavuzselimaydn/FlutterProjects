import 'package:burc_rehberi/burc_detay.dart';
import 'package:burc_rehberi/burc_listesi.dart';
import 'package:burc_rehberi/model/burc.dart';
import 'package:flutter/material.dart';

class RouteGenerator{
  static Route<dynamic>? routeGenerator(RouteSettings settings) {
    
    switch(settings.name) {
      case "/":
        return MaterialPageRoute(
          builder: (context) => BurcListesi()
        );

      case "/burcDetay":
        final gelenBurc = settings.arguments as Burc;          // gelen obje turundeki veriyi burc a donusturdum .
        return MaterialPageRoute(
          builder: (context) => BurcDetay(secilenBurc: gelenBurc)
        );
    }

    return null;
  }
}