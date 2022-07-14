import 'dart:async';

import 'package:flutter/material.dart';
import 'package:task_company/Components/Components.dart';
import 'package:task_company/PaymentScreen/PaymentWidget/Choose_payment_method_dialog_3.dart';

import 'Choose_payment_method_dialog_1.dart';

class payment_2 extends StatelessWidget {
  const payment_2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        IconButton(
            onPressed: () {
              Navigator.pop(context);
              showDialog(
                  context: context,
                  builder: (ctx) {
                    return const AlertDialog(
                      title: payment_1(),
                    );
                  });
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Color(0xFFE9E7E7),
            )),
        Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              customContainerPaymentMethod(
                  methodName: "paypal",
                  methodData: "*******ller234@gmail.com",
                  fontSize: 14,
                  methodIamge: "assets/images/paypal.png",
                  function: () {}),
              SizedBox(height: 26,),
              customContainerPaymentMethod(
                  methodName: "Mastercard",
                  methodData: "****. ****  ****  6758",
                  fontSize: 12,
                  methodIamge: "assets/images/mastercard.png",
                  function: () {}),
              SizedBox(height: 26,),
              customContainerPaymentMethod(
                  methodName: "Visa",
                  methodData: "****. **** ****  8765",
                  fontSize: 12,
                  methodIamge: "assets/images/visa.png",
                  function: () {}),
              SizedBox(height: 30,),
              customButton(
                height: 50,
                width: double.infinity,
                backgroundColor: Color(0xFFFFC226),
                title: "Add new method",
                titleSize: 16,
                titleColor: Color(0xFF2C3051),
                function: () {
                  Navigator.pop(context);
                  showDialog(context: context, builder: (ctx){
                    return const AlertDialog(
                      title: payment_3(),
                    );
                  });
                },
              ),
            ],
          ),
        )
      ],
    );
  }
}
