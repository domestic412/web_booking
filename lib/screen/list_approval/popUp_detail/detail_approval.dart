import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:web_booking/constants/color.dart';
import 'package:web_booking/constants/global.dart';
import 'package:web_booking/constants/style.dart';
import 'package:web_booking/constants/variable.dart';
import 'package:intl/intl.dart';
import 'package:web_booking/screen/list_request/popUp_detail/detail_image_list_request.dart';

// final DateTime now = DateTime.now();
List Status = ['A', 'R'];
// String? valueStatus;
TextEditingController _note = TextEditingController();

String _dt_approval = DateFormat("yyyy-MM-dd  hh:mm")
    .format(DateTime.parse(updateTime_ApprovalDetail!));

Future<void> PopUpApproval(BuildContext context) {
  noteHangTau_ApprovalDetail != null
      ? _note.text = noteHangTau_ApprovalDetail!
      : null;
  return showDialog<void>(
      context: context,
      useSafeArea: false,
      builder: (BuildContext context) {
        return Center(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: AlertDialog(
              backgroundColor: Color(0xFFEFEFF4),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              title: Column(
                children: [
                  Text(
                    "Duyệt Yêu Cầu",
                    textAlign: TextAlign.center,
                    style: style_title_detail,
                  ),
                  const Divider(
                    color: Colors.black,
                  )
                ],
              ),
              content: Container(
                width: 630,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Yêu cầu',
                      style: style_text_detail_bold,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text('$tenYeuCau_ApprovalDetail', style: style_text_detail),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Nội dung',
                      style: style_text_detail_bold,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text('$noiDung_ApprovalDetail',
                        textAlign: TextAlign.left, style: style_text_detail),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Container / Size',
                      style: style_text_detail_bold,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    RichText(
                        text: TextSpan(children: <TextSpan>[
                      TextSpan(
                          text: '$cntrno_ApprovalDetail ',
                          style: TextStyle(color: Colors.red, fontSize: 16)),
                      TextSpan(
                          text: '/ $sizeType_ApprovalDetail',
                          style: style_text_detail)
                    ])),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Ngày cập nhật',
                      style: style_text_detail_bold,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(_dt_approval, style: style_text_detail),
                    const SizedBox(
                      height: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Ảnh thực tế',
                          style: style_text_detail_bold,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        const ImageRequest(),
                      ],
                    ),
                    Text(
                      'Ghi chú hãng tàu',
                      style: style_text_detail_bold,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    TextField(
                      controller: _note,
                      textCapitalization: TextCapitalization.sentences,
                      minLines: 1,
                      maxLines: 5,
                      keyboardType: TextInputType.multiline,
                      style:
                          const TextStyle(fontSize: 16, color: Colors.black87),
                      decoration: InputDecoration(
                        hintText: 'Ghi chú hãng tàu',
                        border: const OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        InkWell(
                          onTap: () {
                            _note.clear();
                          },
                          child: Text(
                            'Xóa ghi chú',
                            style: TextStyle(fontSize: 13, color: Colors.blue),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Trạng thái duyệt',
                      style: style_text_detail_bold,
                    ),
                    RadioStatus(),
                  ],
                ),
              ),
            ),
          ),
        );
      });
}

class RadioStatus extends StatefulWidget {
  const RadioStatus({
    Key? key,
  }) : super(key: key);

  @override
  State<RadioStatus> createState() => _RadioStatusState();
}

class _RadioStatusState extends State<RadioStatus> {
  Color? _color;
  String status = trangThaiYc_ApprovalDetail.toString();
  @override
  Widget build(BuildContext context) {
    if (status == 'A') {
      _color = green;
    } else if (status == 'R') {
      _color = red;
    } else {
      _color = grey;
    }
    return Column(
      children: <Widget>[
        RadioListTile(
            title: Text('Đồng ý kết hợp', style: style_text_detail),
            value: 'A',
            groupValue: status,
            onChanged: (value) {
              setState(() {
                status = value.toString();
                _color = green;
              });
            }),
        RadioListTile(
            title: Text(
              'Từ chối kết hợp',
              style: TextStyle(fontSize: 16, color: red),
            ),
            value: 'R',
            groupValue: status,
            onChanged: (value) {
              setState(() {
                status = value.toString();
                _color = red;
              });
            }),
        const SizedBox(
          height: 40,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {
                fetchRequestAdmin(status);
                _note.clear();
              },
              child: Container(
                alignment: Alignment.center,
                height: 40,
                width: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: _color,
                ),
                child: Text(
                  'Lưu',
                  style: style_text_button_detail,
                ),
              ),
            ),
            SizedBox(
              width: 30,
            ),
            InkWell(
              onTap: () {
                _note.clear();
                Navigator.of(context).pop();
              },
              child: Container(
                alignment: Alignment.center,
                height: 40,
                width: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: grey,
                ),
                child: Text(
                  'Quay lại',
                  style: style_text_button_detail,
                ),
              ),
            )
          ],
        )
      ],
    );
  }

  Future<void> fetchRequestAdmin(String statuss) async {
    var url = '$SERVER/Requests/Process?Trangthai=$statuss';
    var data = {
      'id': id_ApprovalDetail,
      'noteHangTau': _note.text,
      'userXuly': user,
    };
    // print(data);
    var body = json.encode(data);
    final response = await http.post(Uri.parse(url),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $tokenAuthorize",
        },
        body: body);
    Navigator.pop(context);
    if (response.statusCode == 200) {
      setState(() {});
    } else {
      throw Exception('Error');
    }
  }
}
