import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg_image/flutter_svg_image.dart';
import 'package:provider/provider.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:sporting/provider/home_provider.dart';
import 'package:sporting/view/history_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0xff28333F),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: size.height / 2,
            decoration: const BoxDecoration(
                color: Color(0xff7B61FF),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(25),
                    bottomRight: Radius.circular(25))),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 40, left: 18, right: 18),
                    child: StreamBuilder(
                        stream: context.read<HomeProvider>().profileStream,
                        builder: (context,
                            AsyncSnapshot<QuerySnapshot<Object?>> snapshot) {
                          if (snapshot.hasError) {
                            return const Center(
                              child: Text("SERVER ERROR"),
                            );
                          } else if (!snapshot.hasData) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          } else {
                            List<Map<String, dynamic>> data = [];
                            snapshot.data!.docs
                                .map((DocumentSnapshot document) {
                              data.add(document.data() as Map<String, dynamic>);
                            }).toList();

                            if (data.isEmpty) {
                              return const Center(
                                child: Text("HALI MAHSULOTLAR QO'SHILMAGAN"),
                              );
                            } else {
                              return Row(
                                children: [
                                  const Icon(
                                    Icons.menu,
                                    color: Colors.white,
                                    size: 24,
                                  ),
                                  const SizedBox(
                                    width: 12,
                                  ),
                                  CircleAvatar(
                                    backgroundImage:
                                        NetworkImage(data[0]["img"].toString()),
                                    radius: 24,
                                  ),
                                  SizedBox(
                                    width: size.width * 0.04,
                                  ),
                                  Column(
                                    children: [
                                      Text(
                                        data[0]["title"].toString(),
                                        style: const TextStyle(
                                            color: Colors.white),
                                      ),
                                      Text(
                                        data[0]["name"].toString(),
                                        style: const TextStyle(
                                            color: Colors.white),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    width: size.width * 0.3,
                                  ),
                                  const Image(
                                      image: AssetImage("assets/direct.png")),
                                  SizedBox(
                                    width: size.width * 0.02,
                                  ),
                                  const Image(
                                      image: AssetImage("assets/sms.png")),
                                ],
                              );
                            }
                          }
                        }),
                  ),
                  StreamBuilder(
                    stream: context.read<HomeProvider>().statusStream,
                    builder: (context,
                      AsyncSnapshot<QuerySnapshot<Object?>> snapshot) {
                    if (snapshot.hasError) {
                      return const Center(
                        child: Text("SERVER ERROR"),
                      );
                    } else if (!snapshot.hasData) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else {
                      List<Map<String, dynamic>> data = [];
                      snapshot.data!.docs.map((DocumentSnapshot document) {
                        data.add(document.data() as Map<String, dynamic>);
                      }).toList();

                      if (data.isEmpty) {
                        return const Center(
                          child: Text("HALI MAHSULOTLAR QO'SHILMAGAN"),
                        );
                      } else {
                        return Column(
                          children: [
                            Padding(
                    padding: const EdgeInsets.only(top: 21),
                    child: Row(
                      children: [
                         Text(data[0]["result"].toString(),
                            style:const TextStyle(
                                fontSize: 16, color: Color(0xffCDCDCD))),
                         Text(
                        data[0]["steps"].toString() ,
                          style: const TextStyle(fontSize: 25, color: Colors.white),
                        ),
                        const Text(
                          "steps",
                          style:
                              TextStyle(fontSize: 16, color: Color(0xffCDCDCD)),
                        ),
                        SizedBox(
                          width: size.width * 0.14,
                        ),
                        const Text("Level 5",
                            style: TextStyle(
                                fontSize: 20, color: Color(0xffFFC932))),
                        SizedBox(
                          width: size.width * 0.008,
                        ),
                        const Image(image: AssetImage("assets/badge.png")),
                      ],
                    ),
                  ),
                  LinearPercentIndicator(
                    width: 279.0,
                    lineHeight: 11.0,
                    percent: 0.7,
                    barRadius: const Radius.circular(7),
                    backgroundColor: Colors.white,
                    progressColor: Colors.green,
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  Container(
                    width: double.infinity,
                    height: size.height * 0.1,
                    decoration: BoxDecoration(
                        color: const Color(0xff8533FF),
                        borderRadius: BorderRadius.circular(15)),
                    child: Center(
                      child: Row
                      
                      (
                        children: [Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Image.asset("assets/237682.png"),
                        ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(data[0]["date"].toString(),style:const TextStyle(color: Colors.white),),
                        const  Text("Today",style: TextStyle(color: Colors.greenAccent),),
                          Text(data[0]["duration"].toString(),style:const TextStyle(color: Colors.white),),
                          
                        ],
                      ),SizedBox(width: size.width*0.38),
                   CircularPercentIndicator(
                    
                      animation: true,
                      radius: 35.0,
                      lineWidth: 6.0,
                      percent: 0.3,
                      center:  Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image(image: SvgImage.asset("assets/ic_steps.svg")),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(data[0]["done"],style: const TextStyle(color: Colors.white,fontSize: 12),),
                            const  Text("-----",style: TextStyle(color: Color(0xffAEA8B2),fontSize: 15),),
                              
                              Text(data[0]["todo"],style: const TextStyle(color: Color(0xff43C465),fontSize: 12))
                            ],
                          )
                        ],
                      ),
                      progressColor: const Color(0xffF14985),
                    )
                      ]),
                    ),
                  ), SizedBox(
                    height: size.height * 0.01,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: size.width * 0.4,
                        height: size.height * 0.15,
                        decoration: BoxDecoration(
                            color: const Color(0xff8533FF),
                            borderRadius: BorderRadius.circular(15)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                             Text(
                              data[0]["steeps"].toString(),
                              style:
                                  const TextStyle(color: Colors.white, fontSize: 35),
                            ),
                            Image.asset("assets/34604.png")
                          ],
                        ),
                      ),
                      Container(
                        width: size.width * 0.4,
                        height: size.height * 0.15,
                        decoration: BoxDecoration(
                            color: const Color(0xff8533FF),
                            borderRadius: BorderRadius.circular(15)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                             Text(
                              data[0]["coins"].toString(),
                              style:
                                  const TextStyle(color: Colors.white, fontSize: 35),
                            ),
                            Image(image: SvgImage.asset("assets/34603.svg"))
                          ],
                        ),
                      )
                    ],
                  )
                          ],
                        );
                      }
                    }
                  }),
                 
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 15),
            child: Container(
              width: double.infinity,
              height: size.height * 0.15,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                gradient: const LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [
                      Color(0xff82AFFF),
                      Color(0xffF14985),
                    ]),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Share & Get",
                        style: TextStyle(color: Colors.white),
                      ),
                      const Text(
                        "Get 2x point for every",
                        style: TextStyle(color: Colors.white),
                      ),
                      const Text(
                        " steps, only valid for today",
                        style: TextStyle(color: Colors.white),
                      ),
                      Image(image: SvgImage.asset("assets/share.svg"))
                    ],
                  ),
                  SizedBox(
                    width: 194,
                    height: 111,
                    child: Container(
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: SvgImage.asset("assets/237713.svg"),
                              fit: BoxFit.cover),
                          borderRadius: const BorderRadius.only(
                              bottomRight: Radius.circular(16))),
                    ),
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "History",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
                TextButton(
                  autofocus: false,
                    onPressed: () {
                      final Stream<QuerySnapshot> historyStream = FirebaseFirestore.instance
      .collection("history")
      .orderBy("created_at")
      .snapshots();
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HistoryPage(stream:historyStream ,),
                          ));
                    },
                    child: const Text("See All"))
              ],
            ),
          ),
          Expanded(flex: 2, child: HistoryWidget(size: size))
        ],
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 35),
        child: Container(
            width: double.infinity,
            height: 64.00,
            decoration: BoxDecoration(
              color: const Color(0xff2F3C50),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Image(image: SvgImage.asset("assets/home.svg")),
                Image(image: SvgImage.asset("assets/cup.svg")),
                Image(image: SvgImage.asset("assets/shop.svg")),
                Image(image: SvgImage.asset("assets/userprofile.svg")),
              ],
            )),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

