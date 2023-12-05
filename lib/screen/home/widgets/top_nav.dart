import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:web_booking/constants/color.dart';
import 'package:web_booking/constants/style.dart';
import 'package:web_booking/page/signin/controller_signin.dart/info_signin_controller.dart';
import 'package:web_booking/utils/getx_route.dart';
import 'package:web_booking/widgets/appbar/dropdownLeaguage.dart';

// topNavigationBar(
//   BuildContext context,
// ) =>
//     AppbarWidget();

class AppbarWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Container(
        padding: EdgeInsets.only(
          left: 16,
        ),
        child: Image.asset(
          'assets/images/hats_logo.png',
        ),
      ),
      title: Row(
        children: [
          Text(
            'Hai An Container',
            style: TextStyle(color: haian),
          ),
          Expanded(child: Container()),
          const SizedBox(
            width: 12,
          ),
          Text(
            informationController.tenNV.value,
            style: style_text_detail,
          ),
          const SizedBox(
            width: 30,
          ),
          DropdownLeaguage(),
          const SizedBox(
            width: 30,
          ),
          Container(
            decoration: BoxDecoration(
                color: white, borderRadius: BorderRadius.circular(10)),
            child: CircleAvatar(
              backgroundColor: normalColor,
              child: IconButton(
                onPressed: () {
                  Get.toNamed(GetRoutes.SignIn);
                },
                icon: Icon(
                  Icons.logout,
                  color: white,
                ),
              ),
            ),
          ),
        ],
      ),
      elevation: 5,
      backgroundColor: white,
    );
  }
}
