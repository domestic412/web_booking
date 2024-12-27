import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:web_booking/constants/style.dart';
import 'package:web_booking/screen/approval_list/widget/button_download.dart';
import 'package:web_booking/screen/approval_list/widget/button_special.dart';

import 'data/header_table_approval.dart';

class ApprovalPage extends StatelessWidget {
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
              const ButtonSpecialCustomer()
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          const Expanded(
            child: TableApproval(),
          )
        ],
      ),
    );
  }
}
