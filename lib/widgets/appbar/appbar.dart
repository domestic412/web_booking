import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:web_booking/constants/color.dart';
import 'package:web_booking/constants/style.dart';
import 'package:web_booking/constants/variable.dart';
import 'package:web_booking/page/default/default_page.dart';
import 'package:web_booking/utils/getx_route.dart';
import 'package:web_booking/widgets/appbar/dropdownLeaguage.dart';

class appbar extends StatelessWidget {
  const appbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: deviceWidth(context),
      height: 40,
      alignment: Alignment.center,
      color: haian,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          // mainAxisAlignment: MainAxisAlignment.center,
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
            InkWell(
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
            const SizedBox(
              width: 30,
            ),
          ],
        ),
      ),
    );
  }
}
