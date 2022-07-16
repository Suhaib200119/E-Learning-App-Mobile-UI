import 'package:flutter/material.dart';
import 'package:task_company/Components/Components.dart';
import 'package:task_company/LocalizationApp/AppLocale.dart';

class ProfileScreen extends StatelessWidget {
  double heightListView = 300;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 250,
              child: Stack(children: [
                Stack(
                    children: [
                  Container(
                    height: 200,
                    width: MediaQuery.of(context).size.width,
                    color: Color(0xFFFFC226),
                  ),
                  const Positioned(
                    top: -100,
                    right: -200,
                    child: CircleAvatar(
                      radius: 200,
                      backgroundColor: Color(0xFFFFCF54)
                      ,
                    ),
                  ),
                ]),
                Positioned(
                    left: 28,
                    bottom: 10,
                    child: CircleAvatar(
                      radius: 50,
                      backgroundColor: Colors.transparent,
                      child: Hero(
                          tag: "profile",
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                              child: Image.asset("assets/images/imageHome.jpg"))),
                    )),
                 Positioned(
                    left: 150,
                    bottom: 80,
                    child: Text(
                      "${getLang(context, "profile")}",
                      style: TextStyle(fontSize: 32, color: Color(0xFF2C3051)),
                    )),
                 Positioned(
                    left: 150,
                    bottom: 60,
                    child: Text(
                      "${getLang(context, "All-Access")}",
                      style: TextStyle(fontSize: 16, color: Color(0xFF2C3051)),
                    )),
              ]),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                     Text(
                      "${getLang(context, "Favorites")}",
                      style: TextStyle(fontSize: 18, color: Color(0xFF2C3051)),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 20),
                      height: heightListView,
                      child: ListView.builder(
                        shrinkWrap: true,
                        primary: true,
                        itemBuilder: (context, index) {
                          return customCardProfile(
                              title: "${getLang(context, "Shanda Rhymes")}",
                              subTitle:
                                  "${getLang(context, "Shanda describes what fuels her passion.")}",
                              imageName: "imageHome.jpg");
                        },
                        itemCount: 40,
                        scrollDirection: Axis.horizontal,
                      ),
                    ),
                     Padding(
                      padding: EdgeInsets.only(top: 20),
                      child: Text(
                        "${getLang(context, "Your classes")}",
                        style:
                            TextStyle(fontSize: 18, color: Color(0xFF2C3051)),
                      ),
                    ),
                    SizedBox(
                      height: 50,
                      child: ListView.builder(
                       // shrinkWrap: true,
                       // primary: true,
                        itemBuilder: (context, index) {
                          return TextButton(
                              onPressed: () {}, child: Text("${getLang(context, "Culinary")}"));
                        },
                        itemCount: 30,
                        scrollDirection: Axis.horizontal,
                      ),
                    ),
                    ListView.builder(
                      padding: EdgeInsets.all(0),
                      shrinkWrap: true,
                      primary: false,
                      itemBuilder: (context, index) {
                        return customCard(
                            therIsPrice: false,
                            context: context,
                            imageName: "imageHome.jpg",
                            title: "${getLang(context, "Wolfgang Puck")}",
                            description: "${getLang(context, "Teaches cooking techniques")}",
                            videoNumber: 1);
                      },
                      itemCount: 40,
                      scrollDirection: Axis.vertical,
                    ),
                  ]),
            ),
          ],
        ),
      ),
    );
  }
}
