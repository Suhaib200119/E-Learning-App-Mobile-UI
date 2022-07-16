import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:task_company/Components/Components.dart';
import 'package:task_company/Forget_Password_Screen/Forget_Password.dart';
import 'package:task_company/Providers/ProviderChangeStates.dart';
import 'package:task_company/layoutApp/LayoutApp.dart';

import 'SignUp_Screen.dart';

class SignIn extends StatelessWidget {
  TextEditingController tecName = TextEditingController();
  TextEditingController tecPassword = TextEditingController();
  var form_key = GlobalKey<FormState>();

  SignIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var providerController = Provider.of<ProviderChangeStates>(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              alignment: Alignment.bottomLeft,
              height: 200,
              width: MediaQuery.of(context).size.width,
              color: const Color(0xFFEDB423),
              child: const Padding(
                padding: EdgeInsets.all(30),
                child: Text(
                  "Sign in",
                  style: TextStyle(fontSize: 32, color: Colors.white),
                ),
              ),
            ),
            const SizedBox(
              height: 100,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: Form(
                key: form_key,
                child: Column(
                  children: [
                    customTextFormField(
                      controller: tecName,
                      keyboardType: TextInputType.text,
                      hintText: "Username",
                      errorMassage: "username",
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    customTextFormField_Password(
                      textEditingController: tecPassword,
                      obscureText: providerController.obscureTextFieldPassword,
                      providerController: providerController,
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    customButton(
                        height: 50,
                        width: double.infinity,
                        title: "Sgin in",
                        titleSize: 18,
                        titleColor: const Color(0xFF2C3051),
                        backgroundColor: Color(0xFFEDB423),
                        function: () {
                          if (form_key.currentState!.validate()) {
                            String username = tecName.text.trim();
                            String password = tecPassword.text.trim();
                            if (kDebugMode) {
                              print(
                                  "username: $username >> password: $password");
                            }
                            showDialog(
                                context: context,
                                builder: (ctx) {
                                  return customDialog(
                                    title: "Wait a few seconds...",
                                    widget: const SpinKitCircle(
                                      color: Color(0xFFFFC226),
                                      size: 100.0,
                                    ),
                                  );
                                });

                            Timer(const Duration(seconds: 2), () {
                              Navigator.pop(context);
                              customNavigation(
                                  context: context,
                                  screen: LayoutApp(),
                                  type: "replacement");
                            });
                          }
                        }),
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        customGestureDetector(
                            text: "Sign up",
                            function: () {
                              customNavigation(
                                  context: context,
                                  screen: SignUp(),
                                  type: "noreplacement");
                            }),
                        customGestureDetector(
                            text: "Forgot your password?",
                            function: () {
                              customNavigation(
                                  context: context,
                                  screen: ForgetPassword(),
                                  type: "noreplacement");
                            }),
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    customButton(
                      height: 45,
                      width: double.infinity,
                      title: "Log in with Facebook",
                      titleSize: 24,
                      titleColor: Colors.white,
                      backgroundColor: Color(0xFF4460A0),
                      function: () {},
                      thereIsImage: true,
                      pathImage: "assets/images/facebook.png",
                      widthImage: 30,
                      heightImage: 30,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    customButton(
                      height: 45,
                      width: double.infinity,
                      title: "Log in with Google",
                      titleSize: 24,
                      titleColor: Colors.grey,
                      backgroundColor: Color(0xFFFFFFFF),
                      function: () {},
                      thereIsImage: true,
                      pathImage: "assets/images/google.png",
                      widthImage: 30,
                      heightImage: 30,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
