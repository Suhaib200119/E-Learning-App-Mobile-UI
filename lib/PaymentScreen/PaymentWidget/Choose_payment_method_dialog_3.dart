import 'dart:async';

import 'package:flutter/material.dart';
import 'package:task_company/Components/Components.dart';
import 'package:task_company/LearningScreen/Learning_Screen.dart';
import 'Choose_payment_method_dialog_2.dart';

class payment_3 extends StatelessWidget {
  const payment_3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconButton(
                onPressed: () {
                  Navigator.pop(context);
                  showDialog(
                      context: context,
                      builder: (ctx) {
                        return const AlertDialog(
                          title: payment_2(),
                        );
                      });
                },
                icon: const Icon(
                  Icons.arrow_back_ios,
                  color: Color(0xFFE9E7E7),
                )),
            Image.asset("assets/images/master_Card_Image.png"),
            const SizedBox(
              height: 16,
            ),
            customTextFormField(
                controller: TextEditingController(),
                keyboardType: TextInputType.text,
                hintText: "Name on card",
                errorMassage: "Card Name"),
            const SizedBox(
              height: 8,
            ),
            customTextFormField(
                controller: TextEditingController(),
                keyboardType: TextInputType.number,
                hintText: "Card number",
                errorMassage: "Card number"),
            const SizedBox(
              height: 8,
            ),
            customTextFormField(
                controller: TextEditingController(),
                keyboardType: TextInputType.number,
                hintText: "Valid until (MM/YY)",
                errorMassage: "Valid until (MM/YY)"),
            const SizedBox(
              height: 40,
            ),
            customButton(
              height: 50,
              width: double.infinity,
              backgroundColor: Color(0xFFFFC226),
              title: "Add New Card",
              titleSize: 16,
              titleColor: Color(0xFF2C3051),
              function: () {
                showDialog(
                    context: context,
                    builder: (ctx) {
                      Future.delayed(Duration(seconds: 2), () {
                        Navigator.of(ctx).pop(true);
                      });
                      return customDialog(
                          title: "Added a new payment method!",
                          widget: Image.asset(
                              "assets/images/successfully_Image.png"));
                    }).then((value) {
                  showDialog(
                      context: context,
                      builder: (ctx_2) {
                        Future.delayed(Duration(seconds: 2), () {
                          Navigator.of(ctx_2).pop(true);
                        });
                        return customDialog(
                            therIsheader: true,
                            header: "Use Face ID to confirm",
                            title:
                                "Tap on your Side Button to active Face ID payment",
                            widget: Image.asset(
                                "assets/images/successfully_Image.png"));
                      }).then((value) {
                    showDialog(
                        context: context,
                        builder: (ctx_2) {
                          Future.delayed(Duration(seconds: 2), () {
                            Navigator.of(ctx_2).pop(true);
                          });
                          return customDialog(
                              therIsheader: true,
                              header: "Use Face ID to confirm",
                              title:
                                  "Double tap on your Side Button to confirm your payment",
                              widget: Image.asset(
                                  "assets/images/successfully_Image.png"));
                        }).then((value) {
                      Navigator.of(context).pop(true);
                      customNavigation(
                          context: context,
                          screen: LearningScreen(),
                          type: "noreplacement");
                    });
                  });
                });
              },
            )
          ],
        ),
      ),
    );
  }
}
