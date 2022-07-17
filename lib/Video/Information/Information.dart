import 'package:flutter/material.dart';
import 'package:task_company/LocalizationApp/AppLocale.dart';

class Information extends StatelessWidget {
  const Information({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);

            },
            icon: Icon(Icons.arrow_back_ios, color: Color(0xFF2C3051))),
        title:  Text(
          "${getLang(context, "Infomations")}",
          style: TextStyle(
              fontSize: 24,
              color: Color(0xFF2C3051),
              fontWeight: FontWeight.w400),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              ClipRRect(
                child: Image.asset("assets/images/image_1.png",
                    width: 100, height: 100),
                borderRadius: BorderRadius.circular(100),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "${getLang(context, "Gordon Ramsey")}",
                style: TextStyle(
                    fontSize: 24,
                    color: Color(0xFF2C3051),
                    fontWeight: FontWeight.w400),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: Row(
                  children: [
                    Text(
                      "${getLang(context, "Born")}",
                      style: TextStyle(fontSize: 16, color: Color(0xFF2C3051)),
                    ),
                    SizedBox(
                      width: 130,
                    ),
                    Text(
                      "${getLang(context, "Nov 8th, 1966")}",
                      style: TextStyle(fontSize: 16, color: Color(0xFF2C3051)),
                    ),
                  ],
                ),
              ),
              Divider(
                height: 1,
                color: Color(0xFFD8DCFF),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: Row(
                  children: [
                    Text(
                      "${getLang(context, "Country")}",
                      style: TextStyle(fontSize: 16, color: Color(0xFF2C3051)),
                    ),
                    SizedBox(
                      width: 105,
                    ),
                    Text(
                      "${getLang(context, "Scotland")}",
                      style: TextStyle(fontSize: 16, color: Color(0xFF2C3051)),
                    ),
                  ],
                ),
              ),
              Divider(
                height: 1,
                color: Color(0xFFD8DCFF),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: Row(
                  children: [
                    Text(
                      "${getLang(context, "Style")}",
                      style: TextStyle(fontSize: 16, color: Color(0xFF2C3051)),
                    ),
                    SizedBox(
                      width: 130,
                    ),
                    Text(
                      "${getLang(context, "French, Italian, British")}",
                      style: TextStyle(fontSize: 16, color: Color(0xFF2C3051)),
                    ),
                  ],
                ),
              ),
              Divider(
                height: 1,
                color: Color(0xFFD8DCFF),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: Row(
                  children: [
                    Text(
                      "${getLang(context, "Rating")}",
                      style: TextStyle(fontSize: 16, color: Color(0xFF2C3051)),
                    ),
                    SizedBox(
                      width: 115,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${getLang(context, "3 Stars Michelin Stars")}",
                          style:
                              TextStyle(fontSize: 16, color: Color(0xFF2C3051)),
                        ),
                        Text(
                          "${getLang(context, "10 Stars Good Food Guide")}",
                          style:
                              TextStyle(fontSize: 16, color: Color(0xFF2C3051)),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Divider(
                height: 1,
                color: Color(0xFFD8DCFF),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: Row(
                  children: [
                    Text(
                      "${getLang(context, "Website")}",
                      style: TextStyle(fontSize: 16, color: Color(0xFF2C3051)),
                    ),
                    SizedBox(width: 105),
                    Text("www.gordonramsey.com",
                        style:
                            TextStyle(fontSize: 16, color: Color(0xFF2C3051))),
                  ],
                ),
              ),
              Divider(
                height: 1,
                color: Color(0xFFD8DCFF),
              ),
              Padding(
                padding: const EdgeInsets.all(24),
                child: Text("${getLang(context, "informations")}"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
