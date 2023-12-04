import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:web_booking/constants/color.dart';
import 'package:web_booking/constants/global.dart';
import 'package:web_booking/constants/style.dart';
import 'package:web_booking/constants/variable.dart';
import 'package:web_booking/controllers/sidebar_controller.dart';
import 'package:web_booking/model/list_%20special_policy/model_special_policy.dart';
import 'package:web_booking/screen/special_policy_list/data/data_special_policy_list.dart';

// ignore: must_be_immutable
class SpecialPolicyListPage extends StatefulWidget {
  @override
  State<SpecialPolicyListPage> createState() => _SpecialPolicyListPageState();
}

class _SpecialPolicyListPageState extends State<SpecialPolicyListPage> {
  DataTablePolicy _dataPolicy = DataTablePolicy(data: []);

  @override
  void initState() {
    super.initState();
    SpecialPolicyList().fetchSpecialPolicyList().then((data) {
      setState(() {
        _dataPolicy = DataTablePolicy(data: data);
        print('initial data policy');
      });
    });
  }

  @override
  Widget build(BuildContext context) {
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
                    'title special policy list'.tr,
                    style: style_title_page,
                  ),
                ),
                Container(
                    margin: EdgeInsets.only(bottom: 16),
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: haian,
                            shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)))),
                        onPressed: () {
                          code_policy = '';
                          shipper_policy = '';
                          times_policy = '';
                          id_policy = 0;
                          title_CUD_special_policy =
                              'title create policy container'.tr;
                          text_button_CUD = 'save'.tr;
                          URL_SPECIAL_POLICY = '$SERVER/SpecialPolicy/Create';
                          color_button_CUD = haian;
                          CUD = 1;
                          // sideBarController.index.value = 9;
                          // controller.changeWidget(SideBarController.cudPolicy);
                          controller.selectWidget.value = cudPolicy;
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 15, vertical: 10),
                          child:
                              Text('create'.tr, style: style_text_box_button),
                        ))),
                Container(
                  width: deviceWidth(context),
                  decoration: BoxDecoration(
                    color: white,
                    border: Border.all(color: blue.withOpacity(.4), width: .5),
                    boxShadow: [
                      BoxShadow(
                          offset: const Offset(0, 6),
                          color: blue.withOpacity(.1),
                          blurRadius: 12)
                    ],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: PaginatedDataTable(
                      headingRowColor:
                          MaterialStateColor.resolveWith((states) => lightGrey),
                      sortColumnIndex: 0,
                      // sortAscending: true,
                      dataRowMaxHeight: 50,
                      columnSpacing: 20,
                      columns: [
                        DataColumn(
                          label: SizedBox(
                            width: 40,
                            child: Center(
                              child: Text(
                                'seq'.tr,
                                style: style_text_Table_small_bold,
                              ),
                            ),
                          ),
                        ),
                        DataColumn(
                          label: Expanded(
                            child: SelectableText(
                              'code'.tr,
                              style: style_text_Table_small_bold,
                            ),
                          ),
                        ),
                        DataColumn(
                          label: Expanded(
                            child: SelectableText('shipper'.tr,
                                style: style_text_Table_small_bold),
                          ),
                        ),
                        DataColumn(
                          label: Expanded(
                            child: SelectableText(
                              'times'.tr,
                              style: style_text_Table_small_bold,
                            ),
                          ),
                        ),
                        DataColumn(
                          label: Expanded(
                            child: SelectableText(
                              'update time'.tr,
                              style: style_text_Table_small_bold,
                            ),
                          ),
                        ),
                        DataColumn(
                          label: Expanded(
                            child: SelectableText(
                              'updater'.tr,
                              style: style_text_Table_small_bold,
                            ),
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
                      source: _dataPolicy),
                ),
              ]),
        ),
      ),
    );
  }
}
