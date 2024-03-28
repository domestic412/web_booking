import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:web_booking/constants/color.dart';
import 'package:web_booking/constants/style.dart';
import 'package:web_booking/constants/variable.dart';
import 'package:web_booking/page/default/default_page.dart';
import 'package:web_booking/page/signin/controller_signin.dart/info_signin_controller.dart';
import 'package:web_booking/utils/getx_route.dart';
import 'package:web_booking/widgets/appbar/dropdownLeaguage.dart';

import 'checkInfoUser/infoUser_appbar.dart';

class appbar extends StatefulWidget {
  @override
  State<appbar> createState() => _appbarState();
}

class _appbarState extends State<appbar> {
  @override
  Widget build(BuildContext context) {
    checkInfoUser();
    return Container(
      width: deviceWidth(context),
      height: 40,
      alignment: Alignment.center,
      color: haian,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.only(left: 20),
              width: 460,
              child: InkWell(
                onTap: () {
                  Get.to(() => DefaultPage());
                },
                child: Text(
                  'welcome'.tr,
                  style: style14_white,
                  textAlign: TextAlign.left,
                ),
              ),
            ),
            Container(
              width: 850,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  inforUserController.tenNV.value != ''
                      ? Row(
                          children: [
                            Container(
                              width: 250,
                              alignment: Alignment.centerRight,
                              child: Text(
                                inforUserController.tenNV.value,
                                style: TextStyle(color: white),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            IconButton(
                              onPressed: () {
                                box.remove(shipperName_signin);
                                inforUserController
                                    .resetInforSignInController();
                                inforUserController
                                    .resetNewInforUserController();
                                Get.toNamed(GetRoutes.defaultRoute);
                                currentRouteController.route.value = 'default';
                                // controller.selectWidget.value = dashboard;
                                setState(() {});
                              },
                              icon: Icon(
                                Icons.logout,
                                color: white,
                              ),
                            )
                          ],
                        )
                      : InkWell(
                          onTap: () {
                            // context.go(AppRoutes.signInRoute);
                            // Get.toNamed(GetRoutes.SignIn);
                            Get.toNamed(GetRoutes.NewSignIn);
                          },
                          child: Container(
                              width: 70,
                              child: Text(
                                'signin'.tr,
                                style: style14_white,
                              )),
                        ),
                  // const SizedBox(
                  //   width: 30,
                  // ),
                  const DropdownLeaguage(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
