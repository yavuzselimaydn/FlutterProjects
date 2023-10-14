import 'package:flutter/material.dart';

class Detay extends StatefulWidget {
  final String imagePath;
  const Detay({required this.imagePath, super.key});

  @override
  State<Detay> createState() => _DetayState();
}

class _DetayState extends State<Detay> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        //animasyon
        Hero(
          tag: widget.imagePath,
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(widget.imagePath),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Positioned(
            left: 15,
            right: 15,
            bottom: 25,
            child: Material(
              borderRadius: BorderRadius.circular(10),
              elevation: 4,
              child: Container(
                height: 250,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Container(
                              width: 100,
                              height: 120,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(color: Colors.grey),
                                  image: const DecorationImage(
                                      image:
                                          AssetImage("assets/images/dress.jpg"),
                                      fit: BoxFit.contain)),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 5, top: 26),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "LAMINATED",
                                  style: TextStyle(
                                      fontFamily: "Montserrat",
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                const Text(
                                  "Louis vuitton",
                                  style: TextStyle(
                                      fontFamily: "Montserrat",
                                      fontSize: 16,
                                      color: Colors.grey),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                SizedBox(
                                  height: 30,
                                  width:
                                      MediaQuery.of(context).size.width - 170,
                                  child: const Text(
                                    'One button V-neck sling long-sleeved waist female stitching dress',
                                    style: TextStyle(
                                        fontFamily: "Montserrat",
                                        fontSize: 13,
                                        color: Colors.grey),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      const Divider(),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 15.0, top: 10, bottom: 2),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text("\$6500",
                                style: TextStyle(
                                  fontFamily: "Montserrat",
                                  fontSize: 22,
                                )),
                            Container(
                              margin: const EdgeInsets.only(right: 30),
                              child: FloatingActionButton(
                                onPressed: () {},
                                backgroundColor: Colors.brown,
                                child: const Icon(
                                  Icons.arrow_forward_ios,
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ]),
              ),
            )),
        Positioned(
            top: MediaQuery.of(context).size.height / 3,
            left: 50,
            child: Container(
              height: 40,
              width: 130,
              decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.4),
                  borderRadius: BorderRadius.circular(8)),
              child:const  Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                 Center(
                    child:  Text(
                      "LAMINATED",
                      style: TextStyle(
                          fontFamily: "Montserrat",
                          fontWeight: FontWeight.bold,
                          color: Colors.white
                          ),
                    ),
                  ),
                  Icon(Icons.arrow_forward_ios,color: Colors.white,size: 18,)
                ],
              ),
            ))
      ]),
    );
  }
}
