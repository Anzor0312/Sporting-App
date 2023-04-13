import 'package:flutter/material.dart';
import 'package:flutter_svg_image/flutter_svg_image.dart';

class GetNextPage extends StatelessWidget {
  const GetNextPage({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0xff28333F),
      appBar: AppBar(
        backgroundColor: const Color(0xff28333F),
        actions: [
          TextButton(
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(
                    context, "login", (route) => false);
              },
              child: const Text(
                "Skip",
                style: TextStyle(color: Colors.white),
              ))
        ],
        elevation: 0,
        leading: Center(
            child: InkWell(
                onTap: () {
                  Navigator.pushNamedAndRemoveUntil(
                      context, "getStart", (route) => false);
                },
                child: const Icon(Icons.arrow_back))),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 70, left: 30, right: 30),
            child: Container(
              width: 316,
              height: 242,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: SvgImage.asset("assets/237725.svg"))),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.1),
            child: Container(
              width: double.infinity,
              height: size.height * 0.35,
              decoration: BoxDecoration(
                  color: const Color(0xff2F3C50),
                  borderRadius: BorderRadius.circular(64)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    "Run",
                    style: TextStyle(color: Colors.white, fontSize: 21.00),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  const SizedBox(
                    width: 250,
                    height: 60.00,
                    child: Text(
                      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s",
                      style:
                          TextStyle(color: Color(0xffCDCDCD), fontSize: 12.00),
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.05,
                  ),
                  FloatingActionButton.extended(
                      onPressed: () {
                        Navigator.pushNamed(context, "login");
                      },
                      elevation: 0,
                      label: const Text(
                        "Next",
                        style: TextStyle(color: Colors.white, fontSize: 21.00),
                      ),
                      backgroundColor: const Color.fromRGBO(123, 97, 255, 1)),
                ],
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Already have an account?",
                style: TextStyle(color: Colors.white),
              ),
              TextButton(
                  onPressed: () {},
                  child: const Text("Sign In",
                      style: TextStyle(color: Color(0xff7B61FF)))),
            ],
          ),
        ],
      ),
    );
  }
}
