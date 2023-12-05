import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:web_booking/constants/color.dart';
import 'package:web_booking/constants/global.dart';
import 'package:web_booking/constants/style.dart';
import 'package:web_booking/constants/variable.dart';
import 'package:http/http.dart' as http;
import 'package:web_booking/controllers/sidebar_controller.dart';
import 'package:web_booking/model/list_user/storage_controller/user_controller.dart';
import 'package:web_booking/page/signin/controller_signin.dart/info_signin_controller.dart';
// import 'package:web_booking/screen/home/homepage_screen.dart';
// import 'package:easy_localization/easy_localization.dart';

class ChangePassword_UserPage extends StatefulWidget {
  @override
  State<ChangePassword_UserPage> createState() =>
      _ChangePassword_UserPageState();
}

class _ChangePassword_UserPageState extends State<ChangePassword_UserPage> {
  TextEditingController _input_matKhau = TextEditingController();

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
                  tittle_change_pw!,
                  style: style_title_page,
                ),
              ),
              InkWell(
                onTap: () {
                  controller.selectWidget.value = userList;
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
                margin: EdgeInsets.only(top: 16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      text: TextSpan(
                          text: 'user code'.tr,
                          style: style_text_detail,
                          children: <TextSpan>[
                            TextSpan(text: ' (*)', style: style_text_red)
                          ]),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10, bottom: 20),
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Color(0xFFe8e8ea),
                        border: Border.all(color: Colors.black26),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Text(
                        userController.maNv.value,
                        style: style_text_box,
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RichText(
                          text: TextSpan(
                              text: 'password'.tr,
                              style: style_text_detail,
                              children: [
                                TextSpan(text: ' (*)', style: style_text_red)
                              ]),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextField(
                          controller: _input_matKhau,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: 'password'.tr),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                      ],
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
                              ChangePasswordUser(
                                userController.id.value,
                                _input_matKhau.text,
                              );
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 10),
                              child: Text('update'.tr,
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

  Future<void> ChangePasswordUser(int id, String password) async {
    if (password != '') {
      Map<String, dynamic> data = {
        'id': id,
        'matKhau': password,
      };
      var body = json.encode(data);
      final response = await http.put(Uri.parse(URL_USER!),
          headers: {
            "Access-Control-Allow-Origin": "*",
            "Content-Type": "application/json",
            "Authorization": "Bearer ${informationController.authorize.value}",
          },
          body: body);
      if (response.statusCode == 200) {
        controller.selectWidget.value = userList;
      } else {
        print('Error');
        throw Exception('Error to Create');
      }
    } else {
      throw Exception('Password Null');
    }
  }
}
