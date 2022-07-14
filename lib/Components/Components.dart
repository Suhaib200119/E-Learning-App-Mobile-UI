import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:task_company/LocalizationApp/AppLocale.dart';
import 'package:task_company/Profile_Screen/ProfileScreen.dart';
import 'package:task_company/Providers/ProviderChangeStates.dart';

// here there is customAppBar
Widget customAppBar({
  int stackColor = 0xFFFFC226,
  int shapeColor = 0xFFFFCF54,
  required String titleAppBar,
  double titleAppBarSize = 35,
  int titleApppColor = 0xFF2C3051,
  required BuildContext context,
  bool therIsBackButton = true,
  int backButtonColor = 0xFF2C3051,
  Function? function,
  bool therIsImageWidget = false,
  String? imageName,
  String  defLang="en",
}) {
  return Stack(
    children: [
      Container(
        height: 200,
        width: MediaQuery.of(context).size.width,
        color: Color(stackColor),
      ),
      Positioned(
        top: -100,
        right: -200,
        child: CircleAvatar(
          radius: 200,
          backgroundColor: Color(shapeColor),
        ),
      ),
      if (therIsBackButton)
        Directionality(
          textDirection: TextDirection.ltr,
          child: Positioned(
            right: 250,
            bottom: 0,
            top: -30,
            left: -60,
            child: IconButton(
              onPressed: () {
                function!();
              },
              icon: Icon(
                Icons.arrow_back_ios,
                color: Color(backButtonColor),
              ),
            ),
          ),
        ),
      Positioned(
        right: 0,
        bottom: 0,
        top: 110,
        left: 35,
        child: Text(
          titleAppBar,
          style: TextStyle(
              fontSize: titleAppBarSize, color: Color(titleApppColor)),
        ),
      ),
      if (therIsImageWidget == true)
        Positioned(
          right: defLang=="en"?  30:300,
          bottom: 30,
          child: MaterialButton(
            onPressed: () {
              customNavigation(
                  context: context,
                  screen: ProfileScreen(),
                  type: "noreplacement");
            },
            child: CircleAvatar(
              radius: 40,
              backgroundColor: Colors.transparent,
              child: Hero(
                tag: "profile",
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Image.asset('assets/images/$imageName')),
              ),
            ),
          ),
        ),
    ],
  );
}
// here there is customButton

Widget customButton({
  required double height,
  required double width,
  required Color backgroundColor,
  String? title,
  required double titleSize,
  required Color titleColor,
  FontWeight fontWeight = FontWeight.w300,
  required Function function,
  bool thereIsImage = false,
  String? pathImage,
  double? widthImage,
  double? heightImage,
}) {
  return Container(
    width: width,
    height: height,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(5),
      color: backgroundColor,
    ),
    child: MaterialButton(
      onPressed: () {
        function();
      },
      child: thereIsImage != true
          ? Text(
              title!,
              style: TextStyle(
                  fontSize: titleSize,
                  color: titleColor,
                  fontWeight: fontWeight),
            )
          : Row(children: [
              const Spacer(),
              Image.asset(
                pathImage!,
                width: widthImage,
                height: heightImage,
              ),
              const SizedBox(
                width: 5,
              ),
              Text(
                title!,
                style: TextStyle(color: titleColor),
              ),
              const Spacer(),
            ]),
    ),
  );
}

// here there is customGestureDetector
Widget customGestureDetector(
    {required String text,
    double textSize = 14,
    int textColor = 0xFF53588A,
    required Function function}) {
  return GestureDetector(
    onTap: () {
      function();
    },
    child: Text(text,
        style: TextStyle(
          fontSize: textSize,
          color: Color(textColor),
        )),
  );
}

// here there is customTextFormField
Widget customTextFormField(
    {required TextEditingController controller,
    required TextInputType keyboardType,
    required String hintText,
    required String errorMassage}) {
  return TextFormField(
    controller: controller,
    keyboardType: keyboardType,
    validator: (valeUseur) {
      if (valeUseur!.isEmpty) {
        return "You must Enter the $errorMassage";
      } else {
        return null;
      }
    },
    decoration: InputDecoration(
      hintText: hintText,
      hintStyle: const TextStyle(color: Color(0xFFA2A2A2)),
    ),
  );
}

