import 'package:flutter/material.dart';
import 'package:web_booking/constants/color.dart';
import 'package:web_booking/screen/approval_list/widget/popup_showSpecial.dart';

class ButtonSpecialCustomer extends StatelessWidget {
  const ButtonSpecialCustomer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: () async {
            showSpecialList(context);
          },
          style: ButtonStyle(
              backgroundColor: MaterialStatePropertyAll<Color>(haian),
              minimumSize: MaterialStateProperty.all(Size(100, 40))),
          child: Text('Special List'),
        ),
        SizedBox(
          height: 10,
        ),
        // isExport == true ? dateDownload(context) : SizedBox.shrink(),
      ],
    );
  }
}
