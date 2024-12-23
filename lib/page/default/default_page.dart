import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:web_booking/constants/variable.dart';

import 'package:web_booking/page/default/widgets/mainMenu/mainMenu.dart';
import 'package:web_booking/page/default/widgets/mainSearch/mainSearch.dart';
import 'package:web_booking/widgets/appbar/appbar.dart';
import 'package:web_booking/widgets/appbar/checkInfoUser/infoUser_appbar.dart';

class DefaultPage extends StatefulWidget {
  @override
  State<DefaultPage> createState() => _DefaultPageState();
}

class _DefaultPageState extends State<DefaultPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: deviceHeight(context),
        alignment: Alignment.topCenter,
        constraints: const BoxConstraints.expand(),
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/VesselHA1.jpg'),
                fit: BoxFit.cover)),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              appbar(),
              mainMenu(),
              mainSearch().animate().fade(duration: 500.ms).slideY(),
              SizedBox(
                height: 50,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
