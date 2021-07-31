import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:localization/config/config.dart';
import 'package:localization/controllers/localizationController.dart';
class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String? dropdownvalue ;
  List<String> items = ['English','Frensh',"العربية"];
  LocalizationController langController = LocalizationController() ;
  @override
  void initState() {
    super.initState();
    langController = Get.find<LocalizationController>();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(langController.getTitle,textAlign: TextAlign.left,style: TextStyle(color: Colors.black,fontSize: 26,fontWeight: FontWeight.w400,),),
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
                  setState(() {
                    dropdownvalue = newValue;
                  });
                  switch (newValue){
                    case "English":
                      setState(() {
                        langController.changeLang( 'en');
                      });
                      break;
                    case "Frensh":
                      setState(() {
                        langController.changeLang( 'fr');
                      });
                      break;
                    case "العربية":
                      setState(() {
                        langController.changeLang('ar');
                      });
                      break;
                  }
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
          child: Text(langController.getContent  ,textAlign: TextAlign.left,style: TextStyle(color: Colors.black,fontSize: 26,fontWeight: FontWeight.w400,),),
        ),
      ),
    );
  }
}