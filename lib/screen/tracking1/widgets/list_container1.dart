// import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:web_booking/constants/color.dart';
import 'package:web_booking/constants/style.dart';
import 'package:web_booking/constants/variable.dart';
import 'package:web_booking/model/tracking/model_tracking.dart';
import 'package:web_booking/screen/tracking1/popUp_detailContainer1/popUp_container_detail1.dart';
import 'package:web_booking/screen/tracking1/tracking_page1.dart';
import 'package:web_booking/screen/tracking1/widgets/container_details1.dart';

// ignore: must_be_immutable
class ListContainer1 extends StatefulWidget {
  @override
  State<ListContainer1> createState() => _ListContainer1State();
}

// Future<ContainerTracking>? containerTracking;
// List? list_filter;

class _ListContainer1State extends State<ListContainer1> {
  @override
  Widget build(BuildContext context) {
    return dataBooking();
  }

  FutureBuilder<ContainerTracking> dataBooking() {
    return FutureBuilder<ContainerTracking>(
      future: containerTracking,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasData) {
          var data_bk = snapshot.data!.trackingContainers;
          var data_cntr_en = snapshot.data!.trackingZimsEN;
          var data_cntr_vn = snapshot.data!.trackingZimsVN;
          if (data_bk.toString() != [].toString()) {
            // if (data_cntr_en.toString() != [].toString() && cntr_no != null) {
            //   if (bool_lang == false) {
            //     list_filter = data_cntr_en!
            //         .where((item) => item.container!.contains(cntr_no!))
            //         .toList();
            //   } else {
            //     list_filter = data_cntr_vn!
            //         .where((item) => item.container!.contains(cntr_no!))
            //         .toList();
            //   }
            // }
            return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: Text(
                      'result'.tr,
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
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
                    child: DataListCont1(
                        data_bk, data_cntr_en, data_cntr_vn, context),
                  ),
                ]);
          } else {
            if (data_cntr_en.toString() != [].toString()) {
              cntr_no = inputTracking1.text.toUpperCase().toString();
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
              return ContainerDetails1();
            } else {
              return const Center(
                child: Text('Not found data!'),
              );
            }
          }
        }
        return const SizedBox();
      },
    );
  }

  DataTable DataListCont1(
      List<TrackingContainers>? data_bk,
      List<TrackingZimsEN>? data_cntr_en,
      List<TrackingZimsVN>? data_cntr_vn,
      BuildContext context) {
    return DataTable(
        headingRowColor:
            MaterialStateProperty.resolveWith((states) => lightGrey),
        border: const TableBorder(
            verticalInside: BorderSide(color: Colors.black12)),
        sortColumnIndex: 0,
        dataRowMaxHeight: 50,
        columnSpacing: 16,
        columns: [
          DataColumn(
            label: Expanded(
                child: Center(
                    child: Text('seq'.tr, style: style_text_Table_small_bold))),
          ),
          DataColumn(
            label: Expanded(
                child: Center(
                    child:
                        Text('cntrno'.tr, style: style_text_Table_small_bold))),
          ),
          DataColumn(
            label: Expanded(
                child: Center(
                    child:
                        Text('size'.tr, style: style_text_Table_small_bold))),
          ),
        ],
        rows: List.generate(data_bk!.length, (index) {
          return DataRow(cells: [
            DataCell(Center(
                child: Text(
              (index + 1).toString(),
              style: style_text_Table_small,
            ))),
            DataCell(Center(
              child: InkWell(
                  onTap: () {
                    cntr_no = data_bk[index].container.toString();
                    if (bool_lang == false) {
                      list_filter = data_cntr_en!
                          .where((item) => item.container!.contains(cntr_no!))
                          .toList();
                    } else {
                      list_filter = data_cntr_vn!
                          .where((item) => item.container!.contains(cntr_no!))
                          .toList();
                    }
                    PopUpContainerDetail1(context);
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
            )),
            DataCell(Center(
                child: Text(data_bk[index].size.toString(),
                    style: style_text_Table_small))),
          ]);
        }));
  }
}
