import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:web_booking/constants/color.dart';
import 'package:web_booking/constants/style.dart';
import 'package:web_booking/constants/variable.dart';
import 'package:web_booking/controllers/sidebar_controller.dart';
import 'package:web_booking/screen/container_stock/data/header_table_container_stock.dart';
import 'package:web_booking/widgets/container/widget_Button.dart';

class ContainerStockPage extends StatefulWidget {
  @override
  State<ContainerStockPage> createState() => _ContainerStockPageState();
}

class _ContainerStockPageState extends State<ContainerStockPage> {
  TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                'title container stock'.tr,
                style: style_title_page,
                textAlign: TextAlign.center,
              ),
            ),
            WidgetButton(
              text: 'Import File Excel',
              style: ElevatedButton.styleFrom(
                backgroundColor: haian,
                minimumSize: Size(100, 35),
              ),
              onPressed: () {
                controller.selectWidget.value = importStock;
              },
            ),
            // InkWell(
            //   onTap: () {
            //     controller.selectWidget.value = importStock;
            //   },
            //   child: Container(
            //     padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            //     decoration: BoxDecoration(
            //         color: haian, borderRadius: BorderRadius.circular(8)),
            //     child: Text(
            //       'Import File Excel',
            //       style: style_text_box_button_small,
            //     ),
            //   ),
            // ),
            const SizedBox(
              height: 5,
            ),
            const Expanded(
              child: TableContainerStock(),
            )
          ]),
    );
  }
}
