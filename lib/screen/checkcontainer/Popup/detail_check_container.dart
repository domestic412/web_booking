import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:web_booking/constants/color.dart';
import 'package:web_booking/constants/text.dart';
import 'package:web_booking/constants/variable.dart';
import 'package:web_booking/widgets/sidebar/select_item.dart';

Future<void> PopUpCheckContainer(BuildContext context) {
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
              title: const Column(
                children: [
                  Text("Thông tin chi tiết"),
                  Divider(
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
                      style: text_Table_small_bold,
                    ),
                    Text(
                      cntrno_CheckCntr.toString(),
                      style: text_Table_small,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Kích cỡ',
                      style: text_Table_small_bold,
                    ),
                    Text(
                      sizeType_CheckCntr.toString(),
                      style: text_Table_small,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Shipper',
                      style: text_Table_small_bold,
                    ),
                    Text(
                      shipper_CheckCntr.toString(),
                      style: text_Table_small,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Remark',
                      style: text_Table_small_bold,
                    ),
                    Text(
                      remark_CheckCntr.toString(),
                      textAlign: TextAlign.left,
                      style: text_Table_small,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Cảnh báo hư hỏng',
                      style: text_Table_small_bold,
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
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Lưu ý sử dụng: mặt hàng được đóng',
                      style: text_Table_small_bold,
                    ),
                    Text(
                      luuYSuDung_CheckCntr.toString(),
                      textAlign: TextAlign.left,
                      style: text_Table_small,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Số lần trong chính sách (kết hợp)',
                      style: text_Table_small_bold,
                    ),
                    Text(
                      soLanKetHop_CheckCntr.toString(),
                      textAlign: TextAlign.left,
                      style: text_Table_small,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    if (approval_CheckCntr != Accept)
                      button()
                    else
                      SizedBox(
                        height: 1,
                      ),
                  ]),
              actions: [
                Column(
                  children: [
                    Divider(
                      color: Colors.black,
                    ),
                    CupertinoDialogAction(
                      child: Text('OK'),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                )
              ],
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
                minimumSize: Size(deviceWidth(context) * 0.6, 40),
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15)))),
            onPressed: () {
              savecntr = cntrno_CheckCntr!;
              selectedItem(context, 2); //select body and appbar Request
              // Navigator.push(
              //     context,
              //     MaterialPageRoute(
              //       builder: (context) => DefaultScreen(),
              //     ));
            },
            child: Text('Xin kết hợp thêm vòng',
                style: TextStyle(fontSize: 14, color: light))));
  }
}
