import 'package:flutter/material.dart';
import 'package:flutter_verification_code/flutter_verification_code.dart';
import 'package:provider/provider.dart';
import 'package:task_company/Providers/ProviderChangeStates.dart';
import 'package:task_company/SignIn_SignUp_Screens/SignIn_Screen.dart';
import 'package:task_company/SignIn_SignUp_Screens/SignUp_Screen.dart';

import '../Components/Components.dart';

class VerificationCodeScreen extends StatelessWidget {
  const VerificationCodeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var providerController = Provider.of<ProviderChangeStates>(context);

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            customAppBar(
                context: context,
                titleAppBar: "Enter 6-digit Verification Code",
                titleAppBarSize: 34,
                function: () {
                  Navigator.pop(context);

                }),
            Container(
              margin: const EdgeInsets.only(top: 70, bottom: 30),
              width: 350,
              child: const Text(
                "The verification code was sent to the phone number +972502369923. Please enter the code:",
                style: TextStyle(fontSize: 16, color: Color(0xFF6D6D6D)),
              ),
            ),
            VerificationCode(
              keyboardType: TextInputType.number,
              underlineColor: const Color(
                  0xFF53588A), // If this is null it will use primaryColor: Colors.red from Theme
              underlineUnfocusedColor: const Color(0xFF9BA5FF),
              textStyle:
                  const TextStyle(color: Color(0xFF2C3051), fontSize: 40),
              length: 6,
              cursorColor:
                  Colors.blue, // If this is null it will default to the ambient
              onCompleted: (String inputUser) {
                providerController.changeTextFieldVerificationValue(
                    newTextFieldVerificationValue: inputUser);
                showDialog(
                    context: context,
                    builder: (ctx) {
                      return customDialog(
                          title:  "Your account created successfully!",
                          widget:  Image.asset(
                                  "assets/images/successfully_Image.png"),
                          therIsButton: true,
                          titleButton: "Sign in",
                          function: (){
                            Navigator.pop(context);
                            Navigator.pop(context);

                          });
                    });
              },
              onEditing: (bool onEditing) {
                providerController.changeOnEditingTextFieldVerification(
                    newOnEditingTextFieldVerification: onEditing);
                if (providerController.onEditingTextFieldVerification) {
                  FocusScope.of(context).unfocus();
                }
              },
            ),
            const SizedBox(
              height: 30,
            ),
            TextButton(
                onPressed: () {
                  // print("code: ${providerController.code}");
                },
                child: const Text(
                  "Resend varification code",
                  style: TextStyle(color: Color(0xFF53588A), fontSize: 14),
                )),
          ],
        ),
      ),
    );
  }
}
