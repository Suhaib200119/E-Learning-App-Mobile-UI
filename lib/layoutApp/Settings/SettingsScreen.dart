import 'package:flutter/material.dart';
import 'package:task_company/LocalizationApp/AppLocale.dart';

import '../../Components/Components.dart';
import 'AccountSettings.dart';
import 'AppSettings.dart';

class AccountSettingsParent extends StatelessWidget {
  const AccountSettingsParent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          customAppBar(
              context: context,
              titleAppBar: "${getLang(context, "Settings")}",
              therIsBackButton: false,
          ),
        const SizedBox(height: 50,),
          Container(
            margin:const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
                children: [
                  Column(children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("${getLang(context, "Account_Settings")}",style: TextStyle(fontSize: 16,color: Color(0xFF2C3051)),),
                        IconButton(onPressed: (){
                          customNavigation(context: context, screen: AccountSettings(), type: "noreplacement");
                        }, icon:const Icon(Icons.navigate_next,size: 50,)),
                      ],
                    ),
                    const Divider(color: Color(0xFFD8DCFF)),
                  ]),

            ]),
          ),
          const SizedBox(height: 20,),

          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
                children: [
                  Column(children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                         Text("${getLang(context, "AppSettings")}",style: TextStyle(fontSize: 16,color: Color(0xFF2C3051)),),
                        IconButton(onPressed: (){
                          customNavigation(context: context, screen: AppSettings(), type: "noreplacement");
                        }, icon: const Icon(Icons.navigate_next,size: 50,)),
                      ],
                    ),
                    const Divider(color: Color(0xFFD8DCFF)),
                  ]),

                ]),
          ),
        ],
      ),
    );
  }
}
