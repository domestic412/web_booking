import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:web_booking/constants/color.dart';
import 'package:web_booking/constants/style.dart';
import 'package:web_booking/constants/text.dart';
import 'package:web_booking/constants/variable.dart';
import 'package:web_booking/controllers/sidebar_controller.dart';
import 'package:web_booking/model/check_container/storage_controller/check_container_controller.dart';
import 'package:web_booking/widgets/container/widget_Button.dart';

Future<void> PopUpCheckContainer(BuildContext context) {
  return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return SelectionArea(
          child: Center(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Container(
                width: 500,
                child: AlertDialog(
                  backgroundColor: white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  title: Column(
                    children: [
                      Text(
                        "details".tr,
                        style: style_title_detail,
                      ),
                      // const Divider(
                      //   color: Colors.black,
                      //   thickness: 0.5,
                      // )
                    ],
                  ),
                  content: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'cntrno'.tr,
                          style: style12_black_bold,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          checkContainerController.cntrno.value,
                          // cntrno_CheckCntr.toString(),
                          style: style12_red_bold,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          'size'.tr,
                          style: style12_black_bold,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          checkContainerController.sizeType.value,
                          // sizeType_CheckCntr.toString(),
                          style: style12_black,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          'quality'.tr,
                          style: style12_black_bold,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          checkContainerController.quality.value,
                          // sizeType_CheckCntr.toString(),
                          style: style12_black,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          'shipper'.tr,
                          style: style12_black_bold,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          checkContainerController.shipper.value,
                          // shipper_CheckCntr.toString(),
                          style: style12_black,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          'remark'.tr,
                          style: style12_black_bold,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          checkContainerController.remark.value,
                          // remark_CheckCntr.toString(),
                          textAlign: TextAlign.left,
                          style: style12_black,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          'damage warning'.tr,
                          style: style12_black_bold,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        WidgetButton(
                          text: checkContainerController.ghiChuTinhTrang.value,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: red,
                            minimumSize: Size(150, 35),
                          ),
                          onPressed: () {},
                        ),
                        // Container(
                        //   decoration: BoxDecoration(
                        //     color: Colors.red,
                        //     borderRadius: BorderRadius.circular(10),
                        //   ),
                        //   margin: EdgeInsets.only(top: 5),
                        //   padding: const EdgeInsets.symmetric(
                        //       horizontal: 12, vertical: 6),
                        //   child: Text(
                        //     checkContainerController.ghiChuTinhTrang.value,
                        //     // ghiChuTinhTrang_CheckCntr.toString(),
                        //     style: style_text_button_detail,
                        //   ),
                        // ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          'note for use: item is packaged'.tr,
                          style: style12_black_bold,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          checkContainerController.luuYSuDung.value,
                          // luuYSuDung_CheckCntr.toString(),
                          textAlign: TextAlign.left,
                          style: style12_black,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          'number of times (combine)'.tr,
                          style: style12_black_bold,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          checkContainerController.soLanKetHop.value,
                          // soLanKetHop_CheckCntr.toString(),
                          textAlign: TextAlign.left,
                          style: style12_black,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        checkContainerController.approval.value != Accept
                            ? button()
                            : SizedBox(),
                      ]),
                  actions: [
                    Container(
                      margin: EdgeInsets.only(right: 10, bottom: 10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5), color: haian),
                      child: TextButton(
                        onPressed: () => Navigator.pop(context, 'OK'),
                        child: Text(
                          'OK',
                          style: style_text_button_detail,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      });
}

class button extends StatefulWidget {
  @override
  State<button> createState() => _buttonState();
}

class _buttonState extends State<button> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF09227e),
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)))),
            onPressed: () {
              savecntr = checkContainerController.cntrno.value;
              controller.selectWidget.value = sendRequest;
              // Navigator.of(context).pop();
              Get.back();
            },
            child: Container(
                padding: EdgeInsets.all(10),
                child: Text('requests more combine'.tr,
                    style: style_text_box_button))));
  }
}
