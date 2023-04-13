import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sporting/view/register/login_page.dart';

import '../../provider/auth/sign_up_provider.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SignUpProvider(),
      builder: (context, child) {
        return _scaffold(context);
      },
    );
  }

  Scaffold _scaffold(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff28333F),
      appBar: AppBar(
        backgroundColor: const Color(0xff28333F),
        title: const Text("Sign Up"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                  hintText: "Ismingizni kiriting",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: TextField(
                controller: context.watch<SignUpProvider>().emailController,
                decoration: InputDecoration(
                    hintText: "Email kiriting",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
            ),
            TextField(
              controller: context.watch<SignUpProvider>().passwordController,
              decoration: InputDecoration(
                  hintText: "Parol kiriting",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
            )
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Row(children: [
        TextButton(
            onPressed: () {
              Navigator.pushNamedAndRemoveUntil(
                  context, 'login', (route) => false);
            },
            child: const Text(" Sing")),
        FloatingActionButton.extended(
            backgroundColor: const Color(0xff672480),
            onPressed: () async {
              await context.read<SignUpProvider>().singUp().then((value) {
                if (value == true) {
                  Navigator.pushNamedAndRemoveUntil(
                      context, '/', (route) => false);
                }
              });
            },
            label: !context.watch<SignUpProvider>().isLoading
                ? const Text("Ro'yhatdan o'tish")
                : const CircularProgressIndicator.adaptive()),
      ]),
    );
  }
}
