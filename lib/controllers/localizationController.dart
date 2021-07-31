





import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class LocalizationController extends GetxController {

  String _title = "Home Page";
  setTitle(String til) => _title = til;
  String get getTitle => _title;
  String _content = "This is my first translation app.";
  setContent (String con) => _content = con;
  String get getContent => _content;
  var _lang = 'en';
    

    changeLang(String lang ) async{
      _lang = lang;
      AppLocalizations  appLocalizations =  await AppLocalizations.delegate.load(Locale(_lang));
      setTitle(appLocalizations.title);
      setContent(appLocalizations.content);
    }
}