// import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:web_booking/constants/color.dart';
import 'package:web_booking/constants/style.dart';
import 'package:web_booking/constants/variable.dart';
import 'package:web_booking/model/tracking/model_tracking.dart';
import 'package:web_booking/page/menu/tracking/popUp_detailContainer/popUp_container_detail.dart';
import 'package:web_booking/page/menu/tracking/tracking_page.dart';
import 'package:web_booking/page/menu/tracking/widgets/container_details.dart';

// ignore: must_be_immutable
class ContainerList extends StatefulWidget {
  @override
  State<ContainerList> createState() => _ContainerListState();
}
// List<TrackingZimsEN>? list_filter_en;
// List<TrackingZimsVN>? list_filter_vn;

class _ContainerListState extends State<ContainerList> {
  @override
  Widget build(BuildContext context) {
    return dataBooking();
  }

  FutureBuilder<ContainerTracking> dataBooking() {
    return FutureBuilder<ContainerTracking>(
      // future: containerTracking,
      future:
          ContainerTracking().fetchContainerTracking(input.text.toUpperCase()),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasData) {
          var data_bk = snapshot.data!.trackingContainers;
          var data_cntr_en = snapshot.data!.trackingZimsEN;
          var data_cntr_vn = snapshot.data!.trackingZimsVN;
          if (data_bk.toString() != [].toString()) {
            if (data_cntr_en.toString() != [].toString() && cntr_no != null) {
              if (bool_lang == false) {
                list_filter = data_cntr_en!
                    .where((item) => item.container!.contains(cntr_no!))
                    .toList();
              } else {
                list_filter = data_cntr_vn!
                    .where((item) => item.container!.contains(cntr_no!))
                    .toList();
              }
            }
            return Container(
              padding: const EdgeInsets.only(bottom: 30),
              width: 1024,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(7)),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(left: 45),
                      child: Row(
                        children: [
                          Icon(Icons.arrow_right),
                          Text('title_booking'.tr)
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    DataListCont(data_bk, data_cntr_en, data_cntr_vn, context),
                  ]),
            );
          } else {
            if (data_cntr_en.toString() != [].toString()) {
              cntr_no = input.text.toUpperCase().toString();
              if (bool_lang == false) {
                list_filter = data_cntr_en!
                    .where((item) => item.container!.contains(cntr_no!))
                    .toList();
              } else {
                list_filter = data_cntr_vn!
                    .where((item) => item.container!.contains(cntr_no!))
                    .toList();
              }
              // print(list_filter);
              return ContainerDetails();
            } else {
              return SizedBox();
            }
          }
        }
        return SizedBox();
      },
    );
  }

  DataTable DataListCont(
      List<TrackingContainers>? data_bk,
      List<TrackingZimsEN>? data_cntr_en,
      List<TrackingZimsVN>? data_cntr_vn,
      BuildContext context) {
    return DataTable(
        border: TableBorder.all(),
        columns: [
          DataColumn(
            label: Expanded(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('seq'.tr, style: style_text_Table_small_bold),
              ],
            )),
          ),
          DataColumn(
            label: Expanded(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('cntrno'.tr, style: style_text_Table_small_bold),
              ],
            )),
          ),
          DataColumn(
            label: Expanded(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('size_booking'.tr, style: style_text_Table_small_bold),
              ],
            )),
          ),
        ],
        rows: List.generate(data_bk!.length, (index) {
          return DataRow(cells: [
            DataCell(Container(
              width: 30,
              child: Center(
                  child: Text(
                (index + 1).toString(),
                style: style_text_Table_small,
              )),
            )),
            DataCell(Row(
              children: [
                Container(
                  child: InkWell(
                      onTap: () {
                        // print(bool_lang);
                        cntr_no = data_bk[index].container.toString();
                        if (bool_lang == false) {
                          list_filter = data_cntr_en!
                              .where(
                                  (item) => item.container!.contains(cntr_no!))
                              .toList();
                        } else {
                          list_filter = data_cntr_vn!
                              .where(
                                  (item) => item.container!.contains(cntr_no!))
                              .toList();
                        }
                        PopUpContainerDetail(context);
                        // print('$list_filter');
                      },
                      child: Container(
                          padding: EdgeInsets.only(bottom: 2),
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                            color: normalColor,
                            width: 1,
                          ))),
                          child: Text(
                            data_bk[index].container.toString(),
                            style: style_text_Table_small_bold_container,
                          ))),
                ),
                SizedBox(
                  width: 520,
                )
              ],
            )),
            DataCell(Container(
              width: 120,
              child: Center(
                  child: Text(data_bk[index].size.toString(),
                      style: style_text_Table_small)),
            )),
          ]);
        }));
  }
}
