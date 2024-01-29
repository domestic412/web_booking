import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:web_booking/constants/color.dart';
import 'package:web_booking/constants/style.dart';
import 'package:web_booking/constants/variable.dart';
import 'package:web_booking/controllers/sidebar_controller.dart';
import 'package:web_booking/page/default/default_page.dart';
import 'package:web_booking/page/signin/controller_signin.dart/info_signin_controller.dart';
import 'package:web_booking/utils/getx_route.dart';
import 'package:web_booking/widgets/appbar/dropdownLeaguage.dart';

class appbar extends StatefulWidget {
  @override
  State<appbar> createState() => _appbarState();
}

class _appbarState extends State<appbar> {
  @override
  Widget build(BuildContext context) {
    if ((box.read(authorize_signin) != 'authorize' &&
        box.read(authorize_signin) != null &&
        informationController.authorize.value == '')) {
      informationController.updateInfomationSignIn(
          authorize: box.read(authorize_signin).toString().obs,
          maNV: box.read(maNV_signin).toString().obs,
          tenNV: box.read(tenNV_signin).toString().obs,
          author: box.read(author_signin).toString().obs,
          code: box.read(code_signin).toString().obs);
    }
    print(box.read(authorize_signin).toString());
    return Obx(
      () => Container(
        width: deviceWidth(context),
        height: 40,
        alignment: Alignment.center,
        color: haian,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              Container(
                padding: EdgeInsets.only(left: 50),
                width: 1196,
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
              const DropdownLeaguage(),
              const SizedBox(
                width: 30,
              ),
              informationController.tenNV.value != ''
                  ? Row(
                      children: [
                        Container(
                          width: 70,
                          child: Text(
                            informationController.tenNV.value,
                            style: TextStyle(color: white),
                          ),
                        ),
                        const SizedBox(
                          width: 30,
                        ),
                        IconButton(
                          onPressed: () {
                            box.write(authorize_signin, 'authorize');
                            informationController
                                .resetInfomationSignInController();
                            Get.toNamed(GetRoutes.defaultRoute);
                            currentRouteController.route.value = 'default';
                            controller.selectWidget.value = dashboard;
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
                        Get.toNamed(GetRoutes.SignIn);
                      },
                      child: Container(
                          width: 70,
                          child: Text(
                            'signin'.tr,
                            style: style14_white,
                          )),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
