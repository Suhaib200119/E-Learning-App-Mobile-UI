
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task_company/layoutApp/DownloadScreen/Download_Screen.dart';
import 'package:task_company/layoutApp/HomeScreen/Home_Screen.dart';
import 'package:task_company/layoutApp/Search_Screen/SearchScreen.dart';

import '../layoutApp/Settings/SettingsScreen.dart';


class ProviderChangeStates extends ChangeNotifier {
  bool obscureTextFieldPassword = true;
  void changeObscureTextFieldPassword() {
    obscureTextFieldPassword = !obscureTextFieldPassword;
    notifyListeners();
  }

  bool checkBoxValue = false;
  void changeValueCheckBox({required bool newCheckBoxValue}) {
    checkBoxValue = newCheckBoxValue;
    notifyListeners();
  }

  String defLang="en";
  changeDefLang(String newLang){
    defLang=newLang;
    notifyListeners();
  }

  bool onEditingTextFieldVerification = true;
  void changeOnEditingTextFieldVerification({required bool newOnEditingTextFieldVerification}) {
    onEditingTextFieldVerification = newOnEditingTextFieldVerification;
    notifyListeners();
  }

  String? textFieldVerificationValue;
  void changeTextFieldVerificationValue({required String newTextFieldVerificationValue}) {
    textFieldVerificationValue = newTextFieldVerificationValue;
    notifyListeners();
  }

  int defaultScreen = 0;
  void changeDefaultScreen({required int newDefaultScreen}) {
    defaultScreen = newDefaultScreen;
    notifyListeners();
  }

  bool restartPasswordScreenValue = false;
  void changeRestartScreen({required bool newRestartPasswordScreenValue}) {
    restartPasswordScreenValue = newRestartPasswordScreenValue;
    notifyListeners();
  }

  int currentIndexBottomNavigationBar = 0;
  void changeCurrentIndex({required int newIndexBottomNavigationBar}) {
    currentIndexBottomNavigationBar = newIndexBottomNavigationBar;
    notifyListeners();
  }

  List<Widget> listScreen=[
    Home(),
     Search(),
     Download(),
     AccountSettingsParent(),

  ];

  bool showDownload=false;
  void changeDownload({required bool newValue}){
    showDownload=newValue;
    notifyListeners();
  }
  bool switchValue_AppSettings=true;
  void changeSwitchValue_AppSettings({required bool switchNewValue}){
    switchValue_AppSettings=switchNewValue;
    notifyListeners();
  }
  bool switchValue_AppReminders=true;
  void changeSwitchValue({required bool switchNewValue}){
    switchValue_AppReminders=switchNewValue;
    notifyListeners();
  }

  bool switchValue_EmailReminders=false;
  void changeSwitchValue_EmailReminders({required bool switchNewValue}){
    switchValue_EmailReminders=switchNewValue;
    notifyListeners();
  }

  String timeOfDayReminder="_";
  void changeTimeOfDayReminder(String newTime){
    timeOfDayReminder=newTime;
    notifyListeners();
  }

  List<bool> b = [true, false];
void changeB({required int index}){
  if (index == 0) {
    b[0] = true;
    b[1] = false;
  } else if(index==1) {
    b[1] = true;
    b[0] = false;
  }
  notifyListeners();
}


  bool switchValue_Video_Settings=false;
  void changeSwitchValue_Video_Settings({required bool switchNewValue}){
    switchValue_Video_Settings=switchNewValue;
    notifyListeners();
  }


}
