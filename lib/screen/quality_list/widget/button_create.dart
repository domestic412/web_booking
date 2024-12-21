import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:web_booking/constants/color.dart';
import 'package:web_booking/constants/global.dart';
import 'package:web_booking/constants/variable.dart';
import 'package:web_booking/controllers/sidebar_controller.dart';
import 'package:web_booking/model/list_quality/storage_controller/quality_controller.dart';
import 'package:web_booking/widgets/container/widget_Button.dart';

class ButtonCreate extends StatelessWidget {
  const ButtonCreate({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 5),
      child: WidgetButton(
          text: 'create'.tr,
          style: ElevatedButton.styleFrom(
            backgroundColor: haian,
            minimumSize: Size(100, 35),
          ),
          onPressed: () {
            title_CUD_quality = 'title create quality container'.tr;
            text_button_CUD = 'save'.tr;
            URL_QUALITY = '$SERVER/QualityList/Create';
            color_button_CUD = haian;
            CUD = 1;
            qualityController.updateQualityController(
                id: 0.obs,
                maChatLuong: ''.obs,
                tenChatLuong: ''.obs,
                ghiChu: ''.obs,
                updateUser: ''.obs);
            controller.selectWidget.value = cudQuality;
          }),
    );
  }
}
