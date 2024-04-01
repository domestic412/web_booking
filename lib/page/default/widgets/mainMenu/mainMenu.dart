import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:web_booking/constants/color.dart';
import 'package:web_booking/constants/variable.dart';
import 'package:web_booking/controllers/sidebar_controller.dart';
import 'package:web_booking/page/default/widgets/mainMenu/title/title_booking.dart';
import 'package:web_booking/page/default/widgets/mainMenu/title/title_combine.dart';
import 'package:web_booking/page/default/widgets/mainMenu/title/title_schedule.dart';
import 'package:web_booking/page/default/widgets/mainMenu/title/title_tracking.dart';
import 'package:web_booking/page/signin/controller_signin.dart/info_signin_controller.dart';
import 'package:web_booking/utils/getx_route.dart';

// ignore: camel_case_types
class mainMenu extends StatefulWidget {
  const mainMenu({
    super.key,
  });

  @override
  State<mainMenu> createState() => _mainMenuState();
}

// ignore: camel_case_types
class _mainMenuState extends State<mainMenu> {
  // Color booking_color = Color.fromARGB(255, 21, 123, 206);
  // Color tracking_color = Color.fromARGB(255, 21, 123, 206);

  // bool isHovered_signUp = false;
  Color? signUp_color = Colors.blue[900];

  void handleMouseEnter_signUp(PointerEnterEvent event) {
    setState(() {
      // isHovered_signUp = true;
      signUp_color = haian;
    });
  }

  void handleMouseExit_signUp(PointerExitEvent event) {
    setState(() {
      // isHovered_signUp = false;
      signUp_color = Colors.blue[900];
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
              color: Colors.white70,
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
                          child: Image.asset('assets/images/hact_logo.png')),
                      const SizedBox(
                        width: 70,
                      ),
                      BookingMenu(),
                      TrackingMenu(),
                      CombineMenu(),
                      ScheduleMenu(),
                      Container(
                        alignment: Alignment.topRight,
                        padding: EdgeInsets.only(top: 20),
                        width: 250,
                        child: MouseRegion(
                          onEnter: handleMouseEnter_signUp,
                          onExit: handleMouseExit_signUp,
                          child: InkWell(
                            onTap: () {
                              // context.go(AppRoutes.signUpRoute);
                              // Get.toNamed(GetRoutes.SignIn);
                              inforUserController.shipperName.value == ''
                                  ? Get.toNamed(GetRoutes.NewSignIn)
                                  : Get.toNamed(GetRoutes.Home);
                              currentRouteController.route.value = 'service';
                              controller.selectWidget.value = dashboard;
                            },
                            child: Container(
                              alignment: Alignment.center,
                              height: 50,
                              width: 100,
                              decoration: BoxDecoration(
                                  color: signUp_color,
                                  borderRadius: BorderRadius.circular(15)),
                              child: Text(
                                'Service'.tr,
                                style: TextStyle(
                                    fontSize: 18,
                                    // fontWeight: FontWeight.bold,
                                    color: white),
                              ),
                            ),
                          ),
                        ),
                      ),
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
