import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:web_booking/controllers/sidebar_controller.dart';
import 'package:web_booking/page/signin/signin_page.dart';
import 'package:web_booking/screen/widgets/header.dart';
import 'package:web_booking/screen/widgets/list_item.dart';
import 'package:web_booking/widgets/top_nav.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

SideBarController sideBarController = Get.put(SideBarController());

class _HomePageState extends State<HomePage> {
  Future<void> getDataStorage() async {
    await getData();
  }

  @override
  void initState() {
    super.initState();
    print('initial 1');
    getDataStorage();
    print('initial 2');
  }

  @override
  Widget build(BuildContext context) {
    // final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
    // double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: topNavigationBar(context),
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
