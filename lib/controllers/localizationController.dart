import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';


class DemoLocalizations {
  DemoLocalizations(this.locale);

  final Locale locale;

  static DemoLocalizations of(BuildContext context) {
    return Localizations.of<DemoLocalizations>(context, DemoLocalizations)!;
  }

  Map<String,dynamic> _localizedValues = Map<String,dynamic>();


  Future load() async {
    print('langauge : ' +locale.languageCode);
    String jsonStringValues = await rootBundle.loadString('lib/lang/${locale.languageCode}.json');
    Map<String, dynamic> mappedJson = json.decode(jsonStringValues);
    _localizedValues = mappedJson.map((key, value) => MapEntry(key, value));
  }

  String translate(String key){
      return _localizedValues[key];
  }
  String get title {
      return _localizedValues['title'];
  }
  String get content {
      return _localizedValues['content'];
  }
  //static member of demoLocalization

  static const  LocalizationsDelegate<DemoLocalizations> delegate = DemoLocalizationsDelegate();
}

class DemoLocalizationsDelegate
    extends LocalizationsDelegate<DemoLocalizations> {
  const DemoLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    return ['en','fr','ar'].contains(locale.languageCode);
  }

  @override
  Future<DemoLocalizations> load(Locale locale)async{
    DemoLocalizations localizations = new DemoLocalizations(locale);
    await localizations.load();
    return localizations;
  }

  @override
  bool shouldReload(DemoLocalizationsDelegate old) => false;

 
}

