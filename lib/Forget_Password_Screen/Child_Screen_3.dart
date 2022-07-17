import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_company/LocalizationApp/AppLocale.dart';
import '../Components/Components.dart';
import '../Providers/ProviderChangeStates.dart';
import '../SignIn_SignUp_Screens/SignIn_Screen.dart';

class FormScreenEditPassword extends StatelessWidget {


  late var formKey_restart;
  late TextEditingController tecPassword;
  late TextEditingController tecConfirmPassword;

  BuildContext contextScreen;


  FormScreenEditPassword(
      this.formKey_restart, this.tecPassword, this.tecConfirmPassword,this.contextScreen, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var providerController = Provider.of<ProviderChangeStates>(context);

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Form(
        key: formKey_restart,
        child: Column(
          children: [
            customTextFormField_Password(textEditingController: tecPassword, obscureText: providerController.obscureTextFieldPassword, providerController: providerController, context: context),
            const SizedBox(
              height: 15,
            ),
            customTextFormField_Password(textEditingController: tecConfirmPassword, obscureText: providerController.obscureTextFieldPassword, providerController: providerController, context: context),

            const SizedBox(
              height: 50,
            ),
            customButton(
                height: 50,
                title: "${getLang(context, "Reset Password")}",
                titleSize: 18,
                titleColor: const Color(0xFF2C3051),
                backgroundColor: const Color(0xFFEDB423),
                width: 350,
                function: () {
                  if (formKey_restart.currentState!.validate()) {

                    providerController.changeRestartScreen(newRestartPasswordScreenValue: false);
                    providerController.changeDefaultScreen(newDefaultScreen: 0);
                customNavigation(context: context, screen: SignIn(), type: "replacement");


                  }
                }),
          ],
        ),
      ),
    );
  }
}
