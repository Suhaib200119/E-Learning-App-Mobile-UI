import 'dart:async';

import 'package:flutter/material.dart';
import 'package:task_company/Components/Components.dart';
import 'package:task_company/Video/Video_Settings/Video_Settings_Screen.dart';

import '../../PageView_Screen.dart';
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
            icon: Icon(
              Icons.arrow_back_ios,
              color: Color(0xFF2C3051),
            )),
        title: Text(
          "Tutorials",
          style: TextStyle(
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
                "03. Food Safety Lesson Plan",
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
              padding: const EdgeInsets.only(bottom: 21,left: 21,top: 21),
              child: Text(
                "Whether you live on your own or are a busy parent,"
                " finding the time and energy to prepare home-cooked meals can seem like a daunting task."
                " At the end of a hectic day, eating out or ordering in might feel like the quickest, "
                "easiest option. But convenience food can take a significant toll on your mood and health."
                    "Processed food is typically high in chemical additives,hormones, sugar,"
                    " salt, unhealthy fat, and calories, all of which can adversely affect your brain and outlook."
                    " It can leave you feeling tired, bloated,"
                    " and irritable, and exacerbate symptoms of depression,"
                    " stress, anxiety, and other mental health concerns. It can also affect your waistline. A recent study ",
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
