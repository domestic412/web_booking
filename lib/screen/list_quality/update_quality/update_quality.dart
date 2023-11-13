import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:web_booking/constants/color.dart';
import 'package:web_booking/constants/global.dart';
import 'package:web_booking/constants/style.dart';
import 'package:web_booking/constants/variable.dart';
import 'package:http/http.dart' as http;
import 'package:web_booking/screen/home/homepage_screen.dart';

class UpdateQualityPage extends StatefulWidget {
  @override
  State<UpdateQualityPage> createState() => _UpdateQualityPageState();
}

class _UpdateQualityPageState extends State<UpdateQualityPage> {
  TextEditingController _input_maChatLuong = TextEditingController();

  TextEditingController _input_tenChatLuong = TextEditingController();

  TextEditingController _input_ghiChu = TextEditingController();

  @override
  void initState() {
    super.initState();
    _input_maChatLuong.text = maChatLuong_quality!;
    _input_tenChatLuong.text = tenChatLuong_quality!;
    _input_ghiChu.text = ghiChu_quality!;
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
                "Update Quality Container",
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
                    sideBarController.index.value = 6;
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
                  Text('Mã chất lượng', style: style_text_detail),
                  const SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: _input_maChatLuong,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Mã chất lượng'),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text('Tên chất lượng', style: style_text_detail),
                  const SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: _input_tenChatLuong,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Tên chất lượng'),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text('Ghi chú', style: style_text_detail),
                  const SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: _input_ghiChu,
                    minLines: 1,
                    maxLines: 15,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(), hintText: 'Ghi chú'),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Center(
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: haian,
                              shape: const RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)))),
                          onPressed: () {},
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 15, vertical: 10),
                            child: Text('Lưu', style: style_text_box_button),
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

  Future<void> PostUpdateQuality(String mCL, String tCL, String ghichu) async {
    final url = '$SERVER/QualityList/Update';
    var data = {
      'maChatLuong': mCL,
      'tenChatLuong': tCL,
      'ghichu': ghichu,
      'updateUser': tokenLogin
    };
    var body = json.encode(data);

    final response = await http.post(Uri.parse(url),
        headers: {
          "Access-Control-Allow-Origin": "*",
          "Access-Control-Allow-Methods": "POST", //use fot http, not use https
          "Authorization": "Bearer $tokenAuthorize",
        },
        body: body);
    if (response.statusCode == 200) {
      sideBarController.index.value = 6;
    } else {
      print('Error');
      throw Exception('Error to Update');
    }
  }
}
