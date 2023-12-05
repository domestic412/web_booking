import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:web_booking/constants/color.dart';
import 'package:web_booking/constants/global.dart';
import 'package:web_booking/constants/style.dart';
import 'package:web_booking/constants/variable.dart';
import 'package:http/http.dart' as http;
import 'package:web_booking/controllers/sidebar_controller.dart';
import 'package:web_booking/page/signin/controller_signin.dart/info_signin_controller.dart';

class CUD_SpecialPolicyPage extends StatefulWidget {
  @override
  State<CUD_SpecialPolicyPage> createState() => _CUD_SpecialPolicyPageState();
}

class _CUD_SpecialPolicyPageState extends State<CUD_SpecialPolicyPage> {
  TextEditingController _input_code = TextEditingController();

  TextEditingController _input_shipper = TextEditingController();

  TextEditingController _input_times = TextEditingController();

  @override
  void initState() {
    super.initState();
    _input_code.text = code_policy!;
    _input_shipper.text = shipper_policy!;
    _input_times.text = times_policy!;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: deviceHeight(context),
      // margin: EdgeInsets.symmetric(horizontal: 32),
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
                  title_CUD_special_policy!,
                  style: style_title_page,
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 16),
                child: InkWell(
                  onTap: () {
                    controller.selectWidget.value = specialPolicyList;
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
                    Text('shipper code'.tr, style: style_text_detail),
                    const SizedBox(
                      height: 10,
                    ),
                    TextField(
                      controller: _input_code,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'shipper code'.tr),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text('shipper (owner)'.tr, style: style_text_detail),
                    const SizedBox(
                      height: 10,
                    ),
                    TextField(
                      controller: _input_shipper,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'shipper (owner)'.tr),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text('times'.tr, style: style_text_detail),
                    const SizedBox(
                      height: 10,
                    ),
                    TextField(
                      controller: _input_times,
                      minLines: 1,
                      maxLines: 15,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(), hintText: 'times'.tr),
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
                              PostCUDSpecialPolicy(_input_code.text,
                                  _input_shipper.text, _input_times.text);
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

  Future<void> PostCUDSpecialPolicy(
      String code, String shipper, String times) async {
    // final url = '$SERVER/SpecialPolicy/Create';
    var data = {
      'id': id_policy,
      'code': code,
      'shipper': shipper,
      'times': times,
      'updateUser': informationController.tenNV.value
    };
    var body = json.encode(data);
    if (CUD == 1) {
      final response = await http.post(Uri.parse(URL_SPECIAL_POLICY!),
          headers: {
            "Access-Control-Allow-Origin": "*",
            "Content-Type": "application/json",
            "Authorization": "Bearer ${informationController.authorize.value}",
          },
          body: body);
      if (response.statusCode == 200) {
        // sideBarController.index.value = 8;
        // controller.changeWidget(SideBarController.specialPolicyList);
        controller.selectWidget.value = specialPolicyList;
      } else {
        print('Error');
        throw Exception('Error to Create');
      }
    } else if (CUD == 2) {
      final response = await http.put(Uri.parse(URL_SPECIAL_POLICY!),
          headers: {
            "Access-Control-Allow-Origin": "*",
            "Content-Type": "application/json",
            "Authorization": "Bearer ${informationController.authorize.value}",
          },
          body: body);
      if (response.statusCode == 200) {
        // sideBarController.index.value = 8;
        // controller.changeWidget(SideBarController.specialPolicyList);
        controller.selectWidget.value = specialPolicyList;
      } else {
        print('Error');
        throw Exception('Error to Update');
      }
    } else if (CUD == 3) {
      final response =
          await http.delete(Uri.parse(URL_SPECIAL_POLICY!), headers: {
        "Access-Control-Allow-Origin": "*",
        "Authorization": "Bearer ${informationController.authorize.value}",
      });
      if (response.statusCode == 200) {
        // sideBarController.index.value = 8;
        // controller.changeWidget(SideBarController.specialPolicyList);
        controller.selectWidget.value = specialPolicyList;
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
