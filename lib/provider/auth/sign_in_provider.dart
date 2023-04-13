import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

import '../../helpers/show_message_widget.dart';

class SignInProvider extends ChangeNotifier {
  //Logic..
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool isLoading = false;

  Future<dynamic> singIn() async {
    try {
      isLoading = false;
      notifyListeners();
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);
      isLoading = false;
      notifyListeners();
      return true;
    } on FirebaseException catch (e) {
      if (e.code == "user-not-found") {
        showErrorMessage("user topilmadi");
        isLoading = false;
        notifyListeners();
      } else if (e.code == "wrong-password") {
        showErrorMessage("parol xato");
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
