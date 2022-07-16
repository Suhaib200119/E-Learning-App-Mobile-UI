  import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_company/LocalizationApp/AppLocale.dart';

import '../Components/Components.dart';
import '../Providers/ProviderChangeStates.dart';

class SelectWay extends StatelessWidget {
  const SelectWay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var providerController = Provider.of<ProviderChangeStates>(context);
    return  Column(children: [
      Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        child:  Text(
          "${getLang(context, "Select which contact details should we use to reset your password")}",
          style: TextStyle(
            fontSize: 16,
            color: Color(0xFF6D6D6D),
          ),
        ),
      ),
      const SizedBox(
        height: 40,
      ),
      customContainerButton(
          title: "${getLang(context, "Via SMS")}",
          data: "+84 96023****",
          icon: Icons.phone_android,
          function: () {
            providerController.changeRestartScreen(newRestartPasswordScreenValue: true);
            providerController.changeDefaultScreen(newDefaultScreen: -1);
          }),
      const SizedBox(
        height: 20,
      ),
      customContainerButton(
          title: "${getLang(context, "Via email")}",
          data: "Capide****@gmail.com",
          icon: Icons.email_outlined,
          function: () {
            providerController.changeRestartScreen(newRestartPasswordScreenValue: true);
            providerController.changeDefaultScreen(newDefaultScreen: -1);
          }),
    ]);
  }
}
