import 'package:flutter/material.dart';

import 'package:web_booking/page/default/widgets/mainMenu/mainMenu.dart';
import 'package:web_booking/page/default/widgets/mainSearch/mainSearch.dart';
import 'package:web_booking/widgets/appbar/appbar.dart';

class DefaultPage extends StatefulWidget {
  @override
  State<DefaultPage> createState() => _DefaultPageState();
}

class _DefaultPageState extends State<DefaultPage> {
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
          child: ListView(children: const <Widget>[
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
    );
  }
}
