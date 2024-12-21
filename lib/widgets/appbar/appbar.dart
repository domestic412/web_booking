import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:web_booking/constants/color.dart';
import 'package:web_booking/constants/style.dart';
import 'package:web_booking/constants/variable.dart';
import 'package:web_booking/page/default/default_page.dart';
import 'package:web_booking/page/signin/controller_signin.dart/info_signin_controller.dart';
import 'package:web_booking/screen/notifications/notification_screen.dart';
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
      // alignment: Alignment.center,
      color: haian,
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () {
              Get.to(() => DefaultPage());
            },
            child: Row(
              children: [
                Icon(
                  Icons.home_sharp,
                  size: 20,
                  color: white,
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  'welcome'.tr,
                  style: style14_white,
                  textAlign: TextAlign.left,
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              inforUserController.shipperName.value != ''
                  ? Row(
                      children: [
                        Text(
                          inforUserController.shipperName.value,
                          style: TextStyle(color: white),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        IconButton(
                          onPressed: () {
                            box.remove(shipperName_signin);
                            box.remove(shipperId_signin);
                            inforUserController.resetInfoController();
                            Get.toNamed(GetRoutes.defaultRoute);
                            currentRouteController.route.value = 'default';
                            // controller.selectWidget.value = dashboard;
                            // setState(() {});
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
                        Get.toNamed(GetRoutes.SignIn);
                      },
                      child: Container(
                        margin: EdgeInsets.only(right: 10),
                        child: Text(
                          'signin'.tr,
                          style: style14_white,
                        ),
                      ),
                    ),
              const DropdownLeaguage(),
              inforUserController.shipperName.value != ''
                  // ? PopupMenuButton(itemBuilder: itemBuilder)
                  ? NotificationIconButton(
                      userId: inforUserController.shipperId.value,
                    )
                  : SizedBox.shrink(),
            ],
          ),
        ],
      ),
    );
  }
}
