import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_company/Components/Components.dart';
import 'package:task_company/LocalizationApp/AppLocale.dart';
import 'package:task_company/Providers/ProviderChangeStates.dart';

import 'RemindersScreen/Reminders_Screen.dart';

class AppSettings extends StatelessWidget {
  const AppSettings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var providerController=Provider.of<ProviderChangeStates>(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            customAppBar(
                context: context,
                titleAppBar: "${getLang(context, "AppSettings")}",
                therIsBackButton: true,
                function: () {
                  Navigator.pop(context);

                }),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   Text(
                    "${getLang(context, "Reminders")}",

                    style: TextStyle(fontSize: 14, color: Color(0xFF6D6D6D)),
                  ),
                  customContainerRemindersScreen(
                    title: "${getLang(context, "App_Reminders")}",
                    widget: Switch(
                      value: providerController.switchValue_AppSettings,
                      onChanged: (bool value) {
                        providerController.changeSwitchValue_AppSettings(
                            switchNewValue: value);
                      },
                      activeTrackColor: const Color(0xFFFFC226),
                      activeColor: const Color(0xFFF9F9F9),
                    ),
                  ),
                  const SizedBox(height: 8),
                   Text(
                    "${getLang(context, "languages")}",
                    style: TextStyle(fontSize: 14, color: Color(0xFF6D6D6D)),
                  ),
                  customContainerRemindersScreen(
                    title: "${getLang(context, "English")}",
                    widget: IconButton(
                        onPressed: () {
                          providerController.changeDefLang("en");
                        },
                        icon: const Icon(
                          Icons.done,
                          color: Color(0xFF2C3051),
                        )),
                  ),
                  customContainerRemindersScreen(
                    title: "${getLang(context, "Arabic")}",
                    widget: IconButton(
                        onPressed: () {
                          providerController.changeDefLang("ar");
                        },
                        icon: const Icon(
                          Icons.done,
                          color: Color(0xFF2C3051),
                        )),
                  ),
                  const SizedBox(height: 8),

                   Text(
                    "${getLang(context, "VQFD")}",
                    style: TextStyle(fontSize: 14, color: Color(0xFF6D6D6D)),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  customContainerSettings(
                    title: "${getLang(context, "Standard")}",
                      subTitle: "${getLang(context, "DFAULS")}",
                    icon: Icons.done,
                    iconColor: 0xFF2C3051,
                    function: () {},
                    heightSizedBox: 10,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  customContainerSettings(
                      title: "${getLang(context, "High_Definition")}",
                      subTitle: "${getLang(context, "UMS")}",
                      heightSizedBox: 10,
                      isButton: false,
                      function: () {}),
                  const SizedBox(
                    height: 15,
                  ),
                  customContainerSettings(
                      title: "${getLang(context, "Reminders_Screen")}",
                      subTitle: "${getLang(context,"PYR")}",
                      heightSizedBox: 10,
                      isButton: true,
                      icon: Icons.navigate_next,
                      iconColor: 0xFF2C3051,
                      function: () {
                        customNavigation(context: context, screen: RemindersScreen(), type: "noreplacement");
                      }),
                  const SizedBox(
                    height: 40,
                  ),
                  Text(
                    "${getLang(context, "Offline_Downloads")}",
                    style: TextStyle(fontSize: 14, color: Color(0xFF6D6D6D)),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  customContainerSettings(
                    title: "${getLang(context, "DCL")}",
                    subTitle:
                        "${getLang(context, "LA")}",
                    icon: Icons.done,
                    iconColor: 0xFF2C3051,
                    function: () {},
                    heightSizedBox: 10,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  customContainerSettings(
                    title: "${getLang(context, "DLD")}",
                    subTitle:
                        "${getLang(context, "RM")}",
                    titleColor: 0xFFF04444,
                    icon: Icons.delete_forever,
                    iconColor: 0xFFF04444,
                    function: () {
                      showDialog(
                          context: context,
                          builder: (ctx) {
                            return customDialog(
                                therIsheader: true,
                                header: "${getLang(context, "Nothing_to_delete")}",
                                title:
                                    "${getLang(context, "NO_Download")}",
                                widget: Image.asset("assets/images/Group.png"),
                                therIsButton: true,
                                titleButton: "${getLang(context, "Okay")}",
                                function: () {
                                  Navigator.pop(context);
                                });
                          });
                    },
                    heightSizedBox: 10,
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
