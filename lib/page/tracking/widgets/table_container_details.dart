import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:easy_localization/easy_localization.dart';
import 'package:web_booking/constants/color.dart';
import 'package:web_booking/constants/style.dart';
import 'package:web_booking/constants/variable.dart';
import 'package:intl/intl.dart';

// ignore: must_be_immutable
class TableContainerDetails extends StatelessWidget {
  TableContainerDetails({super.key});

  String? _dt;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: 900,
      child: DataTable(
          border: TableBorder.all(),
          columnSpacing: 40,
          columns: [
            DataColumn(
                label: Container(
              width: 30,
              child: Center(
                child: SelectableText(
                  'seq'.tr,
                  style: style_text_Table_small_bold,
                ),
              ),
            )),
            DataColumn(
                label: Container(
              width: 100,
              child: Center(
                child: SelectableText(
                  'container'.tr,
                  style: style_text_Table_small_bold,
                ),
              ),
            )),
            DataColumn(
                label: Container(
              width: 330,
              child: Center(
                child: SelectableText(
                  'status_container'.tr,
                  style: style_text_Table_small_bold,
                ),
              ),
            )),
            DataColumn(
                label: Container(
              width: 120,
              child: Center(
                child: SelectableText(
                  'location_container'.tr,
                  style: style_text_Table_small_bold,
                ),
              ),
            )),
            DataColumn(
                label: Container(
              width: 120,
              child: Center(
                child: SelectableText(
                  'eventDate_container'.tr,
                  style: style_text_Table_small_bold,
                ),
              ),
            ))
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
                  child: SelectableText(
                (index + 1).toString(),
                style: style_text_Table_small,
              ))),
              DataCell(Center(
                  child: SelectableText(
                list_filter![index].container.toString(),
                style: style_text_Table_small,
              ))),
              DataCell(Center(
                child: SelectableText(
                  list_filter![index].status.toString(),
                  style: style_text_Table_small,
                ),
              )),
              DataCell(Center(
                  child: SelectableText(
                list_filter![index].location.toString(),
                style: style_text_Table_small,
              ))),
              DataCell(Center(
                  child: SelectableText(
                '$_dt',
                style: TextStyle(
                  fontSize: 14,
                  color: color_time,
                ),
              )))
            ]);
          })),
    );
  }
}