class HistoryWidget extends StatelessWidget {
  const HistoryWidget({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: context.read<HomeProvider>().historyStream,
        builder: (context, AsyncSnapshot<QuerySnapshot<Object?>> snapshot) {
          if (snapshot.hasError) {
            return const Center(
              child: Text("SERVER ERROR"),
            );
          } else if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            List<Map<String, dynamic>> data = [];
            snapshot.data!.docs.map((DocumentSnapshot document) {
              data.add(document.data() as Map<String, dynamic>);
            }).toList();

            if (data.isEmpty) {
              return const Center(
                child: Text("HALI MAHSULOTLAR QO'SHILMAGAN"),
              );
            } else {
              return ListView.builder(
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 10),
                    child: Container(
                        width: double.infinity,
                        height: size.height * 0.15,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.red,
                          gradient: const LinearGradient(
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                              colors: [
                                Color(0xff2F3C50),
                                Color.fromARGB(255, 207, 128, 236),
                              ]),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  data[index]["date"].toString(),
                                  style: const TextStyle(
                                      color: Colors.white, fontSize: 20),
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "${data[index]["pt"].toString()} pt",
                                      style: const TextStyle(
                                          color: Color(0xffF14985),
                                          fontSize: 12),
                                    ),
                                    Text(
                                      " .  ${data[index]["km"].toString()} km",
                                      style: const TextStyle(
                                          color: Colors.white, fontSize: 12),
                                    ),
                                    Text(
                                      " .  ${data[index]["kcol"].toString()} kcol",
                                      style: const TextStyle(
                                          color: Colors.white, fontSize: 12),
                                    ),
                                  ],
                                )
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  "${data[index]["steps"].toString()} ",
                                  style: const TextStyle(
                                      color: Colors.white, fontSize: 30),
                                ),
                                const Text(
                                  "Steps",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 12),
                                ),
                              ],
                            ),
                          ],
                        )),
                  );
                },
                itemCount: data.length,
              );
            }
          }
        });
  }
}
