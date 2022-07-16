import 'dart:async';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:task_company/Components/Components.dart';
import 'package:task_company/LocalizationApp/AppLocale.dart';
import 'package:task_company/SignIn_SignUp_Screens/SignIn_Screen.dart';
import 'package:task_company/models/model_page_view.dart';
import 'Intro_Screen/Intro_Screen.dart';
import 'SignIn_SignUp_Screens/SignIn_Screen.dart';

class PageViewScreen extends StatefulWidget {
  const PageViewScreen({Key? key}) : super(key: key);

  @override
  State<PageViewScreen> createState() => _PageViewScreenState();
}

class _PageViewScreenState extends State<PageViewScreen> {
  List<ScreenData> listScreenData = [
    ScreenData("Learn from the best", "assets/images/image_1.png",
        "Online classes taught by the word’s best. Gordon Ramsay, Stephen Curry, and more."), //data screen 1

    ScreenData("Download and watch anytime", "assets/images/image_2.png",
        "Download up to 10 digestible lessons that you can watch offline at any time."), //data screen 2

    ScreenData("Explore a range of topics", "assets/images/image_3.png",
        "Perfect homemade paste, or write a novel All wit acess to 100+ class."), //data screen 3
  ];


  int initialPage = 0; //initial page in page view
  PageController pageViewController = PageController(
      initialPage: 0); //PageController to control in page view widget
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            PageView(
              controller: pageViewController,
              onPageChanged: (index) {
                if (index == 2) {
                  Timer(const Duration(milliseconds: 1000), () {
                    customNavigation(context: context, screen: SignIn(), type: "replacement");
                  },);
                }
              },
              children: [
                IntroScreen(listScreenData[0]),
                IntroScreen(listScreenData[1]),
                IntroScreen(listScreenData[2]),
              ],
            ),
            Positioned(
              left: 0,
              right: 0,
              top: 580,
              bottom: 0,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SmoothPageIndicator(
                    controller: pageViewController,
                    count: listScreenData.length,
                    effect: const SlideEffect(
                      activeDotColor: Color(0xFFFFC226),
                      dotHeight: 12,
                      dotColor: Color(0xFFE9E7E7),
                      dotWidth: 12,
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  customButton(
                      height: 50,
                      title: "${getLang(context, "Skip")}",
                      titleSize:  18,
                      titleColor: const Color(0xFF2C3051),
                      backgroundColor:  Color(0xFFFFC226),
                      width:  300,
                      function:  () {
                        customNavigation(context: context, screen: SignIn(), type: "replacement");
                  }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