// here there is customTextFormField_Password

Widget customTextFormField_Password(
    {required TextEditingController textEditingController,
    required bool obscureText,
    required ProviderChangeStates providerController}) {
  return TextFormField(
    controller: textEditingController,
    keyboardType: TextInputType.visiblePassword,
    obscureText: obscureText,
    validator: (inputUser) {
      if (inputUser!.isEmpty) {
        return "You must Enter the password";
      } else {
        return null;
      }
    },
    decoration: InputDecoration(
        hintText: "Password",
        hintStyle: const TextStyle(color: Color(0xFFA2A2A2)),
        suffixIcon: IconButton(
            onPressed: () {
              providerController.changeObscureTextFieldPassword();
            },
            icon: Icon(
              providerController.obscureTextFieldPassword
                  ? Icons.visibility
                  : Icons.visibility_off,
              color: const Color(0xFFD8D8D8),
            ))),
  );
}

// here there is customContainerButton

Widget customContainerButton(
    {required String title,
    required String data,
    required IconData icon,
    required Function function}) {
  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 20),
    width: double.infinity,
    height: 140,
    decoration: BoxDecoration(
      color: Colors.grey.withOpacity(0.1),
      borderRadius: BorderRadius.circular(5),
    ),
    child: MaterialButton(
      onPressed: () {
        function();
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Icon(icon, color: const Color(0xFF53588A)),
          Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title),
                const SizedBox(
                  height: 10,
                ),
                Text(data),
              ]),
        ],
      ),
    ),
  );
}

// here there is customContainerSettings

Widget customContainerSettings({
  required String title,
  required String subTitle,
  Function? function,
  double titleSize = 16,
  double subTitleSize = 12,
  int titleColor = 0xFF2C3051,
  int subTitleColor = 0xFF2C3051,
  IconData icon = Icons.edit,
  int iconColor = 0xFFD8D8D8,
  double heightSizedBox = 0,
  bool isButton = true,
}) {
  return Column(children: [
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            title,
            style: TextStyle(fontSize: titleSize, color: Color(titleColor)),
          ),
          SizedBox(
            height: heightSizedBox,
          ),
          SizedBox(
            width: 250,
            child: Text(
              subTitle,
              style: TextStyle(
                  fontSize: subTitleSize,
                  color: Color(subTitleColor),
                  overflow: TextOverflow.ellipsis),
            ),
          ),
        ]),
        if (isButton)
          IconButton(
              onPressed: () {
                function!();
              },
              icon: Icon(icon, color: Color(iconColor))),
      ],
    ),
    const Divider(color: Color(0xFFD8DCFF)),
  ]);
}

//here there is alertDialog
Widget customDialog({
  required String title,
  required Widget widget,
  bool therIsheader = false,
  String? header,
  bool therIsButton = false,
  String? titleButton,
  Function? function,
}) {
  return AlertDialog(
    title: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (therIsheader == true)
          Text(
            header!,
            style: const TextStyle(
                color: Color(0xFFF04444), fontWeight: FontWeight.w300),
          ),
        const SizedBox(
          height: 20,
        ),
        widget,
        const SizedBox(
          height: 20,
        ),
        Text(
          title,
          style: const TextStyle(fontSize: 16, color: Color(0xFF53588A)),
        ),
        const SizedBox(
          height: 20,
        ),
        if (therIsButton == true)
          customButton(
            height: 50,
            width: 300,
            backgroundColor: Color(0xFFFFC226),
            title: titleButton,
            titleSize: 22,
            titleColor: const Color(0xFF2C3051),
            function: () {
              function!();
            },
          ),
      ],
    ),
  );
}

