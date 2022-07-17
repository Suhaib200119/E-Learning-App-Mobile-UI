import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_company/Components/Components.dart';
import 'package:task_company/LocalizationApp/AppLocale.dart';
import 'package:task_company/Providers/ProviderChangeStates.dart';
import 'package:task_company/Verification_Code_Screen/Verification_Code.dart';

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
                titleAppBar: "${getLang(context, "Sign up")}",
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
                        hintText: "${getLang(context, "Username_2")}",
                        errorMassage: "${getLang(context, "username")}", context: context),
                    const SizedBox(
                      height: 15,
                    ),
                    customTextFormField(
                        controller: tecEmail,
                        keyboardType: TextInputType.emailAddress,
                        hintText: "${getLang(context, "Email_2")}",
                        errorMassage: "${getLang(context, "email")}", context: context),
                    const SizedBox(
                      height: 15,
                    ),
                    customTextFormField(
                        controller: tecPhoneNumber,
                        keyboardType: TextInputType.phone,
                        hintText: "${getLang(context, "Phone Number")}",
                        errorMassage: "${getLang(context, "phone number")}", context: context),
                    const SizedBox(
                      height: 15,
                    ),
                    customTextFormField_Password(textEditingController: tecPassword, obscureText: providerController.obscureTextFieldPassword, providerController: providerController, context: context),
                    const SizedBox(
                      height: 15,
                    ),
                    customTextFormField_Password(textEditingController: tecConfirmPassword, obscureText: providerController.obscureTextFieldPassword, providerController: providerController, context: context),
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
                 Text(
                  "${getLang(context, "I have read and agree to ")}",
                  style: TextStyle(fontSize: 14.0, color: Color(0xFF6D6D6D)),
                ),
                 Text(
                  "${getLang(context, "the Term and Conditions.")}",
                  style: TextStyle(fontSize: 14.0, color: Color(0xFFFFC226)),
                ), //Text
              ],
            ),
            customButton(
                height: 50,
                title: "${getLang(context,"Sign up")}",
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
