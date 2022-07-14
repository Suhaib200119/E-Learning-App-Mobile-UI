import 'package:flutter/material.dart';

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
        title: const Text(
          "Infomation",
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
                "Gordon Ramsey",
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
                      "Born",
                      style: TextStyle(fontSize: 16, color: Color(0xFF2C3051)),
                    ),
                    SizedBox(
                      width: 130,
                    ),
                    Text(
                      "Nov 8th, 1966",
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
                      "Country",
                      style: TextStyle(fontSize: 16, color: Color(0xFF2C3051)),
                    ),
                    SizedBox(
                      width: 105,
                    ),
                    Text(
                      "Scotland",
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
                      "Style",
                      style: TextStyle(fontSize: 16, color: Color(0xFF2C3051)),
                    ),
                    SizedBox(
                      width: 130,
                    ),
                    Text(
                      "French, Italian, British",
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
                      "Rating",
                      style: TextStyle(fontSize: 16, color: Color(0xFF2C3051)),
                    ),
                    SizedBox(
                      width: 115,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "3 Stars Michelin Stars",
                          style:
                              TextStyle(fontSize: 16, color: Color(0xFF2C3051)),
                        ),
                        Text(
                          "10 Stars Good Food Guide",
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
                      "Website",
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
                child: Text(
                    "As a reality television personality, Ramsay is known for his fiery temper, "
                        "strict demeanour and use of expletives. He often makes blunt and controversial comments,"
                        " including insults and wisecracks about contestants and their cooking abilities. "
                        "He combines activities in the television, film, hospitality,"
                        " and food industries and has promoted and hired various chefs who have apprenticed under his wing."
                        " Ramsay is known for presenting TV programmes about competitive cookery and food, such as the British series Hell's Kitchen, The F Word, and Ramsay's Kitchen Nightmares,"
                        " the American series MasterChef, MasterChef Junior, and Hotel Hell, "
                        "and the American versions of Hell's Kitchen and Kitchen Nightmares. In 2018, Forbes listed his earnings at  62 million"
                        " for the previous 12 months, and ranked him the 33rd-highest-earning celebrity in the world."),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
