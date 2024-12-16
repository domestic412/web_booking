import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:web_booking/constants/color.dart';
import 'package:web_booking/constants/global.dart';
import 'package:web_booking/constants/style.dart';
import 'package:web_booking/constants/variable.dart';
import 'package:web_booking/controllers/sidebar_controller.dart';
import 'package:web_booking/model/list_quality/model_quality_list.dart';
import 'package:web_booking/model/list_quality/storage_controller/quality_controller.dart';
import 'package:web_booking/screen/quality_list/data/data_gridrow_quality_list.dart';
import 'package:web_booking/widgets/container/widget_Button.dart';
import 'package:web_booking/widgets/container/widget_GridColumn_Quality.dart';

// ignore: must_be_immutable
class QualityListPage extends StatefulWidget {
  @override
  State<QualityListPage> createState() => _QualityListPageState();
}

class _QualityListPageState extends State<QualityListPage> {
  late DataQualitySource _dataQualitySource;
  List<QualityList> _quality = <QualityList>[];

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
            Container(
              margin: EdgeInsets.only(bottom: 5),
              child: WidgetButton(
                  text: 'create'.tr,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: haian,
                    minimumSize: Size(100, 35),
                  ),
                  onPressed: () {
                    title_CUD_quality = 'title create quality container'.tr;
                    text_button_CUD = 'save'.tr;
                    URL_QUALITY = '$SERVER/QualityList/Create';
                    color_button_CUD = haian;
                    CUD = 1;
                    qualityController.updateQualityController(
                        id: 0.obs,
                        maChatLuong: ''.obs,
                        tenChatLuong: ''.obs,
                        ghiChu: ''.obs,
                        updateUser: ''.obs);
                    controller.selectWidget.value = cudQuality;
                  }),
            ),
            // Container(
            //     margin: EdgeInsets.only(bottom: 16),
            //     child: ElevatedButton(
            //         style: ElevatedButton.styleFrom(
            //             backgroundColor: haian,
            //             shape: const RoundedRectangleBorder(
            //                 borderRadius:
            //                     BorderRadius.all(Radius.circular(10)))),
            //         onPressed: () {
            //           title_CUD_quality = 'title create quality container'.tr;
            //           text_button_CUD = 'save'.tr;
            //           URL_QUALITY = '$SERVER/QualityList/Create';
            //           color_button_CUD = haian;
            //           CUD = 1;
            //           qualityController.updateQualityController(
            //               id: 0.obs,
            //               maChatLuong: ''.obs,
            //               tenChatLuong: ''.obs,
            //               ghiChu: ''.obs,
            //               updateUser: ''.obs);
            //           // sideBarController.index.value = 7;
            //           // controller.changeWidget(SideBarController.cudQuality);
            //           controller.selectWidget.value = cudQuality;
            //         },
            //         child: Container(
            //           padding:
            //               EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            //           child: Text('create'.tr, style: style12_white),
            //         ))),
            FutureBuilder<List<QualityList>>(
                future: QualityList().fetchQualityList(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  }
                  if (snapshot.hasData) {
                    _quality = snapshot.data!;
                    _dataQualitySource = DataQualitySource(_quality);
                    return Expanded(
                        child: Container(
                      color: white,
                      child: SfDataGridTheme(
                          data: SfDataGridThemeData(
                            headerColor: Colors.grey[200],
                          ),
                          child: SfDataGrid(
                              // rowHeight: 30,
                              headerRowHeight: 40,
                              isScrollbarAlwaysShown: true,
                              columnWidthMode: ColumnWidthMode.fill,
                              selectionMode: SelectionMode.single,
                              gridLinesVisibility: GridLinesVisibility.both,
                              headerGridLinesVisibility:
                                  GridLinesVisibility.both,
                              source: _dataQualitySource,
                              columns: [
                                WidgetGridColumnQuality(
                                    label: 'Seq.', visible: true),
                                WidgetGridColumnQuality(
                                    label: 'id', visible: false),
                                WidgetGridColumnQuality(
                                    label: 'quality code'.tr, visible: true),
                                WidgetGridColumnQuality(
                                    label: 'quality name'.tr, visible: true),
                                WidgetGridColumnQuality(
                                    label: 'note'.tr, visible: true),
                                WidgetGridColumnQuality(
                                    label: 'update time'.tr, visible: true),
                                WidgetGridColumnQuality(
                                    label: 'updater'.tr, visible: true),
                                WidgetGridColumnQuality(
                                    label: '##', visible: true),
                              ])),
                    ));
                  }
                  return SizedBox.shrink();
                }),
          ]),
    );
  }
}
