import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_company/Providers/ProviderChangeStates.dart';
import 'package:task_company/Splash_Screens/Splash_Screen.dart';

import 'LocalizationApp/AppLocale.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

String? defLang;
  final sharedPreferences = await SharedPreferences.getInstance();
  if (sharedPreferences.containsKey("defLang")) {
    defLang = sharedPreferences.get("defLang").toString();
    print("lange sharedPreferences: $defLang");
  }
  runApp(MyApp(defLang));
}

class MyApp extends StatelessWidget {
  String? defLang;

  MyApp(this.defLang);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (ctx) {
          return ProviderChangeStates()..changeDefLang(defLang??"en");
        }),
      ],
      builder: (context, child) {
        var providerController = Provider.of<ProviderChangeStates>(context);
        return MaterialApp(
          theme: ThemeData(
            indicatorColor: Colors.amber,
            focusColor: const Color(0xFFD8DCFF),
          ),
          debugShowCheckedModeBanner: false,
          localizationsDelegates: const [
            AppLocale.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale("en", ""),
            Locale("ar", ""),
          ],
          // localeResolutionCallback: (currentLang, supportLang) {
          //   if (currentLang != null) {
          //     for (Locale locale in supportLang) {
          //       if (locale.languageCode == currentLang.languageCode) {
          //         return currentLang;
          //       }
          //     }
          //   } else {
          //     return supportLang.first;
          //   }
          // },
          locale: Locale("${providerController.defLang}", ""),
          home: SplashScreen(),
        );
      },
    );
  }
}
