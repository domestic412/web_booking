import 'package:flutter/material.dart';
import 'package:web_booking/constants/color.dart';
import 'package:web_booking/constants/global.dart';
import 'package:web_booking/constants/style.dart';
import 'package:web_booking/constants/variable.dart';
import 'package:intl/intl.dart';
import 'package:web_booking/model/list_%20special_policy/model_special_policy.dart';
import 'package:web_booking/screen/home/homepage_screen.dart';
import 'package:easy_localization/easy_localization.dart';

// ignore: must_be_immutable
class SpecialPolicyListPage extends StatefulWidget {
  @override
  State<SpecialPolicyListPage> createState() => _SpecialPolicyListPageState();
}

class _SpecialPolicyListPageState extends State<SpecialPolicyListPage> {
  @override
  Widget build(BuildContext context) {
    return DataSpecialPolicyList();
  }

  FutureBuilder<List<SpecialPolicyList>> DataSpecialPolicyList() {
    return FutureBuilder<List<SpecialPolicyList>>(
      future: SpecialPolicyList().fetchSpecialPolicyList(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasData) {
          print('show data list special policy');
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
                          'title special policy list'.tr(),
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
                                code_policy = '';
                                shipper_policy = '';
                                times_policy = '';
                                id_policy = 0;
                                title_CUD_special_policy =
                                    'title create policy container'.tr();
                                text_button_CUD = 'save'.tr();
                                URL_SPECIAL_POLICY =
                                    '$SERVER/SpecialPolicy/Create';
                                color_button_CUD = haian;
                                CUD = 1;
                                sideBarController.index.value = 9;
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
                            dataRowMaxHeight: 50,
                            columnSpacing: 20,
                            columns: [
                              DataColumn(
                                label: Expanded(
                                  child: Center(
                                    child: Text(
                                      'seq'.tr(),
                                      style: style_text_Table_small_bold,
                                    ),
                                  ),
                                ),
                              ),
                              DataColumn(
                                label: Expanded(
                                  child: Center(
                                      child: Text(
                                    'code'.tr(),
                                    style: style_text_Table_small_bold,
                                  )),
                                ),
                              ),
                              DataColumn(
                                label: Expanded(
                                  child: Center(
                                      child: Text('shipper'.tr(),
                                          style: style_text_Table_small_bold)),
                                ),
                              ),
                              DataColumn(
                                label: Expanded(
                                  child: Center(
                                      child: Text(
                                    'times'.tr(),
                                    style: style_text_Table_small_bold,
                                  )),
                                ),
                              ),
                              DataColumn(
                                label: Expanded(
                                  child: Center(
                                      child: Text(
                                    'update time'.tr(),
                                    style: style_text_Table_small_bold,
                                  )),
                                ),
                              ),
                              DataColumn(
                                label: Expanded(
                                  child: Center(
                                      child: Text(
                                    'updater'.tr(),
                                    style: style_text_Table_small_bold,
                                  )),
                                ),
                              ),
                              DataColumn(
                                label: Expanded(
                                  child: Center(
                                      child: Text('###',
                                          style: style_text_Table_small_bold)),
                                ),
                              ),
                            ],
                            rows: List.generate(snapshot.data!.length, (index) {
                              var data = snapshot.data![index];
                              String _dt = DateFormat("yyyy-MM-dd   hh:mm")
                                  .format(DateTime.parse(data.updateTime!));
                              return DataRow(
                                  // color: MaterialStateProperty.all(red),
                                  cells: [
                                    DataCell(Center(
                                      child: Text(
                                        (index + 1).toString(),
                                        style: style_text_Table_small,
                                      ),
                                    )),
                                    DataCell(Center(
                                        child: SelectableText(
                                            data.code.toString(),
                                            style: style_text_Table_small))),
                                    DataCell(Center(
                                      child: SelectableText(
                                          data.shipper.toString(),
                                          style: style_text_Table_small),
                                    )),
                                    DataCell(Center(
                                        child: SelectableText(
                                            data.times.toString(),
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            title_CUD_special_policy =
                                                'title adjust policy container'
                                                    .tr();
                                            text_button_CUD = 'adjust'.tr();
                                            URL_SPECIAL_POLICY =
                                                '$SERVER/SpecialPolicy/Update';
                                            color_button_CUD = haian;
                                            CUD = 2;
                                            id_policy =
                                                snapshot.data![index].id;
                                            code_policy =
                                                snapshot.data![index].code;
                                            shipper_policy =
                                                snapshot.data![index].shipper;
                                            times_policy =
                                                snapshot.data![index].times;
                                            sideBarController.index.value = 9;
                                          },
                                          child: Tooltip(
                                            message: 'adjust'.tr(),
                                            child: const Icon(
                                              Icons
                                                  .drive_file_rename_outline_sharp,
                                              size: 20,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        InkWell(
                                          onTap: () {
                                            title_CUD_special_policy =
                                                'title delete policy container'
                                                    .tr();
                                            text_button_CUD = 'delete'.tr();
                                            URL_SPECIAL_POLICY =
                                                '$SERVER/SpecialPolicy/Delete?id=${snapshot.data![index].id}';
                                            color_button_CUD = red;
                                            CUD = 3;
                                            code_policy =
                                                snapshot.data![index].code;
                                            shipper_policy =
                                                snapshot.data![index].shipper;
                                            times_policy =
                                                snapshot.data![index].times;
                                            sideBarController.index.value = 9;
                                          },
                                          child: Tooltip(
                                            message: 'delete'.tr(),
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
            ),
          );
        }
        return Text('');
      },
    );
  }
}
