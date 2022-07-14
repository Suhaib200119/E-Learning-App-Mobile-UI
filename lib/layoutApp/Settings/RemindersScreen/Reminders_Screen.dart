import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_company/Components/Components.dart';
import 'package:task_company/Providers/ProviderChangeStates.dart';

import '../AppSettings.dart';

class RemindersScreen extends StatelessWidget {
  DateTime dateTime = DateTime.now();

  RemindersScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var providerController = Provider.of<ProviderChangeStates>(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            customAppBar(
              titleAppBar: "Reminders",
              context: context,
              therIsBackButton: true,
              function: () {
                Navigator.pop(context);
              },
            ),
            Container(
              margin: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Reminders",
                    style: TextStyle(fontSize: 14, color: Color(0xFF6D6D6D)),
                  ),
                  customContainerRemindersScreen(
                    title: "App Reminders",
                    widget: Switch(
                      value: providerController.switchValue_AppReminders,
                      onChanged: (bool value) {
                        providerController.changeSwitchValue(
                            switchNewValue: value);
                      },
                      activeTrackColor: const Color(0xFFFFC226),
                      activeColor: const Color(0xFFF9F9F9),
                    ),
                  ),
                  const SizedBox(height: 8),
                  customContainerRemindersScreen(
                    title: "App Reminders",
                    widget: Switch(
                      value: providerController.switchValue_EmailReminders,
                      onChanged: (bool value) {
                        providerController.changeSwitchValue_EmailReminders(
                            switchNewValue: value);
                      },
                      activeTrackColor: const Color(0xFFFFC226),
                      activeColor: const Color(0xFFF9F9F9),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const Text(
                    "Frequency",
                    style: TextStyle(fontSize: 14, color: Color(0xFF6D6D6D)),
                  ),
                  const SizedBox(
                    height: 14,
                  ),
                  customContainerRemindersScreen(
                    title: "Weekdays",
                  ),
                  const SizedBox(height: 8),
                  customContainerRemindersScreen(
                    title: "Weekends",
                    widget:
                        IconButton(onPressed: () {}, icon: const Icon(Icons.done)),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const Text(
                    "Time of day",
                    style: TextStyle(fontSize: 14, color: Color(0xFF6D6D6D)),
                  ),
                  const SizedBox(
                    height: 14,
                  ),
                  // if(true) ...[
                  //
                  // ],
                  customContainerRemindersScreen(
                    title: providerController.timeOfDayReminder,
                    widget: IconButton(
                        onPressed: () {


                        if(Platform.isAndroid){
                          showTimePicker(
                            context: context,
                            initialTime: TimeOfDay.now(),
                          ).then((time) {
                            providerController.changeTimeOfDayReminder(
                                "${time?.hour.toString().padLeft(2, '0')} : ${time?.minute.toString().padLeft(2, '0')}");
                          });
                        }else{
                          showCupertinoModalPopup(
                              context: context,
                              builder: (_) => Container(
                                height: 190,
                                color: Color.fromARGB(255, 255, 255, 255),
                                child: Column(
                                  children: [
                                    Container(
                                      height: 180,
                                      child: CupertinoDatePicker(
                                          initialDateTime: DateTime.now(),
                                          onDateTimeChanged: (val) {
                                        print(val);
                                          }),
                                    ),
                                  ],
                                ),
                              ));
                        }},
                        icon: const Icon(Icons.edit)),
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
