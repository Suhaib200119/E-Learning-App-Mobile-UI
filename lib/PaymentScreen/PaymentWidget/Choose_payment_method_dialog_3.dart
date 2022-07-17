import 'dart:async';

import 'package:flutter/material.dart';
import 'package:task_company/Components/Components.dart';
import 'package:task_company/LearningScreen/Learning_Screen.dart';
import 'package:task_company/LocalizationApp/AppLocale.dart';
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
                hintText: "${getLang(context, "Card name")}",
                errorMassage: "${getLang(context, "card name")}", context: context),
            const SizedBox(
              height: 8,
            ),
            customTextFormField(
                controller: TextEditingController(),
                keyboardType: TextInputType.number,
                hintText: "${getLang(context, "Card number")}",
                errorMassage: "${getLang(context, "card number")}", context: context),
            const SizedBox(
              height: 8,
            ),
            customTextFormField(
                controller: TextEditingController(),
                keyboardType: TextInputType.number,
                hintText: "${getLang(context, "Valid until")} (MM/YY)",
                errorMassage: "${getLang(context, "value")}", context: context),
            const SizedBox(
              height: 40,
            ),
            customButton(
              height: 50,
              width: double.infinity,
              backgroundColor: Color(0xFFFFC226),
              title: "${getLang(context, "Add New Card")}",
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
                          title: "${getLang(context, "Added a new payment method!")}",
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
                            header: "${getLang(context, "Use Face ID to confirm")}",
                            title:
                                "${getLang(context, "Tap on your Side Button to active Face ID payment")}",
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
                              header: "${getLang(context, "Use Face ID to confirm")}",
                              title:
                                  "${getLang(context, "Double tap on your Side Button to confirm your payment")}",
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
