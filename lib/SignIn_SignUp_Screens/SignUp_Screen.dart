import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_company/Components/Components.dart';
import 'package:task_company/Providers/ProviderChangeStates.dart';
import 'package:task_company/Verification_Code_Screen/Verification_Code.dart';

import 'SignIn_Screen.dart';

class SignUp extends StatelessWidget {
  TextEditingController tecName = TextEditingController();
  TextEditingController tecPassword = TextEditingController();
  TextEditingController tecConfirmPassword = TextEditingController();
  TextEditingController tecEmail = TextEditingController();
  TextEditingController tecPhoneNumber = TextEditingController();

  var formKey = GlobalKey<FormState>();

  SignUp({Key? key}) : super(key: key);

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
                titleAppBar: "Sign up",
                function: () {
                  Navigator.pop(context);

                }),
            const SizedBox(
              height: 50,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    customTextFormField(
                        controller: tecName,
                        keyboardType: TextInputType.text,
                        hintText: "Username",
                        errorMassage: "username"),
                    const SizedBox(
                      height: 15,
                    ),
                    customTextFormField(
                        controller: tecEmail,
                        keyboardType: TextInputType.emailAddress,
                        hintText: "Email",
                        errorMassage: "email"),
                    const SizedBox(
                      height: 15,
                    ),
                    customTextFormField(
                        controller: tecPhoneNumber,
                        keyboardType: TextInputType.phone,
                        hintText: "Phone Number",
                        errorMassage: "phone number"),
                    const SizedBox(
                      height: 15,
                    ),
                    customTextFormField_Password(textEditingController: tecPassword, obscureText: providerController.obscureTextFieldPassword, providerController: providerController),
                    const SizedBox(
                      height: 15,
                    ),
                    customTextFormField_Password(textEditingController: tecConfirmPassword, obscureText: providerController.obscureTextFieldPassword, providerController: providerController),

                    const SizedBox(
                      height: 15,
                    ),
                  ],
                ),
              ),
            ),
            Row(
              children: [
                Checkbox(
                  side: const BorderSide(color: Color(0xFF9BA5FF)),
                  value: providerController.checkBoxValue,
                  onChanged: (valueUser) {
                    providerController.changeValueCheckBox(
                        newCheckBoxValue: valueUser!);
                  },
                ),
                const Text(
                  "I have read and agree to ",
                  style: TextStyle(fontSize: 14.0, color: Color(0xFF6D6D6D)),
                ),
                const Text(
                  "the Term and Conditions.",
                  style: TextStyle(fontSize: 14.0, color: Color(0xFFFFC226)),
                ), //Text
              ],
            ),
            customButton(
                height: 50,
                title: "Sgin up",
                titleSize: 18,
                titleColor: const Color(0xFF2C3051),
                backgroundColor: Color(0xFFEDB423),
                width: 350,
                function: () {
                  if (formKey.currentState!.validate()) {
                    customNavigation(context: context, screen: VerificationCodeScreen(), type: "replacement");

                  }
                }),
          ],
        ),
      ),
    );
  }
}
