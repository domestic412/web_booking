import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:web_booking/constants/color.dart';
import 'package:web_booking/constants/style.dart';
import 'package:web_booking/constants/variable.dart';
import 'package:web_booking/utils/app_route_config.dart';
import 'package:web_booking/widgets/appbar/dropdownLeaguage.dart';

topNavigationBar(
  BuildContext context,
) =>
    AppBar(
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
            tokenLogin,
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
                  context.go(AppRoutes.signInRoute);
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
