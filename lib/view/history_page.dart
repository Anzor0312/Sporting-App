import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sporting/provider/home_provider.dart';

class HistoryPage extends StatelessWidget {
  Stream<QuerySnapshot> stream;
   HistoryPage({
    super.key,required this.stream
  });

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0xff28333F),
      appBar: AppBar(
        title:const Text("All History"),
      backgroundColor: const Color(0xff28333F),
        elevation: 0,
      ),
      body: StreamBuilder(
          stream: stream,
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
          }),
    );
  }
}
