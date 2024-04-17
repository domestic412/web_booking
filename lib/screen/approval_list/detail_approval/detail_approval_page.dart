import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:web_booking/constants/color.dart';
import 'package:web_booking/constants/style.dart';
import 'package:web_booking/constants/variable.dart';
import 'package:intl/intl.dart';
import 'package:web_booking/controllers/sidebar_controller.dart';
import 'package:web_booking/model/list_approval/storage_controller/detail_approval_controller.dart';
import 'package:web_booking/screen/approval_list/widget/radio_button.dart';
import 'package:web_booking/screen/request_list/detail_request/detail_image_request_list.dart';

class DetailApprovalPage extends StatefulWidget {
  @override
  State<DetailApprovalPage> createState() => _DetailApprovalPageState();
}

class _DetailApprovalPageState extends State<DetailApprovalPage> {
  String? _dt;

  // TextEditingController note_detail_approval = TextEditingController();

  void initState() {
    super.initState();
    detailApprovalController.note_controller.text =
        detailApprovalController.noteHangTau.value;
  }

  @override
  Widget build(BuildContext context) {
    detailApprovalController.updateTime.value == ''
        ? _dt = ''
        : _dt = DateFormat("dd-MM-yyyy  hh:mm a")
            .format(DateTime.parse(detailApprovalController.updateTime.value));
    return SizedBox(
      height: deviceHeight(context),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: deviceWidth(context),
                child: Text(
                  "approve request".tr,
                  textAlign: TextAlign.center,
                  style: style_title_page,
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 16),
                child: InkWell(
                  onTap: () {
                    // note_detail_approval.clear();
                    controller.selectWidget.value = approvalList;
                  },
                  child: Container(
                    alignment: Alignment.center,
                    height: 35,
                    width: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: grey,
                    ),
                    child: Text(
                      'back'.tr,
                      style: style_text_button_detail,
                    ),
                  ),
                ),
              ),
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
                padding: const EdgeInsets.all(16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'request'.tr,
                      style: style_text_detail_bold,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(detailApprovalController.tenYeuCau.value,
                        style: style_text_detail),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      'content'.tr,
                      style: style_text_detail_bold,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(detailApprovalController.noiDung.value,
                        textAlign: TextAlign.left, style: style_text_detail),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      'container/size'.tr,
                      style: style_text_detail_bold,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    RichText(
                        text: TextSpan(children: <TextSpan>[
                      TextSpan(
                          text: detailApprovalController.cntrno.value,
                          style:
                              const TextStyle(color: Colors.red, fontSize: 16)),
                      TextSpan(
                          text: '/ ${detailApprovalController.sizeType.value}',
                          style: style_text_detail)
                    ])),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      'update time'.tr,
                      style: style_text_detail_bold,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(_dt!, style: style_text_detail),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      'CombineStuffing'.tr,
                      style: style_text_detail_bold,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(detailApprovalController.combineStuffing.value,
                        style: style_text_detail),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Check Remark'.tr,
                      style: style_text_detail_bold,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(detailApprovalController.checkRemark.value,
                        style: style_text_detail),
                    const SizedBox(
                      height: 20,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'picture'.tr,
                          style: style_text_detail_bold,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const ImageRequest(),
                      ],
                    ),
                    Text(
                      'note'.tr,
                      style: style_text_detail_bold,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextField(
                      controller: detailApprovalController.note_controller,
                      textCapitalization: TextCapitalization.sentences,
                      minLines: 1,
                      maxLines: 10,
                      keyboardType: TextInputType.multiline,
                      style:
                          const TextStyle(fontSize: 16, color: Colors.black87),
                      decoration: InputDecoration(
                        hintText: 'note'.tr,
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        InkWell(
                          onTap: () {
                            detailApprovalController.note_controller.clear();
                          },
                          child: Text(
                            'delete note'.tr,
                            style: TextStyle(fontSize: 13, color: Colors.blue),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      'status approve'.tr,
                      style: style_text_detail_bold,
                    ),
                    const RadioButton(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
