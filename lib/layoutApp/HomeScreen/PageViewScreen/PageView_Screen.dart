import 'package:flutter/material.dart';
import 'package:task_company/LocalizationApp/AppLocale.dart';

import '../../../models/model_page_view.dart';

class PageViewScreen extends StatelessWidget {
  ScreenData objectScreenData;


  PageViewScreen(this.objectScreenData );

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
              getLang(context, objectScreenData.title.toString().trim()),
              style: const TextStyle(fontSize: 16, color: Color(0xFF2C3051)),
            ),
            Container(
              width: 400,
              child: Text(
               getLang(context, objectScreenData.subTitle.toString().trim()),
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
