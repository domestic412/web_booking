import 'package:flutter/material.dart';
import 'package:web_booking/screen/admin/admin_page.dart';
import 'package:web_booking/widgets/sidebar/sider_bar.dart';

void selectedItem(BuildContext context, int index) {
  switch (index) {
    case 0:
      widgetbody = AdminPage();
      nameAppbar = 'HAI AN Container';
      break;
    case 1:
      widgetbody = SideBar();
      nameAppbar = 'List Requests';
      break;
  }
}
