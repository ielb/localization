import 'package:flutter/material.dart';
import 'package:localization/config/config.dart';
import 'package:localization/controllers/langauges.dart';
import 'package:localization/controllers/localizationController.dart';
import 'package:localization/main.dart';
class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String? dropdownvalue ;
  List<String> items = ['en','fr',"ar"];

  void _changeLanguage(String? lng )async{
    Locale _locale = await setLocale(lng??'en');
    MyApp.setLocale(context, _locale);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(DemoLocalizations.of(context).title,textAlign: TextAlign.left,style: TextStyle(color: Colors.black,fontSize: 26,fontWeight: FontWeight.w400,),),
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: DropdownButton(
              value: dropdownvalue,
              hint: Text(dropdownvalue ?? 'Language'),
              items: items.map((e) => DropdownMenuItem(
                value: e,
                child: Text(e)
              )).toList(),
              onChanged:  (String? newValue){
                
                    _changeLanguage(newValue);
                  
                },
            ),

          )
        ],
      ),
      backgroundColor: Colors.grey[100],
      body: Container(
        padding: EdgeInsets.only(right:50,left:50),
        height: getHeight(context),
        width: getWidth(context),
        child: Center(
          child: Text(DemoLocalizations.of(context).content ,textAlign: TextAlign.left,style: TextStyle(color: Colors.black,fontSize: 26,fontWeight: FontWeight.w400,),),
        ),
      ),
    );
  }
}