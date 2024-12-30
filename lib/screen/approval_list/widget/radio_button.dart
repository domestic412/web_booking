import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:web_booking/constants/color.dart';
import 'package:web_booking/constants/style.dart';
import 'package:web_booking/model/list_approval/model_send_approval.dart';
import 'package:web_booking/model/list_approval/storage_controller/detail_approval_controller.dart';
import 'package:web_booking/widgets/container/widget_Button.dart';
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
  Color _color = grey;
  bool _showloading = false;
  String? _status;

  @override
  Widget build(BuildContext context) {
    // if (_status == 'A') {
    //   _color = green;
    // } else if (_status == 'R') {
    //   _color = red;
    // } else {
    //   _color = grey;
    // }
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Radio<String>(
              groupValue: _status,
              value: 'A',
              onChanged: (value) {
                setState(() {
                  _status = value;
                  _color = green;
                });
              },
            ),
            Text('agree combine'.tr, style: style12_black),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          children: <Widget>[
            Radio<String>(
              groupValue: _status,
              value: 'R',
              onChanged: (value) {
                setState(() {
                  _status = value;
                  _color = red;
                });
              },
            ),
            Text('reject combine'.tr,
                style: TextStyle(fontSize: 12, color: red)),
          ],
        ),
        // RadioListTile(
        //     title: Text('agree combine'.tr, style: style_text_detail),
        //     value: 'A',
        //     groupValue: _status,
        //     onChanged: (value) {
        //       setState(() {
        //         _status = value.toString();
        //         _color = green;
        //       });
        //     }),
        // RadioListTile(
        //     title: Text(
        //       'reject combine'.tr,
        //       style: TextStyle(fontSize: 16, color: red),
        //     ),
        //     value: 'R',
        //     groupValue: _status,
        //     onChanged: (value) {
        //       setState(() {
        //         _status = value.toString();
        //         _color = red;
        //       });
        //     }),
        const SizedBox(
          height: 40,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            WidgetButton(
                text: 'save'.tr,
                style: ElevatedButton.styleFrom(
                  backgroundColor: _color,
                  minimumSize: Size(100, 35),
                ),
                onPressed: () {
                  _status == null
                      ? print('Please select Radio Button')
                      : setState(() {
                          // print(detailApprovalController.id.value);
                          // print(detailApprovalController.note_controller.text);
                          _sendApproval.fetchSendApproval(
                              _status!,
                              detailApprovalController.id.value,
                              detailApprovalController.note_controller.text);
                          // note_detail_approval.clear();
                          _showloading = true;
                        });
                }),
            // InkWell(
            //   onTap: () {
            //     _status == null
            //         ? print('Please select Radio Button')
            //         : setState(() {
            //             // print(detailApprovalController.id.value);
            //             // print(detailApprovalController.note_controller.text);
            //             _sendApproval.fetchSendApproval(
            //                 _status!,
            //                 detailApprovalController.id.value,
            //                 detailApprovalController.note_controller.text);
            //             // note_detail_approval.clear();
            //             _showloading = true;
            //           });
            //   },
            //   child: Container(
            //     alignment: Alignment.center,
            //     height: 40,
            //     width: 100,
            //     decoration: BoxDecoration(
            //       borderRadius: BorderRadius.circular(10),
            //       color: _color,
            //     ),
            //     child: Text(
            //       'save'.tr,
            //       style: style_text_button_detail,
            //     ),
            //   ),
            // ),
            const SizedBox(
              width: 10,
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

// class LabeledRadio extends StatelessWidget {
//   const LabeledRadio({
//     super.key,
//     required this.label,
//     required this.padding,
//     required this.groupValue,
//     required this.value,
//     required this.onChanged,
//   });

//   final String label;
//   final EdgeInsets padding;
//   final String groupValue;
//   final String value;
//   final ValueChanged<bool> onChanged;

//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: () {
//         if (value != groupValue) {
//           onChanged(value);
//         }
//       },
//       child: Padding(
//         padding: padding,
//         child: Row(
//           children: <Widget>[
//             Radio<bool>(
//               groupValue: groupValue,
//               value: value,
//               onChanged: (bool? newValue) {
//                 onChanged(newValue!);
//               },
//             ),
//             Text(label),
//           ],
//         ),
//       ),
//     );
//   }
// }
