import 'dart:async';

import 'package:flutter/material.dart';
import 'package:task_company/Components/Components.dart';
import 'package:task_company/LocalizationApp/AppLocale.dart';
import 'package:task_company/Video/Video_Settings/Video_Settings_Screen.dart';
import '../../models/model_page_view.dart';
import 'PageViewScreenTutorials/PageViewScreenTutorials.dart';

class TutorialsScreen extends StatefulWidget {
  const TutorialsScreen({Key? key}) : super(key: key);

  @override
  State<TutorialsScreen> createState() => _TutorialsScreenState();
}

class _TutorialsScreenState extends State<TutorialsScreen> {
  List<ScreenData> listScreenData = [
    ScreenData("Learn from the best", "assets/images/image_1.png",
        "Online classes taught by the word’s best. Gordon Ramsay, Stephen Curry, and more."), //data screen 1

    ScreenData("Download and watch anytime", "assets/images/image_2.png",
        "Download up to 10 digestible lessons that you can watch offline at any time."), //data screen 2

    ScreenData("Explore a range of topics", "assets/images/image_3.png",
        "Perfect homemade paste, or write a novel All wit acess to 100+ class."), //data screen 3
  ];

  PageController pageViewController = PageController();
  int indexPageView = 0;
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      Timer(const Duration(seconds: 2), () {
        if (indexPageView == 2) {
          indexPageView = 0;
        } else {
          indexPageView++;
        }
        setState(() {});
      });
    });
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Color(0xFF2C3051),
            )),
        title: Text(
          "${getLang(context, "Tutorials")}",
          style: const TextStyle(
              fontSize: 24,
              color: Color(0xFF2C3051),
              fontWeight: FontWeight.w300),
        ),
        actions: [
          IconButton(onPressed: (){
            customNavigation(context: context, screen: VideoSettings(), type: "noreplacement");
          }, icon: Icon(Icons.settings ,color: Color(0xFF2C3051),))
        ],
        centerTitle: true,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(21),
              child: Text(
                "${getLang(context, "03. Food Safety Lesson Plan_2")}",
                style: TextStyle(fontSize: 24, color: Color(0xFF2C3051)),
              ),
            ),
            Column(
              children: [
                SizedBox(
                  height: 330,
                  child: PageView(
                    controller: pageViewController,
                    children: [
                      PageViewScreenTutorials(listScreenData[indexPageView]),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ...List.generate(listScreenData.length, (index) {
                      return Indecator(
                          isActive: indexPageView == index ? true : false);
                    }),
                  ],
                )
              ],
            ),
            Padding(
              padding: const EdgeInsetsDirectional.only(start: 16,top: 24),
              child: Text(
                "${getLang(context, "TutorialText")}",
                style: TextStyle(fontSize: 16, color: Color(0xFF6D6D6D)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Indecator extends StatelessWidget {
  const Indecator({
    Key? key,
    required this.isActive,
  }) : super(key: key);

  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 5),
      width: isActive == true ? 20 : 10,
      height: 10,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: isActive == true ? Colors.amber : Colors.grey),
    );
  }
}
