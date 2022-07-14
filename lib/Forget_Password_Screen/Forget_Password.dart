import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_company/Components/Components.dart';
import 'package:task_company/Forget_Password_Screen/Child_Screen_2.dart';
import 'package:task_company/Forget_Password_Screen/Child_Screen_3.dart';
import 'package:task_company/LocalizationApp/AppLocale.dart';
import 'package:task_company/Providers/ProviderChangeStates.dart';
import 'Child_Screen_1.dart';

class ForgetPassword extends StatelessWidget {
  var formKey = GlobalKey<FormState>();
  TextEditingController tecUsername = TextEditingController();

  var formKey_restart = GlobalKey<FormState>();
  TextEditingController tecPassword = TextEditingController();
  TextEditingController tecConfirmPassword = TextEditingController();



  ForgetPassword({Key? key}) : super(key: key);

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
                titleAppBar: "${getLang(context, "Forgot Password")}",
                function: () {
                  providerController.changeRestartScreen(newRestartPasswordScreenValue: false);
                  providerController.changeDefaultScreen(newDefaultScreen: 0);
                  Navigator.pop(context);

                }),
            const SizedBox(
              height: 65,
            ),
            if (providerController.defaultScreen == 0)FormScreenUsername(formKey,tecUsername),
            if (providerController.defaultScreen == 1)const SelectWay(),
            if (providerController.restartPasswordScreenValue == true)FormScreenEditPassword(formKey_restart,tecPassword,tecConfirmPassword,context),
          ],
        ),
      ),
    );
  }
}
