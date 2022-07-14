import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_company/LocalizationApp/AppLocale.dart';
import '../Components/Components.dart';
import '../Providers/ProviderChangeStates.dart';

class FormScreenUsername extends StatelessWidget {
 late var formKey ;
 late TextEditingController tecUsername ;


 FormScreenUsername(this.formKey, this.tecUsername, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var providerController = Provider.of<ProviderChangeStates>(context);
    return Column(children: [
      Container(
        margin: const EdgeInsets.symmetric(horizontal: 30),
        child: Form(
          key: formKey,
          child: Column(
            children: [
             Text(
                "${getLang(context, "Enter your username to reset your password.")}",
                style: TextStyle(
                  fontSize: 16,
                  color: Color(0xFF6D6D6D),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              customTextFormField(
                  controller: tecUsername,
                  keyboardType: TextInputType.name,
                  hintText: "${getLang(context, "Username")}",
                  errorMassage: "username"),
              const SizedBox(
                height: 35,
              ),
              customButton(
                height: 50,
                  title: "${getLang(context, "Send")}",
                  titleSize: 22,
                  titleColor: Colors.white,
                  backgroundColor: Color(0xFFFFC226),
                  width: 300,
                  function: () {
                    if (formKey.currentState!.validate()) {
                      providerController.changeDefaultScreen(newDefaultScreen: 1);
                    }
                  }),
            ],
          ),
        ),
      ),
    ]);
  }
}
