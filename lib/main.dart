import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:localization/controllers/langauges.dart';
import 'package:localization/controllers/localizationController.dart';
import 'screens/screens.dart';

void main() {

  runApp(MyApp());
}

class MyApp extends StatefulWidget {

  static void setLocale(BuildContext context, Locale newLocale) {
    _MyAppState state = context.findAncestorStateOfType<_MyAppState>()!;
    state.setLocale(newLocale);
  }
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Locale? _locale;
  setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    
    });
  }

  @override
  void didChangeDependencies() {
    getLocale().then((locale) {
      setState(() {
        print(locale.languageCode);
        this._locale = locale;
      });
    });
    super.didChangeDependencies();
  }




  @override
  Widget build(BuildContext context) {
    
      if (this._locale == null) {
      return Container(
        child: Center(
          child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color?>(Colors.blue[800])),
        ),
      );
    } else {
      print("new lang ${_locale?.languageCode}");
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/home':(context) => Home()
      },
      localeResolutionCallback: (locale,supportedLocales){
        for (var supportedLocale in supportedLocales) {
            if (supportedLocale.languageCode == locale?.languageCode) {
              return supportedLocale;
            }
          }
          return supportedLocales.first;
      },
      locale: Locale(_locale!.languageCode.toString()),
      localizationsDelegates:[
        DemoLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalMaterialLocalizations.delegate
      ],
      supportedLocales:[
        Locale('en'),
        Locale('fr'),
        Locale('ar'),
      ],
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
}
