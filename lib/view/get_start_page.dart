import 'package:flutter/material.dart';
import 'package:flutter_svg_image/flutter_svg_image.dart';

class GetStartPage extends StatelessWidget {
  const GetStartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xff28333F),
        body: Padding(
          padding: EdgeInsets.only(
            top: MediaQuery.of(context).size.height * 0.17,
          ),
          child: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: SvgImage.asset("assets/frame.svg"),
                    fit: BoxFit.fill)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).size.height * 0.2,
                  ),
                  child: Positioned.fill(
                      child: Image(
                    image: SvgImage.asset("assets/text.svg"),
                  )),
                )
              ],
            ),
          ),
        ),
        floatingActionButton: InkWell(
          onTap: () {
            Navigator.pushNamedAndRemoveUntil(
                context, "getNext", (route) => false);
          },
          child: Image(
            image: SvgImage.asset("assets/Buttons.svg"),
          ),
        ));
  }
}
