import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:web_booking/controllers/sidebar_controller.dart';
import 'package:web_booking/screen/member/member_screen.dart';
import 'package:web_booking/screen/widgets/header.dart';
import 'package:web_booking/screen/widgets/list_item.dart';

import 'package:web_booking/widgets/top_nav.dart';


Widget widgetbody = MemberPage();

class UserPage extends StatelessWidget {
  const UserPage({super.key});

  @override
  Widget build(BuildContext context) {
    SideBarController sideBarController = Get.put(SideBarController());
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
    // double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: topNavigationBar(context, scaffoldKey),
      body: Row(
        children: [
          Drawer(
            backgroundColor: const Color.fromRGBO(9, 34, 126, 1),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  buiderHeader(context),
                  buiderMenuItems(context),
                ],
              ),
            ),
          ),
          Expanded(
              child: Obx(
                  () => sideBarController.pages[sideBarController.index.value]))
        ],
      ),
    );
  }
}