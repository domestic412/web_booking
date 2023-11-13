import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:web_booking/constants/color.dart';
import 'package:web_booking/constants/style.dart';
import 'package:web_booking/constants/variable.dart';
import 'package:web_booking/controllers/sidebar_controller.dart';
import 'package:web_booking/model/list_quality/model_list_quality.dart';
import 'package:intl/intl.dart';
import 'package:web_booking/screen/home/homepage_screen.dart';

// ignore: must_be_immutable
class ListQualityPage extends StatefulWidget {
  @override
  State<ListQualityPage> createState() => _ListQualityPageState();
}

class _ListQualityPageState extends State<ListQualityPage> {
  @override
  Widget build(BuildContext context) {
    return DataListQuality();
  }

  FutureBuilder<List<ListQuality>> DataListQuality() {
    return FutureBuilder<List<ListQuality>>(
      future: ListQuality().fetchListQuality(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasData) {
          print('show data list quality');
          return SizedBox(
            // use sizedbox to content always start on top
            height: deviceHeight(context),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      width: deviceWidth(context),
                      alignment: Alignment.center,
                      padding: const EdgeInsets.only(top: 32),
                      child: Text(
                        "List Quality",
                        style: style_title_page,
                      ),
                    ),
                    Container(
                        // decoration: BoxDecoration(
                        //   color: white,
                        //   border:
                        //       Border.all(color: blue.withOpacity(.4), width: .5),
                        //   boxShadow: [
                        //     BoxShadow(
                        //         offset: const Offset(0, 6),
                        //         color: blue.withOpacity(.1),
                        //         blurRadius: 12)
                        //   ],
                        //   borderRadius: BorderRadius.circular(8),
                        // ),
                        padding: const EdgeInsets.all(16),
                        margin: const EdgeInsets.symmetric(horizontal: 16),
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: haian,
                                shape: const RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)))),
                            onPressed: () {
                              sideBarController.index.value = 7;
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 10),
                              child:
                                  Text('Create', style: style_text_box_button),
                            ))),
                    Container(
                      width: deviceWidth(context),
                      decoration: BoxDecoration(
                        color: white,
                        border:
                            Border.all(color: blue.withOpacity(.4), width: .5),
                        boxShadow: [
                          BoxShadow(
                              offset: const Offset(0, 6),
                              color: blue.withOpacity(.1),
                              blurRadius: 12)
                        ],
                        borderRadius: BorderRadius.circular(8),
                      ),
                      margin: const EdgeInsets.only(
                          bottom: 16, left: 32, right: 32),
                      child: DataTable(
                          border: const TableBorder(
                              verticalInside:
                                  BorderSide(color: Colors.black12)),
                          sortColumnIndex: 0,
                          // sortAscending: true,
                          dataRowMaxHeight: 90,
                          columnSpacing: 20,
                          columns: [
                            DataColumn(
                              label: Container(
                                width: 35,
                                child: Text(
                                  'STT',
                                  style: style_text_Table_small_bold,
                                ),
                              ),
                            ),
                            DataColumn(
                              label: Container(
                                width: 100,
                                child: Center(
                                    child: Text(
                                  'Mã chất lượng',
                                  style: style_text_Table_small_bold,
                                )),
                              ),
                            ),
                            DataColumn(
                              label: Container(
                                width: 120,
                                child: Center(
                                    child: Text('Tên chất lượng',
                                        style: style_text_Table_small_bold)),
                              ),
                            ),
                            DataColumn(
                              label: Expanded(
                                  child: Center(
                                      child: Text(
                                'Ghi chú',
                                style: style_text_Table_small_bold,
                              ))),
                            ),
                            DataColumn(
                              label: Container(
                                width: 110,
                                child: Center(
                                    child: Text(
                                  'Ngày cập nhật',
                                  style: style_text_Table_small_bold,
                                )),
                              ),
                            ),
                            DataColumn(
                              label: Container(
                                width: 100,
                                child: Center(
                                    child: Text(
                                  'Người cập nhật',
                                  style: style_text_Table_small_bold,
                                )),
                              ),
                            ),
                            DataColumn(
                              label: Container(
                                width: 60,
                                child: Center(
                                  child: InkWell(
                                    onTap: () {
                                      setState(() {});
                                    },
                                    child: Center(
                                        child: Text('###',
                                            style:
                                                style_text_Table_small_bold)),
                                  ),
                                ),
                              ),
                            ),
                          ],
                          rows: List.generate(snapshot.data!.length, (index) {
                            var data = snapshot.data![index];
                            String _dt = DateFormat("yyyy-MM-dd\nhh:mm")
                                .format(DateTime.parse(data.updateTime!));
                            return DataRow(cells: [
                              DataCell(Text(
                                ' ' + (index + 1).toString(),
                                style: style_text_Table_small,
                              )),
                              DataCell(Center(
                                  child: SelectableText(
                                      data.maChatLuong.toString(),
                                      style: style_text_Table_small))),
                              DataCell(SelectableText(
                                  data.tenChatLuong.toString(),
                                  style: style_text_Table_small)),
                              DataCell(Center(
                                  child: SelectableText(data.ghiChu.toString(),
                                      style: style_text_Table_small))),
                              DataCell(Center(
                                  child: SelectableText(_dt,
                                      style: style_text_Table_small))),
                              DataCell(Center(
                                  child: SelectableText(
                                      data.updateUser.toString(),
                                      style: style_text_Table_small))),
                              DataCell(Center(
                                  child: Row(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      maChatLuong_quality =
                                          snapshot.data![index].maChatLuong;
                                      tenChatLuong_quality =
                                          snapshot.data![index].tenChatLuong;
                                      ghiChu_quality =
                                          snapshot.data![index].ghiChu;
                                      sideBarController.index.value = 8;
                                    },
                                    child: const Tooltip(
                                      message: 'Sửa',
                                      child: Icon(
                                        Icons.drive_file_rename_outline_sharp,
                                        size: 20,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      // sideBarController.index.value = 8;
                                    },
                                    child: const Tooltip(
                                      message: 'Xóa',
                                      child: Icon(
                                        Icons.delete,
                                        size: 20,
                                      ),
                                    ),
                                  )
                                ],
                              ))),
                            ]);
                          })),
                    ),
                  ]),
            ),
          );
        }
        return Text('');
      },
    );
  }
}
