import 'package:flutter/material.dart';
import 'package:web_booking/assets/constants/color.dart';
import 'package:web_booking/assets/constants/style.dart';
import 'package:web_booking/assets/constants/variable.dart';
import 'package:web_booking/screen/default/widgets/appbarTest.dart';
import 'package:web_booking/screen/default/widgets/mainMenu.dart';
import 'package:web_booking/screen/default/widgets/mainSearch.dart';
import 'package:web_booking/widgets/footer.dart';

class DefaultScreen extends StatefulWidget {
  @override
  State<DefaultScreen> createState() => _DefaultScreenState();
}

ScrollController _vertical = ScrollController();
ScrollController _horizontal = ScrollController();

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
                  image: AssetImage('lib/assets/images/VesselHA1.jpg'),
                  fit: BoxFit.cover)),
          child: Column(
            children: [
              appbar(),
              mainMenu(),
              Scrollbar(
                controller: _horizontal,
                // thumbVisibility: true,
                child: Scrollbar(
                  controller: _vertical,
                  // thumbVisibility: true,
                  child: SingleChildScrollView(
                    controller: _horizontal,
                    scrollDirection: Axis.horizontal,
                    child: SingleChildScrollView(
                      controller: _vertical,
                      scrollDirection: Axis.vertical,
                      child: Container(
                        // width: 1500,
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              // appbar(),
                              // mainMenu(),
                              const SizedBox(
                                height: 150,
                              ),
                              Container(
                                // color: red,
                                // padding: const EdgeInsets.only(right: 20),
                                alignment: Alignment.centerRight,
                                width: 1000,
                                height: 150,
                                child: Text(
                                  'Customer Satisfaction\n is Our Success',
                                  textAlign: TextAlign.end,
                                  style: TextStyle(
                                      fontSize: 60,
                                      fontWeight: FontWeight.bold,
                                      color: white,
                                      shadows: const [
                                        Shadow(
                                            color: Colors.black, blurRadius: 10)
                                      ]),
                                ),
                              ),
                              const SizedBox(
                                height: 150,
                              ),
                              mainSearch(),
                              SizedBox(
                                height: 50,
                              )
                            ]),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        // bottomSheet: Footer(),
      ),
    );
  }
}
