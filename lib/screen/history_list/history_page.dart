import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:web_booking/constants/style.dart';
import 'package:web_booking/screen/approval_list/widget/button_special.dart';

import 'data/header_table_history.dart';
import 'widget/button_download.dart';
// import 'package:easy_localization/easy_localization.dart';

// ignore: must_be_immutable
class HistoryPage extends StatefulWidget {
  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                DownloadButtonHistory(),
                Center(
                  child: Text(
                    "title history list".tr,
                    style: style_title_page,
                  ),
                ),
                ButtonSpecialCustomer(),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            const Expanded(
              child: TableHistory(),
            )
          ]),
    );
  }
}
