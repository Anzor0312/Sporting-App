import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

import '../../helpers/show_message_widget.dart';

class SignUpProvider extends ChangeNotifier {
  //Logic..
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool isLoading = false;

  Future<dynamic> singUp() async {
    try {
      isLoading = true;
      notifyListeners();
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);
      isLoading = false;
      notifyListeners();
      return true;
    } on FirebaseException catch (e) {
      if (e.code == "weak-password") {
        showErrorMessage("Parol kuchsiz");
        isLoading = false;
        notifyListeners();
      } else if (e.code == "email-al-ready-in-use") {
        showErrorMessage("Email oldin ro'yhatdan o'tgan");
        isLoading = false;
        notifyListeners();
      } else {
        showErrorMessage("Noma'lum xato");
        isLoading = false;
        notifyListeners();
      }
    }
  }
}
