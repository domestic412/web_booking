import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:web_booking/constants/color.dart';
import 'package:web_booking/constants/style.dart';
import 'package:web_booking/constants/text.dart';
import 'package:web_booking/constants/variable.dart';
import 'package:web_booking/screen/home/homepage_screen.dart';
import 'package:web_booking/screen/widgets/list_item.dart';

Future<void> PopUpCheckContainer(BuildContext context) {
  return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return Center(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Container(
              width: 500,
              child: AlertDialog(
                backgroundColor: Color(0xFFEFEFF4),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                title: Column(
                  children: [
                    Text(
                      "Thông tin chi tiết",
                      style: style_title_detail,
                    ),
                    const Divider(
                      color: Colors.black,
                    )
                  ],
                ),
                content: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Số Container',
                        style: style_text_detail_bold,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        cntrno_CheckCntr.toString(),
                        style: style_text_detail,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Kích cỡ',
                        style: style_text_detail_bold,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        sizeType_CheckCntr.toString(),
                        style: style_text_detail,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Shipper',
                        style: style_text_detail_bold,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        shipper_CheckCntr.toString(),
                        style: style_text_detail,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Remark',
                        style: style_text_detail_bold,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        remark_CheckCntr.toString(),
                        textAlign: TextAlign.left,
                        style: style_text_detail,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Cảnh báo hư hỏng',
                        style: style_text_detail_bold,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        margin: EdgeInsets.only(top: 5),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 6),
                        child: Text(
                          ghiChuTinhTrang_CheckCntr.toString(),
                          style: style_text_button_detail,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Lưu ý sử dụng: mặt hàng được đóng',
                        style: style_text_detail_bold,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        luuYSuDung_CheckCntr.toString(),
                        textAlign: TextAlign.left,
                        style: style_text_detail,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Số lần trong chính sách (kết hợp)',
                        style: style_text_detail_bold,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        soLanKetHop_CheckCntr.toString(),
                        textAlign: TextAlign.left,
                        style: style_text_detail,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      approval_CheckCntr != Accept ? button() : SizedBox(),
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
              savecntr = cntrno_CheckCntr!;
              sideBarController.index.value = 2;
              Navigator.of(context).pop();
            },
            child: Container(
                padding: EdgeInsets.all(10),
                child: Text('Xin kết hợp thêm vòng',
                    style: style_text_box_button))));
  }
}
