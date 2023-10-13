import 'package:flutter/material.dart';
import 'package:web_booking/screen/default/widgets/appbarTest.dart';
import 'package:web_booking/screen/default/widgets/mainMenu.dart';
import 'package:web_booking/screen/default/widgets/mainSearch.dart';
import 'package:web_booking/widgets/footer.dart';

class DefaultScreen extends StatefulWidget {
  @override
  State<DefaultScreen> createState() => _DefaultScreenState();
}

class _DefaultScreenState extends State<DefaultScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          alignment: Alignment.topCenter,
          constraints: const BoxConstraints.expand(),
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/VesselHA1.jpg'),
                  fit: BoxFit.cover)),
          child: const SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  appbar(),
                  mainMenu(),
                  mainSearch(),
                  SizedBox(
                    height: 50,
                  )
                ]),
          ),
        ),
        // bottomSheet: Footer(),
      ),
    );
  }
}
