import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:web_booking/constants/style.dart';
import 'package:web_booking/constants/variable.dart';
import 'package:web_booking/controllers/sidebar_controller.dart';

class button_detailRequest extends StatelessWidget {
  const button_detailRequest({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF09227e),
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8)))),
            onPressed: () {
              savecntr = cntrno_DetailRequest!;
              // sideBarController.index.value = 3;
              // controller.changeWidget(SideBarController.sendRequest);
              controller.selectWidget.value = sendRequest;
            },
            child: Container(
              padding: EdgeInsets.all(10),
              child: Text('resend request'.tr, style: style_text_button_detail),
            )));
  }
}
