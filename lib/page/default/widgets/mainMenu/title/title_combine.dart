import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:web_booking/constants/color.dart';
import 'package:web_booking/constants/variable.dart';
import 'package:web_booking/controllers/sidebar_controller.dart';
import 'package:web_booking/page/signin/controller_signin.dart/info_signin_controller.dart';
import 'package:web_booking/utils/getx_route.dart';
// import 'package:easy_localization/easy_localization.dart';

class CombineMenu extends StatefulWidget {
  const CombineMenu({super.key});

  @override
  State<CombineMenu> createState() => _CombineMenuState();
}

class _CombineMenuState extends State<CombineMenu> {
  // handle mouse Combine
  bool isHovered_combine = false;
  bool isHovered_checkContainerCombine = false;
  bool isHovered_requestCombine = false;
  Color combine_color = Colors.black54;
  Color checkContainerCombine_color = black;
  Color requestCombine_color = black;

  void handleMouseEnter_combine(PointerEnterEvent event) {
    setState(() {
      isHovered_combine = true;
      combine_color = haian;
    });
  }

  void handleMouseExit_combine(PointerExitEvent event) {
    setState(() {
      isHovered_combine = false;
      combine_color = Colors.black54;
    });
  }

  void handleMouseEnter_checkContainerCombine(PointerEnterEvent event) {
    setState(() {
      isHovered_checkContainerCombine = true;
      checkContainerCombine_color = haian;
    });
  }

  void handleMouseExit_checkContainerCombine(PointerExitEvent event) {
    setState(() {
      isHovered_checkContainerCombine = false;
      checkContainerCombine_color = black;
    });
  }

  void handleMouseEnter_requestCombine(PointerEnterEvent event) {
    setState(() {
      isHovered_requestCombine = true;
      requestCombine_color = haian;
    });
  }

  void handleMouseExit_requestCombine(PointerExitEvent event) {
    setState(() {
      isHovered_requestCombine = false;
      requestCombine_color = black;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: handleMouseEnter_combine,
      onExit: handleMouseExit_combine,
      child: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(top: 35),
            width: 200,
            child: Text(
              'combine'.tr,
              style: TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                  color: combine_color),
            ),
          ),
          if (isHovered_combine)
            Container(
                margin: EdgeInsets.only(top: 20),
                height: 150,
                width: 180,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20)),
                child: Column(
                  children: [
                    Container(
                      height: 7,
                      width: 80,
                      decoration: BoxDecoration(
                          color: haian,
                          borderRadius: BorderRadius.circular(10)),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    MouseRegion(
                      onEnter: handleMouseEnter_checkContainerCombine,
                      onExit: handleMouseExit_checkContainerCombine,
                      child: InkWell(
                        onTap: () {
                          // context.go(AppRoutes.BookingRoute);
                          currentRouteController.route.value = checkingCombine;
                          controller.selectWidget.value = checkingCombine;
                          inforUserController.shipperName.value == ''
                              ? Get.toNamed(GetRoutes.SignIn)
                              : Get.toNamed(GetRoutes.Home);
                        },
                        child: Text(
                          'Check Container',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 16, color: checkContainerCombine_color),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    MouseRegion(
                      onEnter: handleMouseEnter_requestCombine,
                      onExit: handleMouseExit_requestCombine,
                      child: InkWell(
                        onTap: () {
                          // context.go(AppRoutes.BookingRoute);
                          currentRouteController.route.value = sendRequest;
                          controller.selectWidget.value = sendRequest;
                          inforUserController.shipperName.value == ''
                              ? Get.toNamed(GetRoutes.SignIn)
                              : Get.toNamed(GetRoutes.Home);
                        },
                        child: Text(
                          'Request Combine',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 16, color: requestCombine_color),
                        ),
                      ),
                    ),
                  ],
                )),
        ],
      ),
    );
  }
}
