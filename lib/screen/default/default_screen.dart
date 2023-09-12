
import 'package:flutter/material.dart';
import 'package:web_booking/assets/constants.dart/color.dart';
import 'package:web_booking/assets/constants.dart/style.dart';

class DefaultScreen extends StatefulWidget {

  @override
  State<DefaultScreen> createState() => _DefaultScreenState();
}

class _DefaultScreenState extends State<DefaultScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      constraints: const BoxConstraints.expand(),
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('lib/assets/images/VesselHA.jpg'),
              fit: BoxFit.cover)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            height: 40,
            color: haian,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 1430,
                  child: Text('Welcome to Hai An Transport And Stevedoring Joint Stock Company', style: style14_white, textAlign: TextAlign.left,),
                ),
                Container(
                  width: 50,
                  child: Text('English', style: style14_white, textAlign: TextAlign.left,),
                ),
                Container(
                  width: 20,
                  child: Icon(Icons.arrow_drop_down, color: white,),
                )
              ],
            ),
          ),
          Container(
            height: 100,
            color: Colors.white54,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 200,
                  padding: EdgeInsets.all(15),
                  child: Image.asset('E:/Work/Android-IOS-web/web_booking/lib/assets/images/hats_logo.png')
                ),
                Container(
                  width: 1300,
                )
              ],
            ),
          )
          ],
      ),
    ));
  }
}

