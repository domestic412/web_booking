import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:web_booking/constants/color.dart';
import 'package:web_booking/constants/style.dart';
import 'package:web_booking/constants/variable.dart';
import 'package:web_booking/model/list_approval/model_send_approval.dart';
import 'package:web_booking/page/signin/controller_signin.dart/info_signin_controller.dart';
import 'package:web_booking/screen/approval_list/controller_detail_approval/data_detail_approval_controller.dart';
// import 'package:easy_localization/easy_localization.dart';

class RadioButton extends StatefulWidget {
  const RadioButton({
    Key? key,
  }) : super(key: key);

  @override
  State<RadioButton> createState() => _RadioButtonState();
}

class _RadioButtonState extends State<RadioButton> {
  SendApproval _sendApproval = SendApproval();
  Color? _color;
  String _status = dataDetailApprovalController.trangThaiYc.value;
  bool _showloading = false;

  @override
  Widget build(BuildContext context) {
    if (_status == 'A') {
      _color = green;
    } else if (_status == 'R') {
      _color = red;
    } else {
      _color = grey;
    }
    return Column(
      children: <Widget>[
        RadioListTile(
            title: Text('agree combine'.tr, style: style_text_detail),
            value: 'A',
            groupValue: _status,
            onChanged: (value) {
              setState(() {
                _status = value.toString();
                _color = green;
              });
            }),
        RadioListTile(
            title: Text(
              'reject combine'.tr,
              style: TextStyle(fontSize: 16, color: red),
            ),
            value: 'R',
            groupValue: _status,
            onChanged: (value) {
              setState(() {
                _status = value.toString();
                _color = red;
              });
            }),
        const SizedBox(
          height: 40,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {
                setState(() {
                  print(dataDetailApprovalController.id.value);
                  print(dataDetailApprovalController.note_controller.text);
                  print(informationController.authorize.value);
                  _sendApproval.fetchSendApproval(
                      _status,
                      dataDetailApprovalController.id.value,
                      dataDetailApprovalController.note_controller.text);
                  // note_detail_approval.clear();
                  _showloading = true;
                });
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
                  'save'.tr,
                  style: style_text_button_detail,
                ),
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            _showloading == true
                ? const CircularProgressIndicator()
                : const SizedBox()
          ],
        )
      ],
    );
  }
}
