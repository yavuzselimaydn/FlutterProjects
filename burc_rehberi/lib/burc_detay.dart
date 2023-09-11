import 'package:burc_rehberi/model/burc.dart';
import 'package:flutter/material.dart';
import 'package:palette_generator/palette_generator.dart';

// widget kısmı 
class BurcDetay extends StatefulWidget {                    //uygulamaya renk verıp sonrada on degıstırmekde durum degısıklıgı odlugu ıcın stateful widgetea gectım.     
  final Burc secilenBurc;                                      // tıklanan burc bılgısını bu sayfaya constructor ıle gondercem
  const BurcDetay({required this.secilenBurc, super.key});     // yanı burc detay sınıfı çagrıldıgında parametre olarak zorunlu ıstedım.
  @override
  State<BurcDetay> createState() => _BurcDetayState();
}

//state kısmı
class _BurcDetayState extends State<BurcDetay> {               
  Color appBarRengi = Colors.pink;                           // state ıle degıecek oarametrelerı buıld dısında degıskene atarım.
  
  late PaletteGenerator _generator;                       
  @override                                                    
  void initState() {                                          // constructor gıbı bır kere calısır. Değişknelrı baslatırken kullnaıyorum.
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback( (_) => appBarRenginiBul()); 
    //yanı bu kod sayesınde buıld ı bırkere ekrana yazır dıyorum ve ondan sonra appbar rengını bul fonkunu calıstır ve ona gore uıld ı tekrardan calıstırç Bu sayede program ddaha buıldı tam calıstırmadann bırr daha calıstırırsda hatayı onler.
  } 

  @override                                                   
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(                                       // hareketli appbar
            expandedHeight: 250,                              // acılınca max yukseklık
            pinned: true,
            backgroundColor: appBarRengi,
            flexibleSpace: FlexibleSpaceBar(                  // resim koydum.
              background: Image.asset(
                "images/${widget.secilenBurc.burcBuyukResim}",
                fit: BoxFit.cover,
              ),
              title: Text("${widget.secilenBurc.burcAdi} Burcu ve Özellikleri"),            // sliver appbarıma baslık koydum.
              centerTitle: true,                                                            //baslıgı ortaladım
            ),
          ),

          SliverToBoxAdapter(                               //bu widget ile sliver listesinde istedıgım widgetı kullanabılıyrum.              
            child: SingleChildScrollView(
              child: Container(
                margin: const EdgeInsets.all(16),
                padding: const EdgeInsets.all(8),
                child: Text(
                  widget.secilenBurc.burcDetayi,
                  style: Theme.of(context).textTheme.subtitle1
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
   
  void appBarRenginiBul() async{                                      //palette genartor future nesnesı dındurdugu ıcn await  kullna
    _generator =  await PaletteGenerator.fromImageProvider( 
      AssetImage("images/${widget.secilenBurc.burcBuyukResim}"));     // state kısmından widget kısmına erısmek ıcın ==> .widget
    appBarRengi = _generator.dominantColor!.color;
    setState(() {});                                                  //  fluttera dedımkı degısklıkvar buıld meottfunu tekrardan caıstır.
  }
}