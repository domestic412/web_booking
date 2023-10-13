import 'package:flutter/material.dart';
import 'package:adaptive_scrollbar/adaptive_scrollbar.dart';
import 'package:go_router/go_router.dart';
import 'package:web_booking/constants/color.dart';
import 'package:web_booking/screen/member/widgets/popup_details.dart';
import 'package:web_booking/screen/member/widgets/searchbox_widget.dart';
import 'package:web_booking/screen/member/widgets/table_detail.dart';
import 'package:web_booking/utils/app_route_config.dart';

class DataTableExample extends StatefulWidget {
  const DataTableExample({super.key});

  @override
  State<DataTableExample> createState() => _DataTableExampleState();
}

class _DataTableExampleState extends State<DataTableExample> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: blue.withOpacity(.4), width: .5),
            boxShadow: [
              BoxShadow(
                  offset: const Offset(0, 6),
                  color: blue.withOpacity(.1),
                  blurRadius: 12)
            ],
            borderRadius: BorderRadius.circular(8),
          ),
          padding: EdgeInsets.all(16),
          margin: EdgeInsets.only(bottom: 16),
          child: SearchWigdet(),
        ),
        TableDetail(),
      ],
    );
  }
}
