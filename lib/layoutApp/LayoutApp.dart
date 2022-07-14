import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_company/Providers/ProviderChangeStates.dart';

class LayoutApp extends StatelessWidget {
  const LayoutApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var providerController=Provider.of<ProviderChangeStates>(context);
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
      color: Colors.amber,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        buttonBackgroundColor: Colors.amber,
        items: const [
          Icon(Icons.home,color: Colors.white,),
          Icon(Icons.search,color: Colors.white,),
          Icon(Icons.download,color: Colors.white,),
          Icon(Icons.settings,color: Colors.white,),
        ],
        onTap: (index){
              providerController.changeCurrentIndex(newIndexBottomNavigationBar: index);
              providerController.changeDownload(newValue: false);
        },
      ),

      body: providerController.listScreen[providerController.currentIndexBottomNavigationBar],
    );
  }
}
