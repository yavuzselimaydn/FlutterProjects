import 'package:flutter/material.dart';
import 'package:moda_uygulamasi/constants/app_constants.dart';
import 'package:moda_uygulamasi/screens/detay.dart';
import 'package:moda_uygulamasi/widgets/bottom_nav_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  Color kalpRenk = Colors.brown.withOpacity(0.4);
  IconData kalpIcon = Icons.favorite_border_outlined;
  int sayac = 0;

  late TabController? tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    tabController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          Sabitler.baslikText,
          style: Sabitler.baslikStyle,
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.camera_alt_rounded),
            color: Colors.grey,
          )
        ],
      ),
      bottomNavigationBar: BottomNavBar(tabController: tabController),
      body: ListView(
        padding: const EdgeInsets.only(top: 10),
        children: [kucukProfiller(), profil(context)],
      ),
    );
  }


  Padding profil(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Material(
        //color: Colors.blue.shade300,
        elevation: 4,
        borderRadius: BorderRadius.circular(16),
        child: Container(
          height: 500,
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(45),
                      image: const DecorationImage(
                          image: AssetImage("assets/images/model1.jpeg"),
                          fit: BoxFit.cover),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width - 160,
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Daisy",
                          style: TextStyle(
                            fontFamily: "Montserrat",
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          "34 mins ago",
                          style: TextStyle(
                            fontFamily: "Montserrat",
                            fontSize: 12,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  const Icon(
                    Icons.more_vert,
                    color: Colors.grey,
                    size: 22,
                  )
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              const Text(
                'This official website features a ribbed knit zipper jacket that is'
                'modern and stylish. It looks very temparament and is recommend to friends',
                style: TextStyle(
                    fontSize: 13, fontFamily: 'Montserrat', color: Colors.grey),
              ),
              const SizedBox(
                height: 15,
              ),

              //resimler
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const Detay(
                                imagePath: "assets/images/modelgrid1.jpeg",
                              )));
                    },
                    child: Hero(
                      //animaston
                      tag: "assets/images/modelgrid1.jpeg",
                      child: Container(
                        height: 200,
                        width: (MediaQuery.of(context).size.width - 50) / 2,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          image: const DecorationImage(
                              image:
                                  AssetImage("assets/images/modelgrid1.jpeg"),
                              fit: BoxFit.cover),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const Detay(
                                    imagePath: "assets/images/modelgrid2.jpeg",
                                  )));
                        },
                        child: Hero(
                          tag: "assets/images/modelgrid2.jpeg",
                          child: Container(
                            height: 95,
                            width:
                                (MediaQuery.of(context).size.width - 100) / 2,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                              image: const DecorationImage(
                                  image: AssetImage(
                                      "assets/images/modelgrid2.jpeg"),
                                  fit: BoxFit.cover),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const Detay(
                                    imagePath: "assets/images/modelgrid3.jpeg",
                                  )));
                        },
                        child: Hero(
                          tag: "assets/images/modelgrid3.jpeg",
                          child: Container(
                            height: 95,
                            width:
                                (MediaQuery.of(context).size.width - 100) / 2,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                              image: const DecorationImage(
                                  image: AssetImage(
                                      "assets/images/modelgrid3.jpeg"),
                                  fit: BoxFit.cover),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Container(
                    height: 25,
                    width: 100,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.brown.withOpacity(0.2)),
                    child: const Center(
                      child: Text(
                        "# Louis vuitton",
                        style: TextStyle(
                          fontFamily: "Montserrat",
                          fontSize: 10,
                          color: Colors.brown,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Container(
                    height: 25,
                    width: 75,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.brown.withOpacity(0.2)),
                    child: const Center(
                      child: Text(
                        "# Chloe",
                        style: TextStyle(
                          fontFamily: "Montserrat",
                          fontSize: 10,
                          color: Colors.brown,
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(
                height: 20,
              ),
              const Divider(),
              const SizedBox(
                height: 20,
              ),

              Row(
                children: [
                  Icon(
                    Icons.reply,
                    color: Colors.brown.withOpacity(0.2),
                    size: 30,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const Text(
                    "1.7k",
                    style: TextStyle(fontFamily: "Montserrat", fontSize: 14),
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  Icon(
                    Icons.comment,
                    color: Colors.brown.withOpacity(0.2),
                    size: 30,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const Text(
                    "325",
                    style: TextStyle(fontFamily: "Montserrat", fontSize: 14),
                  ),
                  const SizedBox(
                    width: 80,
                  ),
                  IconButton(
                    icon: Icon(
                      kalpIcon,
                      size: 30,
                    ),
                    color: kalpRenk,
                    onPressed: () {
                      setState(() {
                        if (sayac == 0) {
                          kalpIcon = Icons.favorite;
                          kalpRenk = Colors.red;
                          sayac = 1;
                        } else if (sayac == 1) {
                          kalpIcon = Icons.favorite_border_outlined;
                          kalpRenk = Colors.brown.withOpacity(0.4);
                          sayac = 0;
                        }
                      });
                    },
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  const Text(
                    "2.3k",
                    style: TextStyle(fontFamily: "Montserrat", fontSize: 14),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  SizedBox kucukProfiller() {
    return SizedBox(
      width: double.infinity,
      height: 140,
      child: ListView(
        padding: const EdgeInsets.all(10),
        scrollDirection: Axis.horizontal,
        children: [
          listeElemani(
              "assets/images/model1.jpeg", "assets/images/chanellogo.jpg"),
          const SizedBox(
            width: 30,
          ),
          listeElemani(
              "assets/images/model2.jpeg", "assets/images/louisvuitton.jpg"),
          const SizedBox(
            width: 30,
          ),
          listeElemani(
              "assets/images/model3.jpeg", "assets/images/chloelogo.png"),
          const SizedBox(
            width: 30,
          ),
          listeElemani(
              "assets/images/model1.jpeg", "assets/images/chanellogo.jpg"),
          const SizedBox(
            width: 30,
          ),
          listeElemani(
              "assets/images/model2.jpeg", "assets/images/louisvuitton.jpg"),
          const SizedBox(
            width: 30,
          ),
          listeElemani(
              "assets/images/model3.jpeg", "assets/images/chloelogo.png"),
        ],
      ),
    );
  }

  Widget listeElemani(String imagePath, String logoPath) {
    return Column(
      children: [
        Stack(
          //ilk giren eleman en alta olur ve ustune eleman eklememeı sagler
          children: [
            Container(
              height: 75,
              width: 75,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(45),
                image: DecorationImage(
                    image: AssetImage(imagePath), fit: BoxFit.cover),
              ),
            ),
            Positioned(
              // stackde pozisyonlama icin kullanılır
              top: 50,
              left: 50,
              child: Container(
                width: 25,
                height: 25,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    image: DecorationImage(
                        image: AssetImage(logoPath), fit: BoxFit.contain)),
              ),
            )
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          alignment: Alignment.center,
          height: 30,
          width: 75,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Colors.brown,
          ),
          child: const Text(
            "Follow",
            style: TextStyle(
              fontFamily: "Montserrat",
              fontSize: 14,
              color: Colors.white,
            ),
          ),
        )
      ],
    );
  }
}
