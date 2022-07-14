import 'package:flutter/material.dart';
import 'package:task_company/Components/Components.dart';

import 'Choose_payment_method_dialog_2.dart';

class payment_1 extends StatelessWidget {
  const payment_1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Color(0xFFE9E7E7),
            )),
        Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              const Text(
                "You don’t have any payment method",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Color(0xFF2C3051),
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(height: 8,),
              Image.asset("assets/images/download_Image.png"),
              const SizedBox(height: 8,),
              const Text(
                "There is no payment method added to your account.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 12,
                  color: Color(0xFF53588A),
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(height: 8,),
              customButton(
                height: 50,
                width: double.infinity,
                backgroundColor: Color(0xFFFFC226),
                title: "Add New Payment Method",
                titleSize: 16,
                titleColor: Color(0xFF2C3051),
                function: () {
                  Navigator.pop(context);
                  showDialog(context: context, builder: (ctx){
                    return const AlertDialog(
                      title: payment_2(),
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
