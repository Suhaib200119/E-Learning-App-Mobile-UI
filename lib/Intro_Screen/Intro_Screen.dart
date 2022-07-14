import 'package:flutter/material.dart';

import '../models/model_page_view.dart';

class IntroScreen extends StatelessWidget {
  ScreenData objectScreenData;
  IntroScreen(this.objectScreenData, {Key? key}) : super(key: key);
  double heightSizedBox=20.0;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      padding: const EdgeInsets.only(top: 100),
      child: Column(
        children: [
          Text(objectScreenData.title.toString(), style: const TextStyle(fontSize: 22)),//Title Screen
           SizedBox(
            height: heightSizedBox,
          ),
          Image.asset(
            objectScreenData.imageName,
            fit: BoxFit.cover,
            width: MediaQuery.of(context).size.width,
            height: 350,
          ),//Image Screen
           SizedBox(
            height: heightSizedBox,
          ),
          SizedBox(
            width: 350,
            child: Text(
              objectScreenData.subTitle,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 15,
                color: Colors.grey.withOpacity(0.9),
              ),
            ),
          ),//Container Represent The Subtitle Screen
        ],
      ),
    );
  }
}
