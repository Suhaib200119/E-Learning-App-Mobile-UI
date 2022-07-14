import 'package:flutter/material.dart';
import 'package:task_company/Components/Components.dart';

import '../Tutorials/TutorialsScreen.dart';

class VideoWatch extends StatelessWidget {
  const VideoWatch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                    width: double.infinity,
                    height: 300,
                    color: Colors.grey,
                  ),
                  Container(
                    margin: EdgeInsets.all(20),
                    height: 300,
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            }, icon: Icon(Icons.arrow_back_ios)),
                      ],
                    ),
                  ),
                  Positioned(
                    top: 150,
                    left: 0,
                    right: 0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.next_plan_outlined,
                              size: 48,
                            )),
                        IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.play_arrow,
                              size: 48,
                            )),
                        IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.next_plan_outlined,
                              size: 48,
                            )),
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 28),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "03. Food Safety Lesson Plan",
                        style: const TextStyle(
                          fontSize: 22,
                          color: Color(0xFF2C3051),
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        "Use this lesson plan to teach your students the basic terms used when cooking.",
                        style: const TextStyle(
                          fontSize: 14,
                          color: Color(0xFFA2A2A2),
                        ),
                      ),
                      SizedBox(
                        height: 21,
                      ),
                      customButton(
                          height: 50,
                          width: double.infinity,
                          backgroundColor: Color(0xFFFFC226),
                          titleSize: 16,
                          titleColor: Color(0xFF2C3051),
                          function: () {
                            customNavigation(context: context, screen: TutorialsScreen(), type: "noreplacement");
                          },
                          title: "Read Tutorials"),
                      SizedBox(
                        height: 20,
                      ),
                      ListView.builder(
                        shrinkWrap: true,
                        primary: false,
                        itemBuilder: (context, index) {
                          return Container(
                            margin: EdgeInsets.only(bottom: 10),
                            height: 120,
                            child: Row(
                              children: [
                                Stack(
                                  children: [
                                    Image.asset(
                                      "assets/images/image_1.png",
                                      width: 150,
                                      height: 120,
                                      fit: BoxFit.cover,
                                    ),
                                    Positioned(
                                      bottom: 0,
                                      left: 0,
                                      child: Container(
                                        width: 150,
                                        height: 25,
                                        color: Colors.black.withOpacity(0.6),
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: const [
                                            Icon(
                                              Icons.play_arrow,
                                              color: Colors.white,
                                            ),
                                            Text(
                                              "5:24",
                                              style: TextStyle(
                                                  color: Colors.white),
                                            )
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                Expanded(
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: const [
                                        Expanded(
                                          child: Text(
                                            "01. Kitchen & Food Safety Lessonn Plans",
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: Color(0xFF2C3051)),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                        Expanded(
                                          child: Text(
                                            "The basic terms used when cooking.",
                                            style: TextStyle(
                                                fontSize: 12,
                                                color: Color(0xFF6D6D6D)),
                                          ),
                                        ),
                                      ]),
                                ),
                              ],
                            ),
                          );
                        },
                        itemCount: 10,
                      ),
                    ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
