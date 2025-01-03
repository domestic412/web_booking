import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:web_booking/constants/color.dart';
import 'package:web_booking/screen/approval_list/widget/popup_showSpecial.dart';
import 'package:web_booking/widgets/container/widget_Button.dart';

class ButtonSpecialCustomer extends StatelessWidget {
  const ButtonSpecialCustomer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // PopupMenuButton(
        //   tooltip: '',
        //   child: Text('policy'.tr),
        //   itemBuilder: itemBuilder,
        //   ),
        WidgetButton(
          text: 'Policy',
          style: ElevatedButton.styleFrom(
            backgroundColor: haian,
            minimumSize: Size(100, 35),
          ),
          onPressed: () async {
            showSpecialList(context);
          },
        ),
        // ElevatedButton(
        //   onPressed: () async {
        //     showSpecialList(context);
        //   },
        //   style: ButtonStyle(
        //       backgroundColor: WidgetStatePropertyAll<Color>(haian),
        //       minimumSize: WidgetStateProperty.all(Size(100, 40))),
        //   child: Text('Special List'),
        // ),
        // const SizedBox(
        //   height: 10,
        // ),
      ],
    );
  }
}
