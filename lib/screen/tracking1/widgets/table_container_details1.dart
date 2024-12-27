import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:easy_localization/easy_localization.dart';
import 'package:web_booking/constants/color.dart';
import 'package:web_booking/constants/style.dart';
import 'package:web_booking/constants/variable.dart';
import 'package:intl/intl.dart';

// ignore: must_be_immutable
class TableContainerDetails1 extends StatelessWidget {
  TableContainerDetails1({super.key});

  String? _dt;

  @override
  Widget build(BuildContext context) {
    return DataTable(
        headingRowColor:
            MaterialStateProperty.resolveWith((states) => lightGrey),
        border: const TableBorder(
            verticalInside: BorderSide(color: Colors.black12)),
        sortColumnIndex: 0,
        dataRowMaxHeight: 70,
        columnSpacing: 30,
        columns: [
          DataColumn(
              label: Expanded(
                  child: Center(
            child: Text(
              'seq'.tr,
              style: style_text_Table_small_bold,
            ),
          ))),
          DataColumn(
              label: Expanded(
                  child: Center(
            child: Text(
              'cntrno'.tr,
              style: style_text_Table_small_bold,
            ),
          ))),
          DataColumn(
              label: Expanded(
                  child: Center(
            child: Text(
              'status_container'.tr,
              style: style_text_Table_small_bold,
            ),
          ))),
          DataColumn(
              label: Expanded(
                  child: Center(
            child: Text(
              'location_container'.tr,
              style: style_text_Table_small_bold,
            ),
          ))),
          DataColumn(
              label: Expanded(
                  child: Center(
            child: Text(
              'eventDate_container'.tr,
              style: style_text_Table_small_bold,
            ),
          )))
        ],
        rows: List.generate(list_filter!.length, (index) {
          if (list_filter![index].eventDate != null) {
            _dt = DateFormat("yyyy-MM-dd  hh:mm")
                .format(DateTime.parse(list_filter![index].eventDate));
            var dt =
                DateTime.tryParse(list_filter![index].eventDate.toString());
            if (dt!.compareTo(DateTime.now()) < 0) {
              color_time = normalColor;
            } else {
              color_time = Colors.black;
            }
          } else {
            _dt = '';
          }
          return DataRow(cells: [
            DataCell(Center(
                child: Text(
              (index + 1).toString(),
              style: style_text_table_small_tracking,
            ))),
            DataCell(Center(
                child: Text(
              list_filter![index].container.toString(),
              style: style_text_table_small_tracking,
            ))),
            DataCell(Center(
              child: Text(
                list_filter![index].status.toString(),
                style: style_text_table_small_tracking,
              ),
            )),
            DataCell(Center(
                child: Text(
              list_filter![index].location.toString(),
              style: style_text_table_small_tracking,
            ))),
            DataCell(Center(
                child: Text(
              '$_dt',
              style: TextStyle(
                fontSize: 15,
                color: color_time,
              ),
            )))
          ]);
        }));
  }
}
