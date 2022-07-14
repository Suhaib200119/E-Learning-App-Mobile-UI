import 'package:flutter/material.dart';
import 'package:task_company/Components/Components.dart';

import 'PaymentWidget/Choose_payment_method_dialog_1.dart';

class Payment_Screen extends StatelessWidget {
  const Payment_Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: 350,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/profileImage.jpg"),
                    fit: BoxFit.cover),
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(30),
                    bottomLeft: Radius.circular(30)),
              ),
              child: Container(
                margin: const EdgeInsets.only(left: 16, top: 48, bottom: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                    Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            "Gordon Ramsey",
                            style: TextStyle(
                                fontSize: 22, color: Color(0xFFFFC226)),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Text(
                            "Teaches cooking II: Restaurant recipes at home",
                            style: TextStyle(
                                fontSize: 22, color: Color(0xFFFFFFFF)),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
                margin: const EdgeInsets.only(top: 16, right: 12, left: 12),
                child: Column(
                  children: [
                    Card(
                      elevation: 8,
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "All-Access Pass",
                              style: TextStyle(
                                  fontSize: 22, color: Color(0xFF2C3051)),
                            ),
                            const SizedBox(height: 16),
                            const Text(
                              "You will get unlimit access to every class you want for a year. All lessons for you auto-renews annually.",
                              style: TextStyle(
                                  fontSize: 16, color: Color(0xFFA2A2A2)),
                            ),
                            const SizedBox(height: 8),
                            const Text(
                              "\$ ${"499.99"} / year",
                              style: TextStyle(
                                  fontSize: 22, color: Color(0xFF2C3051)),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            customButton(
                                height: 50,
                                width: double.infinity,
                                backgroundColor: Color(0xFFFFC226),
                                titleSize: 18,
                                titleColor: Color(0xFF2C3051),
                                function: () {},
                                title: "Get All-Access"),
                          ],
                        ),
                      ),
                    ),
                    Card(
                      elevation: 8,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "This Class Only",
                              style: TextStyle(
                                  fontSize: 22, color: Color(0xFF2C3051)),
                            ),
                            const SizedBox(height: 16),
                            const Text(
                              "A good choice for who want to learn a single class for a long time.",
                              style: TextStyle(
                                  fontSize: 16, color: Color(0xFFA2A2A2)),
                            ),
                            const SizedBox(height: 8),
                            const Text(
                              "\$ ${89.99} / once",
                              style: TextStyle(
                                  fontSize: 22, color: Color(0xFF2C3051)),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            customButton(
                                height: 50,
                                width: double.infinity,
                                backgroundColor: const Color(0xFFD8DCFF),
                                titleSize: 18,
                                titleColor: const Color(0xFF2C3051),
                                function: () {
                                  showDialog(
                                      context: context,
                                      builder: (ctx) {
                                        return const AlertDialog(
                                          title: payment_1(),
                                        );
                                      });
                                },
                                title: "Purchase This Class"),
                          ],
                        ),
                      ),
                    ),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
