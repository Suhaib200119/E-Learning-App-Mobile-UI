import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:provider/provider.dart';
import 'package:task_company/Components/Components.dart';
import 'package:task_company/Providers/ProviderChangeStates.dart';
import 'package:task_company/Video/Video_Watch/Video_Watch.dart';

class LearningScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var providerController = Provider.of<ProviderChangeStates>(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 500,
              width: double.infinity,
              decoration: const BoxDecoration(
                image: DecorationImage(image: AssetImage("assets/images/profileImage.jpg"), fit: BoxFit.cover,),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30)),
              ),
              child: Container(
                padding: const EdgeInsets.only(
                    top: 40, left: 10, right: 10, bottom: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(
                            Icons.arrow_back_ios,
                            color: Color(0xFFFFC226),
                          ),
                          iconSize: 35,
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.notifications,
                              color: Color(0xFFFFC226),
                            ),
                            iconSize: 35)
                      ],
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    ),
                    Column(
                      children: [
                        Row(children: [
                          const Text(
                            "Gordon Ramsey",
                            style: TextStyle(
                                color: Color(0xFFFFC226), fontSize: 22),
                          ),
                          const SizedBox(
                            width: 16,
                          ),
                          Container(
                            padding: const EdgeInsets.all(2),
                            decoration: const BoxDecoration(
                                borderRadius:
                                BorderRadius.all(Radius.circular(3)),
                                border: Border(
                                  bottom: BorderSide(
                                      width: 1, color: Color(0xFFFFC226)),
                                  top: BorderSide(
                                      width: 1, color: Color(0xFFFFC226)),
                                  left: BorderSide(
                                      width: 1, color: Color(0xFFFFC226)),
                                  right: BorderSide(
                                      width: 1, color: Color(0xFFFFC226)),
                                )),
                            child: const Text(
                              "Purchased",
                              style: TextStyle(
                                  color: Color(0xFFFFC226), fontSize: 14),
                            ),
                          ),
                        ]),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(children: [
                          RatingBar.builder(
                            itemSize: 20,
                            initialRating: 3,
                            minRating: 1,
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            itemCount: 5,
                            itemPadding:
                            const EdgeInsets.symmetric(horizontal: 0.5),
                            itemBuilder: (context, _) => const Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                            onRatingUpdate: (rating) {
                              if (kDebugMode) {
                                print(rating);
                              }
                            },
                          ),
                          const SizedBox(width: 80),
                          const Text(
                            "15 videos",
                            style: TextStyle(
                                fontSize: 14, color: Color(0xFF9BA5FF)),
                          ),
                        ]),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              child: const Text(
                                "Teaches cooking II: Restaurant recipes at home",
                                style: TextStyle(
                                    fontSize: 16, color: Color(0xFFFFFFFF)),
                              ),
                              width: 300,
                            ),
                            IconButton(
                                onPressed: () async {
                                  await GallerySaver.saveImage(
                                      "https://cdn.pixabay.com/photo/2014/02/27/16/10/tree-276014_960_720.jpg",
                                      albumName: "Flutter");
                                },
                                icon: const Icon(
                                  Icons.download,
                                  color: Color(0xFFFFC226),
                                  size: 35,
                                )),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: 50,
              width: double.infinity,
              margin: const EdgeInsets.only(right: 28, left: 28, top: 28),
              decoration: BoxDecoration(
                color: const Color(0xFFFFC226),
                borderRadius: BorderRadius.circular(3),
              ),
              alignment: Alignment.center,
              child: const Text(
                "Start Learning",
                style: TextStyle(
                    fontSize: 18,
                    color: Color(0xFF2C3051),
                    fontWeight: FontWeight.w300),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: ToggleButtons(
                  constraints: BoxConstraints(
                    minWidth: MediaQuery.of(context).size.width / 2.1,
                    minHeight: 40,
                  ),
                  fillColor: const Color(0xFFFFC226),
                  selectedColor: const Color(0xFFFFFFFF),
                  disabledColor: Color(0xFF2C3051),
                  renderBorder: false,
                  onPressed: (index) {
                    providerController.changeB(index: index);
                  },
                  children: const [
                    Text("Overview"),
                    Text("Lessons"),
                  ],
                  isSelected: providerController.b),
            ),
            if (providerController.b[0] == true) ...[
              ListView.builder(
                shrinkWrap: true,
                primary: false,
                padding: EdgeInsets.zero,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.only(bottom: 10, left: 10, right: 10),
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
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: const [
                                    Icon(
                                      Icons.play_arrow,
                                      color: Colors.white,
                                    ),
                                    Text(
                                      "5:24",
                                      style: TextStyle(color: Colors.white),
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                        Expanded(
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Expanded(
                                  child: Text(
                                    "01. Kitchen & Food Safety Lessonn Plans",
                                    style: TextStyle(
                                        fontSize: 14, color: Color(0xFF2C3051)),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    "The basic terms used when cooking.",
                                    style: TextStyle(
                                        fontSize: 12, color: Color(0xFF6D6D6D)),
                                  ),
                                ),
                              ]),
                        ),
                      ],
                    ),
                  );
                },
                itemCount: 10,
              )
            ] else ...[
              ListView.builder(
                shrinkWrap: true,
                primary: false,
                padding: EdgeInsets.zero,
                itemBuilder: (context, index) {
                  return MaterialButton(
                    onPressed: (){
                      customNavigation(context: context, screen: VideoWatch(), type: "noreplacement");
                    },
                    child: Container(
                      margin: EdgeInsets.only(bottom: 10, left: 10, right: 10),
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
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: const [
                                      Icon(
                                        Icons.play_arrow,
                                        color: Colors.white,
                                      ),
                                      Text(
                                        "5:24",
                                        style: TextStyle(color: Colors.white),
                                      )
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                          Expanded(
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: const [
                                  Expanded(
                                    child: Text(
                                      "01. Kitchen & Food Safety Lessonn Plans",
                                      style: TextStyle(
                                          fontSize: 14, color: Color(0xFF2C3051)),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  Expanded(
                                    child: Text(
                                      "The basic terms used when cooking.",
                                      style: TextStyle(
                                          fontSize: 12, color: Color(0xFF6D6D6D)),
                                    ),
                                  ),
                                ]),
                          ),
                        ],
                      ),
                    ),
                  );
                },
                itemCount: 10,
              )
            ]
          ],
        ),
      ),
    );
  }
}
