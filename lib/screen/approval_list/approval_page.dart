import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:web_booking/constants/color.dart';
import 'package:web_booking/constants/style.dart';
import 'package:web_booking/constants/variable.dart';
import 'package:web_booking/screen/approval_list/widget/button_download.dart';
import 'package:web_booking/screen/approval_list/widget/button_special.dart';

import 'data/header_table_approval.dart';

// ignore: must_be_immutable
class ApprovalPage extends StatefulWidget {
  @override
  State<ApprovalPage> createState() => _ApprovalPageState();
}

class _ApprovalPageState extends State<ApprovalPage> {
  TextEditingController _search_text = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              DownloadButtonApproval(),
              Text(
                "approval list".tr,
                style: style_title_page,
              ),
              ButtonSpecialCustomer()
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Expanded(
            // child: Container(
            //   width: deviceWidth(context),
            //   decoration: BoxDecoration(
            //     color: white,
            //     border: Border.all(color: blue.withOpacity(.4), width: .5),
            //     boxShadow: [
            //       BoxShadow(
            //           offset: const Offset(0, 6),
            //           color: blue.withOpacity(.1),
            //           blurRadius: 12)
            //     ],
            //     borderRadius: BorderRadius.circular(4),
            //   ),
            child: TableApproval(),
            // ),
          )
        ],
      ),
    );
  }
}