//here there is customActionAlertDialoge
Widget customDialogeDeleteLogout(
    {required BuildContext context,
    required String titleDialog,
    required String titleButton,
    required Color backgroundButton,
    required Function function}) {
  return AlertDialog(
    title: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          titleDialog,
          style: const TextStyle(
              color: Color(0xFF2C3051),
              fontSize: 16,
              fontWeight: FontWeight.w300),
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            customButton(
                height: 50,
                title: "${getLang(context, "Cancel")}",
                titleSize: 16,
                titleColor: const Color(0xFF2C3051),
                backgroundColor: Color(0xFFEDEDEF),
                width: 100,
                function: () {
                  Navigator.pop(context);
                }),
            customButton(
                height: 50,
                title: titleButton,
                titleSize: 16,
                titleColor: Colors.white,
                backgroundColor: backgroundButton,
                width: 100,
                function: () {
                  function();
                }),
          ],
        ),
      ],
    ),
  );
}
//here there is customCard Download and Home Screen

Widget customCard({
  required BuildContext context,
  required String imageName,
  required String title,
  required String description,
  bool therIsPrice = true,
  double? price,
  required int videoNumber,
}) {
  return Card(
    elevation: 10,
    child: Container(
      width: MediaQuery.of(context).size.width,
      height: 150,
      child: Row(
        children: [
          Image.asset(
            "assets/images/$imageName",
            width: 130,
            height: 150,
            fit: BoxFit.cover,
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.only(left: 5, top: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          title,
                          style: const TextStyle(
                              fontSize: 16, color: Color(0xFF2C3051)),
                        ),
                        const SizedBox(width: 80),
                        if (therIsPrice == true)
                          Text(
                            "\$ $price",
                            style: const TextStyle(
                                fontSize: 16, color: Color(0xFF820F23)),
                          ),
                      ]),
                  Container(
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      width: 200,
                      child: Text(
                        description,
                        style: const TextStyle(
                            overflow: TextOverflow.visible,
                            fontSize: 14,
                            color: Color(0xFFA2A2A2)),
                      )),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
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
                        Text(
                          "$videoNumber ${getLang(context, "videos")}",
                          style: const TextStyle(
                              fontSize: 14, color: Color(0xFF6D6D6D)),
                        ),
                      ]),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

//here there is customCard Profile Screen

Widget customCardProfile(
    {required String title,
    required String subTitle,
    required String imageName}) {
  return Card(
      elevation: 10,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            child: Image.asset(
              "assets/images/$imageName",
              height: 200,
              width: 252.3,
              fit: BoxFit.cover,
            ),
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(5), topRight: Radius.circular(5)),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              title,
              style: const TextStyle(fontSize: 16, color: Color(0xFF2C3051)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              subTitle,
              style: const TextStyle(fontSize: 12, color: Color(0xFF6D6D6D)),
            ),
          ),
        ],
      ));
}

//here there is customeContainer Reminders Screen
Widget customContainerRemindersScreen({
  required String title,
  Widget? widget,
}) {
  return Column(
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
                fontSize: 16,
                color: Color(0xFF2C3051),
                fontWeight: FontWeight.w400),
          ),
          if (widget != null) widget,
        ],
      ),
      const Divider(color: Color(0xFFD8DCFF)),
    ],
  );
}
//here there is custom Container Payment Method

Widget customContainerPaymentMethod({
  required String methodName,
  required String methodData,
  required String methodIamge,
  required Function function,
  double fontSize=14,

}) {
  return Container(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Image.asset(
          methodIamge,
          width: 70,
          height: 50,
        ),
        SizedBox(width: 12,),
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              methodName,
              style: TextStyle(fontSize: 14, color: Color(0xFF6D6D6D)),
            ),
            Text(

              methodData,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: fontSize, color: Color(0xFF6D6D6D)),
            ),
          ],
        )),
        IconButton(
            onPressed: () {
              function();
            },
            icon: Icon(
              Icons.navigate_next_sharp,
              size: 32,
              color: Color(0xFF2C3051),
            )),
      ],
    ),
  );
}

//here there is customeNavigation

void customNavigation(
    {required BuildContext context,
    required Widget screen,
    required String type}) {
  if (type.toLowerCase() == "replacement") {
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (ctx) {
      return screen;
    }));
  } else if (type.toLowerCase() == "noreplacement") {
    Navigator.push(context, MaterialPageRoute(builder: (ctx) {
      return screen;
    }));
  }
}
