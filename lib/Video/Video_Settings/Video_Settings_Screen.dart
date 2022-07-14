import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_company/Providers/ProviderChangeStates.dart';
import 'package:task_company/Video/Information/Information.dart';

import '../../Components/Components.dart';

class VideoSettings extends StatelessWidget {
  const VideoSettings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var providerController = Provider.of<ProviderChangeStates>(context);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: Color(0xFF2C3051),
            )),
        actions: [
          IconButton(onPressed: (){
            customNavigation(context: context, screen: Information(), type: "noreplacement");
          }, icon: Icon(Icons.info_outline,color: Color(0xFF2C3051),)),
        ],
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Switch(
            value: providerController.switchValue_Video_Settings,
            onChanged: (bool value) {
              providerController.changeSwitchValue_Video_Settings(
                  switchNewValue: value);
            },
            activeTrackColor: const Color(0xFFFFC226),
            activeColor: const Color(0xFFF9F9F9),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                customContainerRemindersScreen(
                  title: "English",
                  widget: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.done,
                        color: Color(0xFF2C3051),
                      )),
                ),

                customContainerRemindersScreen(
                  title: "Chinese",
                  widget: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.done,
                        color: Color(0xFF2C3051),
                      )),
                ),

                customContainerRemindersScreen(
                  title: "Japanese",
                  widget: IconButton(
                      onPressed: () {},
                      icon: Icon(
                          Icons.done,
                        color: Color(0xFF2C3051),
                      )),
                ),

                customContainerRemindersScreen(
                  title: "French",
                  widget: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.done,
                        color: Color(0xFF2C3051),
                      )),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
