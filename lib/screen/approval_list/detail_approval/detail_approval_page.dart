import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:web_booking/constants/color.dart';
import 'package:web_booking/constants/style.dart';
import 'package:web_booking/constants/variable.dart';
import 'package:web_booking/controllers/sidebar_controller.dart';
import 'package:web_booking/model/list_approval/model_detail_approval.dart';
import 'package:web_booking/model/list_approval/storage_controller/detail_approval_controller.dart';
import 'package:web_booking/screen/approval_list/widget/radio_button.dart';
import 'package:web_booking/screen/request_list/detail_request/detail_image_request_list.dart';
import 'package:web_booking/widgets/container/widget_Button.dart';
import 'package:web_booking/widgets/container/widget_TextField.dart';

// ignore: must_be_immutable
class DetailApprovalPage extends StatelessWidget {
  String? _dt;
  bool _bool_approve = false;
  Color? _color;
  String? _approve_status;

  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                WidgetButton(
                  text: 'back'.tr,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: grey,
                    minimumSize: Size(100, 35),
                  ),
                  onPressed: () {
                    controller.selectWidget.value = approvalList;
                  },
                ),
                Text(
                  "approve request".tr,
                  textAlign: TextAlign.center,
                  style: style_title_page,
                ),
                const SizedBox.shrink()
              ],
            ),

            SizedBox(
              height: 5,
            ),
            // Container(
            //   margin: EdgeInsets.only(bottom: 5),
            //   child: InkWell(
            //     onTap: () {
            //       // note_detail_approval.clear();
            //       controller.selectWidget.value = approvalList;
            //     },
            //     child: Container(
            //       alignment: Alignment.center,
            //       height: 35,
            //       width: 100,
            //       decoration: BoxDecoration(
            //         borderRadius: BorderRadius.circular(10),
            //         color: grey,
            //       ),
            //       child: Text(
            //         'back'.tr,
            //         style: style_text_button_detail,
            //       ),
            //     ),
            //   ),
            // ),
            FutureBuilder<List<DetailApproval>>(
                future: DetailApproval()
                    .fetchDetailApproval(id: detailApprovalController.id.value),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  }
                  if (snapshot.hasData) {
                    List<DetailApproval> data = snapshot.data;
                    if (data[0].trangThaiYc == 'A' ||
                        data[0].trangThaiYc == 'R') {
                      _bool_approve = true;
                      if (data[0].trangThaiYc == 'A') {
                        _color = green;
                        _approve_status = 'agree combine'.tr;
                      } else {
                        _color = red;
                        _approve_status = 'reject combine'.tr;
                      }
                    }
                    if (data[0].updateTime == null) {
                      _dt = '';
                    } else {
                      _dt = changeStringDateHourtoShow(
                          date: data[0].updateTime ?? '');
                    }
                    return Container(
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
                          Text(data[0].tenYeuCau ?? '', style: style12_black),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Text(
                                'sender'.tr,
                                style: style12_black_bold,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(data[0].shipperName ?? '',
                                  style: style12_black),
                              data[0].shipperNote == null
                                  ? SizedBox.shrink()
                                  : Row(
                                      children: [
                                        SizedBox(
                                          width: 40,
                                        ),
                                        Text(
                                          'shipper'.tr,
                                          style: style12_black_bold,
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text(data[0].shipperNote ?? '',
                                            style: style12_black),
                                      ],
                                    ),
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
                          Text(data[0].noiDung ?? '',
                              textAlign: TextAlign.left, style: style12_black),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            'container/size/grade'.tr,
                            style: style12_black_bold,
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          RichText(
                              text: TextSpan(children: <TextSpan>[
                            TextSpan(
                                text: data[0].cntrno ?? '',
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
                            'updateTime'.tr,
                            style: style12_black_bold,
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(_dt ?? '', style: style12_black),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            'CombineStuffing'.tr,
                            style: style12_black_bold,
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(data[0].combineStuffing ?? '',
                              style: style12_black),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Check Remark'.tr,
                            style: style12_black_bold,
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(data[0].checkRemark ?? '', style: style12_black),
                          const SizedBox(
                            height: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'picture'.tr,
                                style: style12_black_bold,
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              ImageRequest(),
                            ],
                          ),
                          Text(
                            'note'.tr,
                            style: style12_black_bold,
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          _bool_approve == true
                              ? Column(
                                  children: [
                                    Text(data[0].noteHangTau ?? '',
                                        style: style12_black),
                                    SizedBox(
                                      height: 5,
                                    ),
                                  ],
                                )
                              : Column(
                                  children: [
                                    WidgetTextField(
                                        controller: detailApprovalController
                                            .note_controller,
                                        minLines: 1,
                                        maxLines: 10),
                                    const SizedBox(
                                      height: 3,
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            detailApprovalController
                                                .note_controller
                                                .clear();
                                          },
                                          child: Text(
                                            'delete note'.tr,
                                            style: TextStyle(
                                                fontSize: 10,
                                                color: Colors.blue),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 5,
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                          // TextField(
                          //   controller:
                          //       detailApprovalController.note_controller,
                          //   textCapitalization: TextCapitalization.sentences,
                          //   minLines: 1,
                          //   maxLines: 10,
                          //   keyboardType: TextInputType.multiline,
                          //   style: const TextStyle(
                          //       fontSize: 16, color: Colors.black87),
                          //   decoration: InputDecoration(
                          //     hintText: 'note'.tr,
                          //     border: OutlineInputBorder(),
                          //   ),
                          // ),

                          Text(
                            'comebine time'.tr,
                            style: style12_black_bold,
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            'Số lần cho phép loại A:  ${data[0].combineTimesA ?? ''}',
                            style: style12_black,
                          ),
                          Text(
                            'Số lần cho phép loại B/C:  ${data[0].combineTimes ?? ''}',
                            style: style12_black,
                          ),
                          // RichText(
                          //     text: TextSpan(children: <TextSpan>[
                          //   TextSpan(
                          //       text: 'Số lần cho phép loại A: ',
                          //       style: style12_black_bold),
                          //   TextSpan(
                          //       text: data[0].combineTimesA ?? ''.toString(),
                          //       style: style12_black_bold),
                          //   TextSpan(
                          //       text: ' - Số lần cho phép loại B/C: ',
                          //       style: style12_black_bold),
                          //   TextSpan(
                          //       text: ' ${data[0].combineTimes ?? ''.toString()}',
                          //       style: style12_black_bold),
                          // ])),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            'status'.tr,
                            style: style12_black_bold,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          _bool_approve == true
                              ? WidgetButton(
                                  text: _approve_status ?? '',
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: _color,
                                    minimumSize: Size(100, 35),
                                  ),
                                  onPressed: () {})
                              : const RadioButton(),
                        ],
                      ),
                    );
                  }
                  return SizedBox.shrink();
                }),
          ],
        ),
      ),
    ]);
  }
}
