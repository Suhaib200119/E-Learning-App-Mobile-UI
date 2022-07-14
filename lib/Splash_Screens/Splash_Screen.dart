import 'dart:async';
import 'package:flutter/material.dart';
import 'package:task_company/LocalizationApp/AppLocale.dart';
import '../Components/Components.dart';
import '../PageView_Screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);


  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool isTrue=true;
  @override
  void initState() {
     Timer(const Duration(milliseconds: 2000), () {
      setState(() {
        isTrue=false;
      });
    });

     Timer(const Duration(milliseconds: 3000), () {
       setState(() {
         customNavigation(context: context, screen: PageViewScreen(), type: "replacement");

       });
     });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        color: Colors.amber,
          child: Center(
            child:isTrue==true?Image.asset('assets/images/eduME.png'):  Text("${getLang(context, "Welcome!")}",style: TextStyle(
              fontSize: 50,color: Colors.white
          ),),
      ),
      ),
    );
  }
}
