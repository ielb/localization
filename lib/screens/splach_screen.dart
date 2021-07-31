import 'package:flutter/material.dart';
import 'package:localization/config/config.dart';

class Splach extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(      
        height: getHeight(context),
        width: getWidth(context),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Localization App",style: TextStyle(color: Colors.black,fontSize: 26,fontWeight: FontWeight.w500),),
            SizedBox(height: getHeight(context)*.3),
            CircularProgressIndicator.adaptive()
          ],
        ),
      ),
    );
  }
}