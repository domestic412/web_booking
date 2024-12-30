import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:web_booking/constants/style.dart';
import 'package:web_booking/screen/request_list/data/header_table_request_list.dart';
// import 'package:easy_localization/easy_localization.dart';

// ignore: must_be_immutable
class RequestListPage extends StatefulWidget {
  @override
  State<RequestListPage> createState() => _RequestListPageState();
}

class _RequestListPageState extends State<RequestListPage> {
  TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Center(
            child: Text(
              "request list".tr,
              style: style_title_page,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          const Expanded(
            child: TableRequestList(),
          )
        ],
      ),
    );
  }
}
