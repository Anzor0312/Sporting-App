import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sporting/core/router/router.dart';
import 'package:sporting/provider/auth/sign_in_provider.dart';
import 'package:sporting/provider/auth/sign_up_provider.dart';
import 'package:sporting/provider/home_provider.dart';
import 'package:sporting/view/home_page.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => HomeProvider(),),
        ChangeNotifierProvider(
        create: (context) => SignInProvider(),),
        ChangeNotifierProvider(
        create: (context) => SignUpProvider(),),

    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
      onGenerateRoute: RouteGenerator.router.onGenerate,
      initialRoute: "splash",
    );
  }
}

