import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_company/LearningScreen/Learning_Screen.dart';
import 'package:task_company/LocalizationApp/AppLocale.dart';
import 'package:task_company/PaymentScreen/Payment_Screen.dart';
import 'package:task_company/Providers/ProviderChangeStates.dart';
import '../../Components/Components.dart';
import '../../models/model_page_view.dart';
import 'PageViewScreen/PageView_Screen.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
    var providerController=Provider.of<ProviderChangeStates>(context);
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
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          customAppBar(
            context: context,
            titleAppBar: "${getLang(context, "TitleHomePage")}",
            therIsBackButton: false,
            therIsImageWidget: true,
            imageName: "imageHome.jpg",
            defLang: providerController.defLang,
          ),
           Padding(
            padding: EdgeInsetsDirectional.only(top: 20, bottom: 13, start: 20),
            child: Text(
              "${getLang(context, "Newest_Classes")}",
              style: TextStyle(fontSize: 18, color: Color(0Xff2C3051)),
            ),
          ),
          Column(
            children: [
              SizedBox(
                height: 350,
                child: PageView(
                  controller: pageViewController,
                  children: [
                    PageViewScreen(listScreenData[indexPageView]),
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
            padding: EdgeInsetsDirectional.only(start: 20, top: 20),
            child: Text(
              "${getLang(context, "Popular_Classes")}",
              style: TextStyle(fontSize: 18, color: Color(0xFF2C3051)),
            ),
          ),
          ListView.builder(
            padding: const EdgeInsets.all(0),
            shrinkWrap: true,
            primary: false,
            itemBuilder: (ctx, index) {
              return GestureDetector(
                onTap: () {
                  customNavigation(
                      context: context,
                      screen: Payment_Screen(),
                      type: "noreplacement");
                },
                child: customCard(
                    context: context,
                    imageName: "image_1.png",
                    title: "${getLang(context, "gordon_ramsay")}",
                    price: 49.99,
                    description: "${getLang(context, "Teaches_cooking")}",
                    videoNumber: 12),
              );
            },
            itemCount: 30,
          ),
        ],
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
      width:isActive == true ? 20: 10,
      height: 10,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: isActive == true ? Colors.amber : Colors.grey),
    );
  }
}
