import 'package:flutter/material.dart';
import 'package:flutter_svg_image/flutter_svg_image.dart';
import 'package:provider/provider.dart';
import 'package:sporting/provider/auth/sign_in_provider.dart';
import 'package:sporting/provider/auth/sign_up_provider.dart';
import 'package:sporting/view/register/sign_up.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return ChangeNotifierProvider(
      create: (context) => SignInProvider(),
      builder: (context, child) {
        return Scaffold(
          backgroundColor: const Color(0xff28333F),
          appBar: AppBar(
            backgroundColor: const Color(0xff28333F),
            elevation: 0,
            leading: Center(
              child: InkWell(
                onTap: () {
                  Navigator.pushNamedAndRemoveUntil(
                      context, "getNext", (route) => false);
                },
                child: const Icon(Icons.arrow_back_sharp),
              ),
            ),
          ),
          body: ListView.builder(
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    Center(
                        child:
                            Image(image: SvgImage.asset("assets/Group.svg"))),
                    SizedBox(
                      height: size.height * 0.1,
                    ),
                    const Text(
                      "Log In",
                      style: TextStyle(color: Colors.white, fontSize: 21.00),
                    ),
                    TextFormField(
                      controller:
                          context.watch<SignInProvider>().emailController,
                      decoration: InputDecoration(
                          label: const Text("Email"),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12))),
                    ),
                    const SizedBox(
                      height: 15.00,
                    ),
                    TextFormField(
                      controller:
                          context.watch<SignInProvider>().passwordController,
                      decoration: InputDecoration(
                          suffix:
                              Image(image: SvgImage.asset("assets/qosh.svg")),
                          label: const Text("Password"),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12))),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image(image: SvgImage.asset("assets/checkbox.svg")),
                            const Text(
                              "Remember Me ",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 14),
                            )
                          ],
                        ),
                        TextButton(
                            onPressed: () {},
                            child: const Text(
                              "Forgot Password ?",
                              style: TextStyle(
                                  color: Color(0xff7B61FF), fontSize: 14),
                            ))
                      ],
                    ),
                    InkWell(
                      onTap: () async {
                        await context
                            .read<SignInProvider>()
                            .singIn()
                            .then((value) {
                          if (value == true) {
                            Navigator.pushNamedAndRemoveUntil(
                                context, "/", (route) => false);
                          }
                        });
                      },
                      child: Container(
                        width: double.infinity,
                        height: 60,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: const Color(0xff7B61FF)),
                        child: Center(
                            child: !context.watch<SignUpProvider>().isLoading
                                ? const Text(
                                    "Log In",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 24),
                                  )
                                : const CircularProgressIndicator.adaptive()),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image(image: SvgImage.asset("assets/rectangle.svg")),
                        const Text(
                          "Or continue with",
                          style:
                              TextStyle(color: Color(0xff4B576B), fontSize: 14),
                        ),
                        Image(image: SvgImage.asset("assets/rectangle.svg")),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 13),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 98.33,
                            height: 72,
                            decoration: BoxDecoration(
                                color: const Color(0xff2B3744),
                                borderRadius: BorderRadius.circular(12)),
                            child: Center(
                              child: Image(
                                  image: SvgImage.asset("assets/google.svg")),
                            ),
                          ),
                          Container(
                            width: 98.33,
                            height: 72,
                            decoration: BoxDecoration(
                                color: const Color(0xff2B3744),
                                borderRadius: BorderRadius.circular(12)),
                            child: Center(
                              child: Image(
                                  image: SvgImage.asset("assets/facebook.svg")),
                            ),
                          ),
                          Container(
                            width: 98.33,
                            height: 72,
                            decoration: BoxDecoration(
                                color: const Color(0xff2B3744),
                                borderRadius: BorderRadius.circular(12)),
                            child: Center(
                              child: Image(
                                  image: SvgImage.asset("assets/twitter.svg")),
                            ),
                          )
                        ],
                      ),
                    ),
                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "New User?  ",
                            style: TextStyle(color: Colors.white),
                          ),
                          TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const SignUpPage(),
                                    ));
                              },
                              child: const Text("Sign Up"))
                        ],
                      ),
                    )
                  ],
                ),
              );
            },
            itemCount: 1,
          ),
        );
      },
    );
  }
}
