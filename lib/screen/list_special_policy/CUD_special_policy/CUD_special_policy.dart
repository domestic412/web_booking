import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:web_booking/constants/color.dart';
import 'package:web_booking/constants/global.dart';
import 'package:web_booking/constants/style.dart';
import 'package:web_booking/constants/variable.dart';
import 'package:http/http.dart' as http;
import 'package:web_booking/screen/home/homepage_screen.dart';

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
    return Container(
      height: deviceHeight(context),
      // margin: EdgeInsets.symmetric(horizontal: 32),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: deviceWidth(context),
              alignment: Alignment.center,
              margin: EdgeInsets.only(top: 32),
              child: Text(
                title_special_policy!,
                style: style_title_page,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 32),
              width: deviceWidth(context),
              alignment: Alignment.centerRight,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: haian,
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)))),
                  onPressed: () {
                    sideBarController.index.value = 8;
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                    child: Text('Quay lại', style: style_text_box_button),
                  )),
            ),
            const SizedBox(
              height: 15,
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
              margin: EdgeInsets.symmetric(horizontal: 32),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Mã Shipper', style: style_text_detail),
                  const SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: _input_code,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(), hintText: 'Mã Shipper'),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text('Shipper (Chủ hàng)', style: style_text_detail),
                  const SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: _input_shipper,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Shipper (Chủ hàng)'),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text('Times (Số lần)', style: style_text_detail),
                  const SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: _input_times,
                    minLines: 1,
                    maxLines: 15,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Times (Số lần)'),
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
      'updateUser': tokenLogin
    };
    var body = json.encode(data);
    if (CUD == 1) {
      final response = await http.post(Uri.parse(URL_SPECIAL_POLICY!),
          headers: {
            "Access-Control-Allow-Origin": "*",
            "Content-Type": "application/json",
            "Authorization": "Bearer $tokenAuthorize",
          },
          body: body);
      if (response.statusCode == 200) {
        sideBarController.index.value = 8;
      } else {
        print('Error');
        throw Exception('Error to Create');
      }
    } else if (CUD == 2) {
      final response =
          await http.delete(Uri.parse(URL_SPECIAL_POLICY!), headers: {
        "Access-Control-Allow-Origin": "*",
        "Authorization": "Bearer $tokenAuthorize",
      });
      if (response.statusCode == 200) {
        sideBarController.index.value = 8;
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
