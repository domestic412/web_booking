import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:web_booking/model/eqc_quote/storage_controller/init_quote_controller.dart';

class WidgetContainer extends StatelessWidget {
  const WidgetContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('container'.tr),
            SizedBox(
              height: 5,
            ),
            Container(
              width: 200,
              height: 40,
              child: TextField(
                  controller: quoteController.container.value,
                  decoration: const InputDecoration(
                      isDense: true, border: OutlineInputBorder())),
            )
          ],
        ));
  }
}
