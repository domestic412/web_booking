import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:web_booking/constants/variable.dart';

import 'package:web_booking/controllers/sidebar_controller.dart';
import 'package:web_booking/screen/home/widgets/header.dart';
import 'package:web_booking/screen/home/widgets/list_item_drawer.dart';
import 'package:web_booking/widgets/appbar/appbar.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    fullSizeHeight = deviceHeight(context);
    fullSizeWidth = deviceWidth(context);
    return Scaffold(
        // appBar: PreferredSize(
        //   child: AppbarWidget(),
        //   preferredSize: const Size.fromHeight(50),
        // ),
        body: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        appbar(),
        Expanded(
          child: Row(
            children: [
              Drawer(
                backgroundColor: const Color.fromRGBO(9, 34, 126, 1),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      buiderHeader(context),
                      DrawItems(),
                    ],
                  ),
                ),
              ),
              Expanded(
                  child: Obx(() =>
                      controller.changeWidget(controller.selectWidget.value)))
            ],
          ),
        ),
      ],
    ));
  }
}
