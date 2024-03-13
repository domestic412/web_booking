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
import 'package:web_booking/page/signin/controller_signin.dart/info_signin_controller.dart';

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
    // maChatLuong_quality!;
    _input_tenChatLuong.text = qualityController.tenChatLuong.value;
    // tenChatLuong_quality!;
    _input_ghiChu.text = qualityController.ghiChu.value;
    // ghiChu_quality!;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: deviceHeight(context),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: deviceWidth(context),
                alignment: Alignment.center,
                child: Text(
                  title_CUD_quality!,
                  style: style_title_page,
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 16),
                child: InkWell(
                  onTap: () {
                    controller.selectWidget.value = qualityList;
                  },
                  child: Container(
                    alignment: Alignment.center,
                    height: 35,
                    width: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: grey,
                    ),
                    child: Text(
                      'back'.tr,
                      style: style_text_button_detail,
                    ),
                  ),
                ),
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
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: const EdgeInsets.all(16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('quality code'.tr, style: style_text_detail),
                    const SizedBox(
                      height: 10,
                    ),
                    TextField(
                      controller: _input_maChatLuong,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'quality code'.tr),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text('quality name'.tr, style: style_text_detail),
                    const SizedBox(
                      height: 10,
                    ),
                    TextField(
                      controller: _input_tenChatLuong,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'quality name'.tr),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text('note'.tr, style: style_text_detail),
                    const SizedBox(
                      height: 10,
                    ),
                    TextField(
                      controller: _input_ghiChu,
                      minLines: 1,
                      maxLines: 15,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(), hintText: 'note'.tr),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    Center(
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: color_button_CUD,
                                shape: const RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)))),
                            onPressed: () {
                              PostCUDQuality(_input_maChatLuong.text,
                                  _input_tenChatLuong.text, _input_ghiChu.text);
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 10),
                              child: Text(text_button_CUD!,
                                  style: style_text_box_button),
                            ))),
                    const SizedBox(height: 20)
                  ],
                ),
              ),
            ],
          ),
        ),
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
      'updateUser': inforUserController.tenNV.value,
    };
    var body = json.encode(data);

    if (CUD == 1) {
      final response = await http.post(Uri.parse(URL_QUALITY!),
          headers: {
            "Access-Control-Allow-Origin": "*",
            "Content-Type": "application/json",
            "Authorization": "Bearer ${inforUserController.authorize.value}",
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
            "Authorization": "Bearer ${inforUserController.authorize.value}",
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
        "Authorization": "Bearer ${inforUserController.authorize.value}",
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
