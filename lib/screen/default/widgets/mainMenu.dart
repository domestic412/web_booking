import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:web_booking/assets/constants/color.dart';
import 'package:web_booking/assets/constants/variable.dart';

class mainMenu extends StatefulWidget {
  const mainMenu({
    super.key,
  });

  @override
  State<mainMenu> createState() => _mainMenuState();
}

class _mainMenuState extends State<mainMenu> {
  bool isHovered = false;

  void handleMouseEnter(PointerEnterEvent event) {
    setState(() {
      isHovered = true;
    });
  }

  void handleMouseExit(PointerExitEvent event) {
    setState(() {
      isHovered = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          // alignment: Alignment.center,
          height: 250,
          child: Stack(children: <Widget>[
            Container(
              width: deviceWidth(context),
              height: 100,
              color: Colors.white54,
            ),
            Container(
              alignment: Alignment.topCenter,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Container(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                          height: 100,
                          width: 200,
                          padding: const EdgeInsets.all(15),
                          child:
                              Image.asset('lib/assets/images/hats_logo.png')),
                      MouseRegion(
                        onEnter: handleMouseEnter,
                        onExit: handleMouseExit,
                        child: Column(
                          children: <Widget>[
                            Container(
                              alignment: Alignment.center,
                              margin: EdgeInsets.only(top: 35),
                              width: 200,
                              child: Text(
                                'Booking',
                                style: TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                    color: normalColor),
                              ),
                            ),
                            if (isHovered)
                              Container(
                                  margin: EdgeInsets.only(top: 10),
                                  height: 150,
                                  width: 150,
                                  decoration: BoxDecoration(
                                      color: white,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Text(
                                    'Booking online',
                                    style: TextStyle(
                                      fontSize: 20,
                                    ),
                                  )),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ]),
        ),
        Container(
          alignment: Alignment.centerRight,
          padding: EdgeInsets.only(right: 10),
          width: 1400,
          height: 150,
          child: Text(
            'Customer Satisfaction\n is Our Success',
            textAlign: TextAlign.right,
            style: TextStyle(
                fontSize: 60,
                fontWeight: FontWeight.bold,
                color: white,
                shadows: const [Shadow(color: Colors.black, blurRadius: 10)]),
          ),
        ),
        SizedBox(
          height: 150,
        )
      ],
    );
  }
}
