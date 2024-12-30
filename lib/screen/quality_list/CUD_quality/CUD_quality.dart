import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:web_booking/constants/color.dart';
import 'package:web_booking/constants/global.dart';
import 'package:web_booking/constants/style.dart';
import 'package:web_booking/constants/variable.dart';
import 'package:http/http.dart' as http;
import 'package:web_booking/controllers/sidebar_controller.dart';
import 'package:web_booking/model/list_quality/storage_controller/quality_controller.dart';
import 'package:web_booking/page/default/widgets/mainMenu/mainMenu.dart';
import 'package:web_booking/page/signin/controller_signin.dart/info_signin_controller.dart';
import 'package:web_booking/widgets/container/widget_Button.dart';
import 'package:web_booking/widgets/container/widget_ContainerLabel.dart';
import 'package:web_booking/widgets/container/widget_TextField.dart';

class CUD_QualityPage extends StatefulWidget {
  @override
  State<CUD_QualityPage> createState() => _CUD_QualityPageState();
}

class _CUD_QualityPageState extends State<CUD_QualityPage> {
  TextEditingController _input_maChatLuong = TextEditingController();
  TextEditingController _input_tenChatLuong = TextEditingController();
  TextEditingController _input_ghiChu = TextEditingController();

  @override
  void initState() {
    super.initState();
    _input_maChatLuong.text = qualityController.maChatLuong.value;
    _input_tenChatLuong.text = qualityController.tenChatLuong.value;
    _input_ghiChu.text = qualityController.ghiChu.value;
  }

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
              title_CUD_quality!,
              style: style_title_page,
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 5),
            child: WidgetButton(
                text: 'back'.tr,
                style: ElevatedButton.styleFrom(
                  backgroundColor: grey,
                  minimumSize: Size(100, 35),
                ),
                onPressed: () {
                  controller.selectWidget.value = qualityList;
                }),
          ),
          Container(
            decoration: BoxDecoration(
              color: white,
              border: Border.all(color: blue.withOpacity(.4), width: .5),
              boxShadow: [
                BoxShadow(
                    offset: const Offset(0, 6),
                    color: blue.withOpacity(.1),
                    blurRadius: 12)
              ],
              // borderRadius: BorderRadius.circular(8),
              borderRadius: BorderRadius.circular(4),
            ),
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    WidgetContainerLabel(label: 'quality code'.tr, width: 90),
                    Expanded(
                      child: WidgetTextField(
                          controller: _input_maChatLuong, maxLines: 1),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                // TextField(
                //   controller: _input_maChatLuong,
                //   decoration: InputDecoration(
                //       border: OutlineInputBorder(),
                //       hintText: 'quality code'.tr),
                // ),
                // Text('quality name'.tr, style: style12_black),
                Row(
                  children: [
                    WidgetContainerLabel(label: 'quality name'.tr, width: 90),
                    Expanded(
                      child: WidgetTextField(
                          controller: _input_tenChatLuong, maxLines: 1),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                // TextField(
                //   controller: _input_tenChatLuong,
                //   decoration: InputDecoration(
                //       border: OutlineInputBorder(),
                //       hintText: 'quality name'.tr),
                // ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    WidgetContainerLabel(label: 'note'.tr, width: 90),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.all(5),
                        child: TextField(
                          controller: _input_ghiChu,
                          minLines: 1,
                          maxLines: 15,
                          style: style12_black,
                          decoration: const InputDecoration(
                            contentPadding: EdgeInsets.all(10),
                            isDense: true,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                              Radius.circular(0.0),
                            )),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                // TextField(
                //   controller: _input_ghiChu,
                //   minLines: 1,
                //   maxLines: 15,
                //   decoration: InputDecoration(
                //       border: OutlineInputBorder(), hintText: 'note'.tr),
                // ),
                const SizedBox(
                  height: 15,
                ),
                Center(
                  child: WidgetButton(
                      text: text_button_CUD!,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: haian,
                        minimumSize: Size(100, 35),
                      ),
                      onPressed: () {
                        PostCUDQuality(_input_maChatLuong.text,
                            _input_tenChatLuong.text, _input_ghiChu.text);
                      }),
                ),
                // Center(
                //     child: ElevatedButton(
                //         style: ElevatedButton.styleFrom(
                //             backgroundColor: color_button_CUD,
                //             shape: const RoundedRectangleBorder(
                //                 borderRadius:
                //                     BorderRadius.all(Radius.circular(10)))),
                //         onPressed: () {
                //           PostCUDQuality(_input_maChatLuong.text,
                //               _input_tenChatLuong.text, _input_ghiChu.text);
                //         },
                //         child: Container(
                //           padding: EdgeInsets.symmetric(
                //               horizontal: 15, vertical: 10),
                //           child: Text(text_button_CUD!,
                //               style: style_text_box_button),
                //         ))),
                const SizedBox(height: 10)
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<void> PostCUDQuality(String mCL, String tCL, String ghichu) async {
    // final url = '$SERVER/QualityList/Create';
    Map<String, dynamic> data = {
      'id': qualityController.id.value,
      'maChatLuong': mCL,
      'tenChatLuong': tCL,
      'ghichu': ghichu,
      'updateUser': inforUserController.shipperId.value,
    };
    var body = json.encode(data);

    if (CUD == 1) {
      final response = await http.post(Uri.parse(URL_QUALITY!),
          headers: {
            "Access-Control-Allow-Origin": "*",
            "Content-Type": "application/json",
          },
          body: body);
      if (response.statusCode == 200) {
        controller.selectWidget.value = qualityList;
      } else {
        print('Error');
        throw Exception('Error to Create');
      }
    } else if (CUD == 2) {
      final response = await http.put(Uri.parse(URL_QUALITY!),
          headers: {
            "Access-Control-Allow-Origin": "*",
            "Content-Type": "application/json",
          },
          body: body);
      if (response.statusCode == 200) {
        controller.selectWidget.value = qualityList;
      } else {
        print('Error');
        throw Exception('Error to Update');
      }
    } else if (CUD == 3) {
      final response = await http.delete(Uri.parse(URL_QUALITY!), headers: {
        "Access-Control-Allow-Origin": "*",
      });
      if (response.statusCode == 200) {
        controller.selectWidget.value = qualityList;
      } else {
        print('Error');
        throw Exception('Error to Delete');
      }
    } else {
      print('Error');
      throw Exception('Error to CUD');
    }
  }
}
