import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_company/Components/Components.dart';
import 'package:task_company/LocalizationApp/AppLocale.dart';
import 'package:task_company/Providers/ProviderChangeStates.dart';

import '../../SignIn_SignUp_Screens/SignIn_Screen.dart';

class AccountSettings extends StatelessWidget {
  var keyForm = GlobalKey<FormState>();
  TextEditingController tecOldPassword = TextEditingController();
  TextEditingController tecNewPassword = TextEditingController();
  TextEditingController tecConfirmNewPassword = TextEditingController();

  AccountSettings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            customAppBar(
                context: context,
                titleAppBar: "${getLang(context, "Account_Settings")}",
                therIsBackButton: true,
                function: () {
                  Navigator.pop(context);
                }),
            const SizedBox(
              height: 40,
            ),
            const CircleAvatar(
              radius: 60,
              backgroundImage: AssetImage('assets/images/profileImage.jpg'),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "SIS-22-21",
              style: TextStyle(fontSize: 20, color: Color(0xFF2C3051)),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   Text(
                    "${getLang(context, "Edit_Profile")}",
                    style: TextStyle(fontSize: 14, color: Color(0xFF6D6D6D)),
                  ),
                  FadeInLeftBig(
                    
                    child: customContainerSettings(
                        title: "${getLang(context, "Phone_Number")}",
                        subTitle: "+84 960238026",
                       ),
                  ),
                  FadeInLeftBig(
                    
                    child: customContainerSettings(
                        title: "${getLang(context, "Email")}",
                        subTitle: "danielkeller.123@gmail.com",
                       ),
                  ),
                  FadeInLeftBig(
                    child: customContainerSettings(
                        title: "${getLang(context, "Password")}",
                        subTitle: "12345",
                        function: () {
                          showDialog(
                              context: context,
                              builder: (ctx) {
                                var providerController = Provider.of<ProviderChangeStates>(ctx);
                                return AlertDialog(
                                  title: Center(
                                    child: Form(
                                      key: keyForm,
                                      child: Column(
                                        children: [
                                           Text(
                                            "${getLang(context, "Change_your_password")}",
                                            style: const TextStyle(
                                                fontSize: 16,
                                                color: Color(0xFF2C3051)),
                                          ),
                                          customTextFormField_Password(
                                            textEditingController:
                                            tecOldPassword,
                                            obscureText: providerController
                                                .obscureTextFieldPassword,
                                            providerController:
                                                providerController, context: context,
                                          ),
                                          const SizedBox(
                                            height: 15,
                                          ),
                                          customTextFormField_Password(
                                            textEditingController:
                                            tecNewPassword,
                                            obscureText: providerController
                                                .obscureTextFieldPassword,
                                            providerController:
                                            providerController, context: context,
                                          ),
                                          const SizedBox(
                                            height: 15,
                                          ),
                                          customTextFormField_Password(
                                            textEditingController:
                                            tecConfirmNewPassword,
                                            obscureText: providerController
                                                .obscureTextFieldPassword,
                                            providerController:
                                            providerController, context: context,
                                          ),
                                          const SizedBox(
                                            height: 15,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  actions: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        customButton(
                                            height: 50,
                                            title:"${getLang(context, "Cancel")}",
                                            titleSize: 16,
                                            titleColor: const Color(0xFF2C3051),
                                            backgroundColor: Color(0xFFEDEDEF),
                                            width: 100,
                                            function: () {
                                              Navigator.pop(context);
                                            }),
                                        customButton(
                                            height: 50,
                                            title: "${getLang(context, "Okay_2")}",
                                            titleSize: 16,
                                            titleColor: Colors.white,
                                            backgroundColor: Color(0xFFFFC226),
                                            width: 100,
                                            function: () {
                                              Navigator.pop(context);
                                              showDialog(
                                                  context: context,
                                                  builder: (ctx) {
                                                    return customDialog(
                                                      title:
                                                      "${getLang(context, "Password_changed_succesfully")}",
                                                      widget: Image.asset(
                                                          "assets/images/successfully_Image.png"),
                                                    );
                                                  });
                                            }),
                                      ],
                                    )
                                  ],
                                );
                              });
                        }),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Center(
                    child: customButton(
                        height: 50,
                        title: "${getLang(context, "Log_out_1")}",
                        titleSize: 16,
                        titleColor: Colors.white,
                        backgroundColor: Color(0xFFFFC226),
                        width: 300,
                        function: () {
                          showDialog(
                              context: context,
                              builder: (ctx) {
                                return customDialogeDeleteLogout(
                                    context: context,
                                    titleDialog:"${getLang(context, "You_sure_want_to_log_out")}",
                                    titleButton: "${getLang(context, "Log_out_2")}",
                                    backgroundButton: Color(0xFFFFC226),
                                    function: () {
                                    Navigator.pop(context);
                                    Navigator.pop(context);
                                    customNavigation(context: context, screen: SignIn(), type: "replacement");
                                    });
                              });
                        }),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
