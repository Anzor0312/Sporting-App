import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sporting/view/home_page.dart';
import 'package:sporting/view/register/login_page.dart';

class SplashScrenn extends StatefulWidget {
  const SplashScrenn({super.key});

  @override
  State<SplashScrenn> createState() => _SplashScrennState();
}

class _SplashScrennState extends State<SplashScrenn> {
  void initState() {
    Future.delayed(const Duration(seconds: 3)).then((value) => {chekUser()});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const  Scaffold(body: Center(child:Image(image: AssetImage("assets/yugurish.png"))));
  }

  void chekUser() {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user != null) {
        Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
      } else {
        Navigator.pushNamedAndRemoveUntil(context, 'login', (route) => false);
      }
    });
  }
}
