import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:web_booking/constants/color.dart';
import 'package:web_booking/constants/style.dart';
import 'package:web_booking/constants/variable.dart';
import 'package:web_booking/controllers/sidebar_controller.dart';
import 'package:web_booking/model/list_request/model_detail_request.dart';
import 'package:web_booking/model/list_request/storage_controller/detail_request_controller.dart';
import 'package:web_booking/widgets/container/widget_Button.dart';

import 'detail_image_request_list.dart';

// ignore: must_be_immutable
class DetailRequestPage extends StatelessWidget {
  String? _dt;
  Color? _color;
  String? _approve_status;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  WidgetButton(
                    text: 'back'.tr,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: haian,
                      minimumSize: Size(100, 35),
                    ),
                    onPressed: () {
                      controller.selectWidget.value = requestList;
                    },
                  ),
                  Text(
                    "details".tr,
                    style: style_title_page,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox.shrink()
                ],
              ),
              SizedBox(
                height: 5,
              ),
              FutureBuilder<List<DetailRequest>>(
                  future: DetailRequest().fetchDetailRequest(
                      id: dataDetailRequestController.id.value),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(child: CircularProgressIndicator());
                    }
                    if (snapshot.hasData) {
                      List<DetailRequest> data = snapshot.data;
                      if (data[0].trangThaiYc == 'A') {
                        _color = green;
                        _approve_status = 'agree combine'.tr;
                      }
                      if (data[0].trangThaiYc == 'R') {
                        _color = red;
                        _approve_status = 'reject combine'.tr;
                      } else {
                        _color = grey;
                        _approve_status = 'pending'.tr;
                      }
                      if (data[0].updateTime == null) {
                        _dt = '';
                      } else {
                        _dt = changeStringDateHourtoShow(
                            date: data[0].updateTime!);
                      }
                      return Container(
                        // width: deviceWidth(context),
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
                          borderRadius: BorderRadius.circular(4),
                        ),
                        padding: EdgeInsets.only(top: 10, bottom: 10, left: 10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'request'.tr,
                              style: style12_black_bold,
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              data[0].tenYeuCau ?? '',
                              style: style12_black,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Text(
                                  'sender'.tr,
                                  style: style12_black_bold,
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  data[0].shipperName ?? '',
                                  style: style12_black,
                                ),
                                data[0].shipperNote == null
                                    ? SizedBox()
                                    : Row(
                                        children: [
                                          SizedBox(
                                            width: 30,
                                          ),
                                          Text(
                                            'shipper'.tr,
                                            style: style12_black_bold,
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            data[0].shipperNote ?? '',
                                            style: style12_black,
                                          ),
                                        ],
                                      )
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              'content'.tr,
                              style: style12_black_bold,
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              data[0].noiDung ?? '',
                              // '$noiDung_DetailRequest',
                              textAlign: TextAlign.left,
                              style: style12_black,
                              // key: keytext
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              'container/size/quality'.tr,
                              style: style12_black_bold,
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            RichText(
                                text: TextSpan(children: <TextSpan>[
                              TextSpan(
                                  text: data[0].cntrno ?? '',
                                  // '$cntrno_DetailRequest ',
                                  style: const TextStyle(
                                      color: Colors.red, fontSize: 14)),
                              TextSpan(
                                  text: '/ ${data[0].sizeType ?? ''}',
                                  style: style12_black),
                              TextSpan(
                                  text: '/ ${data[0].quality ?? ''}',
                                  style: style12_black)
                            ])),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              'picture'.tr,
                              style: style12_black_bold,
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            ImageRequest(),
                            Text(
                              'status'.tr,
                              style: style12_black_bold,
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            WidgetButton(
                                text: _approve_status!,
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: _color,
                                  minimumSize: Size(100, 35),
                                ),
                                onPressed: () {}),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              'note'.tr,
                              style: style12_black_bold,
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(data[0].noteHangTau ?? '',
                                style: style12_black),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              'updateTime'.tr,
                              style: style12_black_bold,
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              _dt!,
                              style: style12_black,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            data[0].trangThaiYc == 'R'
                                ? Center(
                                    child: WidgetButton(
                                      text: 'resend request'.tr,
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: haian,
                                        minimumSize: Size(100, 35),
                                      ),
                                      onPressed: () {
                                        savecntr = data[0].cntrno!;
                                        controller.selectWidget.value =
                                            sendRequest;
                                      },
                                    ),
                                  )
                                //                         Center(
                                // child: ElevatedButton(
                                //     style: ElevatedButton.styleFrom(
                                //         backgroundColor: Color(0xFF09227e),
                                //         shape: const RoundedRectangleBorder(
                                //             borderRadius: BorderRadius.all(Radius.circular(8)))),
                                //     onPressed: () {
                                //       savecntr = dataDetailRequestController.cntrno.value;
                                //       // cntrno_DetailRequest!;
                                //       // sideBarController.index.value = 3;
                                //       // controller.changeWidget(SideBarController.sendRequest);
                                //       controller.selectWidget.value = sendRequest;
                                //     },
                                //     child: Container(
                                //       padding: EdgeInsets.all(10),
                                //       child: Text('resend request'.tr, style: style_text_button_detail),
                                //     )))
                                : SizedBox(),
                            SizedBox(
                              height: 10,
                            ),
                          ],
                        ),
                      );
                    }
                    return SizedBox.shrink();
                  }),
            ],
          ),
        ),
      ],
    );
  }
}
