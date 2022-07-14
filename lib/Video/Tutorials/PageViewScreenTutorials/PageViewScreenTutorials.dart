import 'package:flutter/material.dart';

import '../../../models/model_page_view.dart';

class PageViewScreenTutorials extends StatelessWidget {
  ScreenData objectScreenData;


  PageViewScreenTutorials(this.objectScreenData );

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            Image.asset(
              objectScreenData.imageName,
              width: double.infinity,
              fit: BoxFit.cover,
              height: 250,
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              objectScreenData.title,
              style: const TextStyle(fontSize: 16, color: Color(0xFF2C3051)),
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              width: 300,
              child: Text(
                objectScreenData.subTitle,
                style: const TextStyle(
                  fontSize: 12,
                  color: Color(0xFF6D6D6D),
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
