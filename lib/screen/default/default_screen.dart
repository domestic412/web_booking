import 'package:flutter/material.dart';
import 'package:web_booking/assets/constants/color.dart';
import 'package:web_booking/assets/constants/style.dart';
import 'package:web_booking/screen/default/widgets/appbarTest.dart';
import 'package:web_booking/screen/default/widgets/mainMenu.dart';
import 'package:web_booking/screen/default/widgets/mainSearch.dart';

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
              image: AssetImage('lib/assets/images/VesselHA1.jpg'),
              fit: BoxFit.cover)),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            appbar(),
            mainMenu(),
            const SizedBox(
              height: 150,
            ),
            Container(
              // padding: const EdgeInsets.only(right: 20),
              alignment: Alignment.centerRight,
              width: 1500,
              height: 150,
              child: Text(
                'Customers Satisfaction\n is Our Success',
                textAlign: TextAlign.end,
                style: TextStyle(
                    fontSize: 60,
                    fontWeight: FontWeight.bold,
                    color: white,
                    shadows: const [
                      Shadow(color: Colors.black, blurRadius: 10)
                    ]),
              ),
            ),
            const SizedBox(
              height: 150,
            ),
            mainSearch(),
          ],
        ),
      ),
    ));
  }
}
