import 'package:flutter/material.dart';
import 'package:web_booking/screen/home/homepage_screen.dart';
import 'package:web_booking/screen/member/member_screen.dart';
import 'package:web_booking/widgets/sidebar/sider_bar.dart';

void selectedItem(BuildContext context, int index) {
  switch (index) {
    case 0:
      widgetbody = HomePage();
      nameAppbar = 'HAI AN Container';
      break;
    case 1:
      widgetbody = SideBar();
      nameAppbar = 'List Requests';
      break;
  }
}
