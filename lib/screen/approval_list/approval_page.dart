import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:web_booking/constants/style.dart';
import 'package:web_booking/constants/variable.dart';
import 'package:web_booking/controllers/date_controller.dart';
import 'package:web_booking/screen/approval_list/widget/button_download.dart';
import 'package:web_booking/screen/approval_list/widget/button_special.dart';

import 'data/header_table_approval.dart';

class ApprovalPage extends StatefulWidget {
  @override
  State<ApprovalPage> createState() => _ApprovalPageState();
}

class _ApprovalPageState extends State<ApprovalPage> {
  @override
  void initState() {
    super.initState();
    dateController.fromDate_send.value =
        changeDatetoSend(date: DateTime.now().subtract(Duration(days: 30)));
    dateController.fromDate_show.value =
        changeDatetoShow(date: DateTime.now().subtract(Duration(days: 30)));
    dateController.toDate_send.value =
        changeDatetoSend(date: DateTime.now().add(Duration(days: 1)));
    dateController.toDate_show.value =
        changeDatetoShow(date: DateTime.now().add(Duration(days: 1)));
  }

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
