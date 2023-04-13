
import 'package:flutter/material.dart';
import 'package:sporting/view/get_next_page.dart';
import 'package:sporting/view/get_start_page.dart';
import 'package:sporting/view/home_page.dart';
import 'package:sporting/view/register/login_page.dart';
import 'package:sporting/view/register/sign_up.dart';
import 'package:sporting/view/register/splash_screan_page.dart';

class RouteGenerator {
  static final RouteGenerator _generator = RouteGenerator._init();
  static RouteGenerator get router => _generator;

  RouteGenerator._init();
  Route? onGenerate(RouteSettings settings) {
    switch (settings.name) {
      case "/":
        return _navigator(const HomePage());
      case "getStart":
        return _navigator(const GetStartPage());
      case "getNext":
        return _navigator(const GetNextPage());
        case "login":
        return _navigator(const LoginPage());
         case "signUp":
        return _navigator(const SignUpPage());
        case "splash":
        return _navigator(const SplashScrenn());
        
    }
    return null;
  }

  MaterialPageRoute _navigator(Widget widget) {
    return MaterialPageRoute(
      builder: (context) => widget,
    );
  }
}
