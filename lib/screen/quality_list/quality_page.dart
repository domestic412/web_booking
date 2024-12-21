import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:web_booking/constants/style.dart';
import 'widget/button_create.dart';
import 'data/header_table_quality.dart';

// ignore: must_be_immutable
class QualityListPage extends StatefulWidget {
  @override
  State<QualityListPage> createState() => _QualityListPageState();
}

class _QualityListPageState extends State<QualityListPage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Center(
              child: Text(
                "title quality list".tr,
                style: style_title_page,
              ),
            ),
            ButtonCreate(),
            Expanded(child: TableQuality()),
          ]),
    );
  }
}
