import 'package:flutter/material.dart';
import 'package:web_booking/constants/color.dart';
import 'package:web_booking/constants/global.dart';
import 'package:web_booking/constants/style.dart';
import 'package:web_booking/constants/variable.dart';
import 'package:web_booking/model/list_quality/model_quality_list.dart';
import 'package:intl/intl.dart';
import 'package:web_booking/screen/home/homepage_screen.dart';
import 'package:easy_localization/easy_localization.dart';

// ignore: must_be_immutable
class QualityListPage extends StatefulWidget {
  @override
  State<QualityListPage> createState() => _QualityListPageState();
}

class _QualityListPageState extends State<QualityListPage> {
  @override
  Widget build(BuildContext context) {
    return DataQualityList();
  }

  FutureBuilder<List<QualityList>> DataQualityList() {
    return FutureBuilder<List<QualityList>>(
      future: QualityList().fetchQualityList(),
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
              child: Padding(
                padding: const EdgeInsets.all(32.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        width: deviceWidth(context),
                        alignment: Alignment.center,
                        child: Text(
                          "title quality list".tr(),
                          style: style_title_page,
                        ),
                      ),
                      Container(
                          margin: EdgeInsets.only(bottom: 16),
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: haian,
                                  shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10)))),
                              onPressed: () {
                                maChatLuong_quality = '';
                                tenChatLuong_quality = '';
                                ghiChu_quality = '';
                                id_quality = 0;
                                title_CUD_quality =
                                    'title create quality container'.tr();
                                text_button_CUD = 'save'.tr();
                                URL_QUALITY = '$SERVER/QualityList/Create';
                                color_button_CUD = haian;
                                CUD = 1;
                                sideBarController.index.value = 7;
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 10),
                                child: Text('create'.tr(),
                                    style: style_text_box_button),
                              ))),
                      Container(
                        width: deviceWidth(context),
                        decoration: BoxDecoration(
                          color: white,
                          border: Border.all(
                              color: blue.withOpacity(.4), width: .5),
                          boxShadow: [
                            BoxShadow(
                                offset: const Offset(0, 6),
                                color: blue.withOpacity(.1),
                                blurRadius: 12)
                          ],
                          borderRadius: BorderRadius.circular(8),
                        ),
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
                                    'seq'.tr(),
                                    style: style_text_Table_small_bold,
                                  ),
                                ),
                              ),
                              DataColumn(
                                label: Container(
                                  width: 100,
                                  child: Center(
                                      child: Text(
                                    'quality code'.tr(),
                                    style: style_text_Table_small_bold,
                                  )),
                                ),
                              ),
                              DataColumn(
                                label: Container(
                                  width: 120,
                                  child: Center(
                                      child: Text('quality name'.tr(),
                                          style: style_text_Table_small_bold)),
                                ),
                              ),
                              DataColumn(
                                label: Expanded(
                                    child: Center(
                                        child: Text(
                                  'note'.tr(),
                                  style: style_text_Table_small_bold,
                                ))),
                              ),
                              DataColumn(
                                label: Container(
                                  width: 110,
                                  child: Center(
                                      child: Text(
                                    'update time'.tr(),
                                    style: style_text_Table_small_bold,
                                  )),
                                ),
                              ),
                              DataColumn(
                                label: Container(
                                  width: 100,
                                  child: Center(
                                      child: Text(
                                    'updater'.tr(),
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
                                    child: SelectableText(
                                        data.ghiChu.toString(),
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
                                        title_CUD_quality =
                                            'title adjust quality container'
                                                .tr();
                                        text_button_CUD = 'adjust'.tr();
                                        URL_QUALITY =
                                            '$SERVER/QualityList/Update';
                                        color_button_CUD = haian;
                                        CUD = 2;
                                        id_quality = snapshot.data![index].id;
                                        maChatLuong_quality =
                                            snapshot.data![index].maChatLuong;
                                        tenChatLuong_quality =
                                            snapshot.data![index].tenChatLuong;
                                        ghiChu_quality =
                                            snapshot.data![index].ghiChu;
                                        sideBarController.index.value = 7;
                                      },
                                      child: Tooltip(
                                        message: 'adjust'.tr(),
                                        child: const Icon(
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
                                        title_CUD_quality =
                                            'title delete quality container'
                                                .tr();
                                        text_button_CUD = 'delete'.tr();
                                        URL_QUALITY =
                                            '$SERVER/QualityList/Delete?id=${snapshot.data![index].id}';
                                        color_button_CUD = red;
                                        CUD = 3;
                                        // id_quality = snapshot.data![index].id;
                                        maChatLuong_quality =
                                            snapshot.data![index].maChatLuong;
                                        tenChatLuong_quality =
                                            snapshot.data![index].tenChatLuong;
                                        ghiChu_quality =
                                            snapshot.data![index].ghiChu;
                                        sideBarController.index.value = 7;
                                      },
                                      child: Tooltip(
                                        message: 'delete'.tr(),
                                        child: const Icon(
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
            ),
          );
        }
        return Text('');
      },
    );
  }
}
