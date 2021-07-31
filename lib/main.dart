import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:localization/controllers/localizationController.dart';
import 'screens/screens.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  LocalizationController controller =LocalizationController();
  controller = Get.put(controller,permanent: true);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/home':(context) => Home()
      },
      locale: Locale('en'),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: FutureBuilder(
        future: Future.delayed(Duration(seconds: 2)),
        builder: (context,snap){
          if(snap.connectionState ==ConnectionState.waiting){
            return Splach();
          }else
            return Home();
      },),
    );
  }
}
