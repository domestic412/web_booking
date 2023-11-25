import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:web_booking/constants/color.dart';
import 'package:web_booking/constants/global.dart';
import 'package:web_booking/constants/style.dart';
import 'package:web_booking/constants/variable.dart';
import 'package:http/http.dart' as http;
import 'package:web_booking/screen/home/homepage_screen.dart';
import 'package:web_booking/screen/user_list/CUD_user/widget/code_list.dart';
import 'package:easy_localization/easy_localization.dart';

class CUD_UserPage extends StatefulWidget {
  @override
  State<CUD_UserPage> createState() => _CUD_UserPageState();
}

enum Author {
  admin('admin'),
  user('user');

  const Author(this.label);
  final String? label;
}

class _CUD_UserPageState extends State<CUD_UserPage> {
  TextEditingController _input_maNv = TextEditingController();
  TextEditingController _input_tenNv = TextEditingController();
  TextEditingController _input_matKhau = TextEditingController();
  TextEditingController _input_dienThoai = TextEditingController();
  TextEditingController _input_email = TextEditingController();
  TextEditingController _input_author = TextEditingController();

  Author? selectAuthor;
  bool duplicateError = false;

  String? textError;

  @override
  void initState() {
    super.initState();
    _input_maNv.text = maNV_user ?? '';
    _input_tenNv.text = tenNv_user ?? '';
    _input_dienThoai.text = dienthoai_user ?? '';
    _input_email.text = email_user ?? '';
    _input_author.text = author_user!;
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
                  title_user!,
                  style: style_title_page,
                ),
              ),
              InkWell(
                onTap: () {
                  note_detail_approval.clear();
                  sideBarController.index.value = 15;
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
                    'back'.tr(),
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                            margin: EdgeInsets.only(right: 10),
                            width: 200,
                            child: RichText(
                              text: TextSpan(
                                  text: 'user code'.tr(),
                                  style: style_text_detail,
                                  children: <TextSpan>[
                                    TextSpan(
                                        text: ' (*)', style: style_text_red)
                                  ]),
                            )),
                        CUD == 1
                            ? Expanded(
                                child: TextField(
                                  controller: _input_maNv,
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                      hintText: 'user code'.tr()),
                                ),
                              )
                            : Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: Color(0xFFe8e8ea),
                                  border: Border.all(color: Colors.black26),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Text(
                                  _input_maNv.text,
                                  style: style_text_box,
                                ),
                              ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                            margin: EdgeInsets.only(right: 10),
                            width: 200,
                            child: RichText(
                              text: TextSpan(
                                  text: 'user name'.tr(),
                                  style: style_text_detail,
                                  children: [
                                    TextSpan(
                                        text: ' (*)', style: style_text_red)
                                  ]),
                            )),
                        Expanded(
                          child: TextField(
                            controller: _input_tenNv,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: 'user name'.tr()),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Container(
                            margin: EdgeInsets.only(right: 10),
                            width: 200,
                            child: RichText(
                              text: TextSpan(
                                  text: 'customer code'.tr(),
                                  style: style_text_detail,
                                  children: [
                                    TextSpan(text: '(*)', style: style_text_red)
                                  ]),
                            )),
                        const CodeList()
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CUD == 1
                        ? Container(
                            margin: EdgeInsets.only(bottom: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                    margin: EdgeInsets.only(right: 10),
                                    width: 200,
                                    child: RichText(
                                      text: TextSpan(
                                          text: 'password'.tr(),
                                          style: style_text_detail,
                                          children: [
                                            TextSpan(
                                                text: ' (*)',
                                                style: style_text_red)
                                          ]),
                                    )),
                                Expanded(
                                  child: TextField(
                                    obscureText: true,
                                    controller: _input_matKhau,
                                    decoration: InputDecoration(
                                        border: OutlineInputBorder(),
                                        hintText: 'password'.tr()),
                                  ),
                                ),
                              ],
                            ),
                          )
                        : SizedBox(),
                    CUD == 2
                        ? Container(
                            margin: EdgeInsets.only(bottom: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                    margin: EdgeInsets.only(right: 10),
                                    width: 200,
                                    child: Text('password'.tr(),
                                        style: style_text_detail)),
                                InkWell(
                                  onTap: () {
                                    URL_USER = '$SERVER/User/UpdatePassword';
                                    tittle_change_pw = 'change password'.tr();
                                    sideBarController.index.value = 17;
                                  },
                                  child: Container(
                                    padding: EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        color: Colors.amber[800]),
                                    child: Text('change password'.tr(),
                                        style: style_text_button_detail),
                                  ),
                                ),
                              ],
                            ),
                          )
                        : SizedBox(),
                    Row(
                      children: [
                        Container(
                            margin: EdgeInsets.only(right: 10),
                            width: 200,
                            child:
                                Text('tel no'.tr(), style: style_text_detail)),
                        Expanded(
                          child: TextField(
                            controller: _input_dienThoai,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: 'tel no'.tr()),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Container(
                            margin: EdgeInsets.only(right: 10),
                            width: 200,
                            child:
                                Text('email'.tr(), style: style_text_detail)),
                        Expanded(
                          child: TextField(
                            controller: _input_email,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: 'email'.tr()),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Container(
                            margin: EdgeInsets.only(right: 10),
                            width: 200,
                            child: RichText(
                              text: TextSpan(
                                  text: 'permissions'.tr(),
                                  style: style_text_detail,
                                  children: [
                                    TextSpan(
                                        text: ' (*)', style: style_text_red)
                                  ]),
                            )),
                        DropdownMenu<Author>(
                            controller: _input_author,
                            label: Text('permissions'.tr()),
                            onSelected: (Author? author) {
                              setState(() {
                                selectAuthor = author;
                              });
                            },
                            dropdownMenuEntries: Author.values
                                .map<DropdownMenuEntry<Author>>(
                                    (Author author) {
                              return DropdownMenuEntry<Author>(
                                value: author,
                                label: author.label!,
                              );
                            }).toList())
                      ],
                    ),
                    Center(
                        child: Column(
                      children: [
                        duplicateError == false
                            ? SizedBox(
                                height: 50,
                              )
                            : SizedBox(
                                height: 50,
                                child: Text(textError!,
                                    style: style_text_cntr_detail),
                              ),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: color_button_CUD,
                                shape: const RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)))),
                            onPressed: () {
                              setState(() {
                                duplicateError = false;
                                CUDUser(
                                    id_user!,
                                    _input_maNv.text,
                                    _input_tenNv.text,
                                    codeValue!,
                                    _input_author.text);
                              });
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 10),
                              child: Text(text_button_CUD!,
                                  style: style_text_box_button),
                            )),
                      ],
                    )),
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

  Future<void> CUDUser(
      int id, String manv, String tennv, String code, String author) async {
    if (manv != '' && tennv != '' && code != '' && author != '') {
      Map<String, dynamic> data_create = {
        'id': id,
        'maNv': manv,
        'tenNv': tennv,
        'code': code,
        'matKhau': _input_matKhau.text,
        'dienThoai': _input_dienThoai.text,
        'email': _input_email.text,
        'author': author,
      };
      Map<String, dynamic> data_update = {
        'id': id,
        'maNv': manv,
        'tenNv': tennv,
        'code': code,
        'dienThoai': _input_dienThoai.text,
        'email': _input_email.text,
        'author': author,
      };
      if (CUD == 1 && _input_matKhau.text != '') {
        var body = json.encode(data_create);
        final response = await http.post(Uri.parse(URL_USER!),
            headers: {
              "Access-Control-Allow-Origin": "*",
              "Content-Type": "application/json",
              "Authorization": "Bearer $tokenAuthorize",
            },
            body: body);
        if (response.statusCode == 200) {
          sideBarController.index.value = 15;
        } else if (response.statusCode == 400) {
          setState(() {
            textError = 'error duplicate user'.tr();
            duplicateError = true;
          });
        } else {
          print('Error StatusCode create: ${response.statusCode}');
        }
      } else if (CUD == 2) {
        var body = json.encode(data_update);
        final response = await http.put(Uri.parse(URL_USER!),
            headers: {
              "Access-Control-Allow-Origin": "*",
              "Content-Type": "application/json",
              "Authorization": "Bearer $tokenAuthorize",
            },
            body: body);
        if (response.statusCode == 200) {
          sideBarController.index.value = 15;
        } else {
          print('Error StatusCode update: ${response.statusCode}');
        }
      } else if (CUD == 3) {
        final response = await http.delete(Uri.parse(URL_USER!), headers: {
          "Access-Control-Allow-Origin": "*",
          "Authorization": "Bearer $tokenAuthorize",
        });
        if (response.statusCode == 200) {
          sideBarController.index.value = 15;
        } else {
          print('Error StatusCode delete: ${response.statusCode}');
        }
      } else {
        print('Error CUD == null');
      }
    } else {
      setState(() {
        textError = 'fill info'.tr();
        duplicateError = true;
      });
    }
  }
}
