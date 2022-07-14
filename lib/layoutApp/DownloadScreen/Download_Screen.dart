import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_company/LocalizationApp/AppLocale.dart';
import 'package:task_company/Providers/ProviderChangeStates.dart';
import '../../Components/Components.dart';

class Download extends StatelessWidget {
  const Download({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var providerController = Provider.of<ProviderChangeStates>(context);
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          customAppBar(
              context: context,
              titleAppBar: "${getLang(context, "Downloads")}",
              therIsBackButton: false),
          if (providerController.showDownload == true)
            ListView.builder(
              padding: EdgeInsets.all(0),
              shrinkWrap: true,
              primary: false,
              itemBuilder: (ctx, index) {
                return Dismissible(
                  key: UniqueKey(),
                  background: Container(
                    alignment: Alignment.centerRight,
                    child:  Padding(
                      padding: EdgeInsets.only(right: 70),
                      child: Text("${getLang(context, "Delete")}",style: TextStyle(color: Color(0xFFF04444)),)
                    ),
                  ),
                  direction: DismissDirection.endToStart,
                  onDismissed: (ctx) {
                    showDialog(
                        context: context,
                        builder: (ctx) {
                          return customDialogeDeleteLogout(
                              context: context,
                              titleDialog: "${getLang(context, "you sure dialog")}",
                              titleButton: "${getLang(context, "Delete")}",
                              backgroundButton: Color(0xFFF04444),
                              function: (){
                                //you must ther write code
                              }
                          );
                        });
                  },
                  child: customCard(
                    context: context,
                      therIsPrice: false,
                      imageName: "image_1.png",
                      title: "${getLang(context, "Gordon Ramsay")}",
                      price: 49.99,
                      description: "${getLang(context, "Teaches_cooking_")}",
                      videoNumber: 12),
                );
              },
              itemCount: 30,
            ),
          if (providerController.showDownload == false)
            Center(
              child: Column(
                children: [
                  const SizedBox(
                    height: 100,
                  ),
                  Image.asset("assets/images/download_Image.png"),
                  const SizedBox(
                    height: 30,
                  ),
                   SizedBox(
                      width: 300,
                      child: Text(
                        "${getLang(context, "Your downloaded classes and lessons will show up here.")}",
                        textAlign: TextAlign.center,
                      )),
                  const SizedBox(
                    height: 30,
                  ),
                  customButton(
                      height: 50,
                      title: "${getLang(context, "Explore Classes")}",
                      titleSize: 18,
                      titleColor: const Color(0xFF2C3051),
                      backgroundColor: Color(0xFFFFC226),
                      width: 300,
                      function: () {
                        providerController.changeDownload(newValue: true);
                      }),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
