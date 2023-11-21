import 'package:flutter/material.dart';
import 'package:web_booking/constants/color.dart';
import 'package:web_booking/constants/style.dart';
import 'package:web_booking/constants/variable.dart';
import 'package:intl/intl.dart';
import 'package:web_booking/screen/home/homepage_screen.dart';
import 'package:web_booking/screen/approval_list/widget/radio_button.dart';
import 'package:web_booking/screen/list_request/detail_request/detail_image_list_request.dart';

class DetailApprovalPage extends StatefulWidget {
  const DetailApprovalPage({super.key});

  @override
  State<DetailApprovalPage> createState() => _DetailApprovalPageState();
}

class _DetailApprovalPageState extends State<DetailApprovalPage> {
  String? _dt;

  void initState() {
    super.initState();
    noteHangTau_DetailApproval != null
        ? note_detail_approval.text = noteHangTau_DetailApproval!
        : null;
  }

  @override
  Widget build(BuildContext context) {
    updateTime_DetailApproval == null
        ? _dt = ''
        : _dt = DateFormat("dd-MM-yyyy  hh:mm a")
            .format(DateTime.parse(updateTime_DetailApproval!));
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
                  "Duyệt Yêu Cầu",
                  textAlign: TextAlign.center,
                  style: style_title_page,
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 16),
                child: InkWell(
                  onTap: () {
                    note_detail_approval.clear();
                    sideBarController.index.value = 1;
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
                      'Quay lại',
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
                      'Yêu cầu',
                      style: style_text_detail_bold,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text('$tenYeuCau_DetailApproval', style: style_text_detail),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Nội dung',
                      style: style_text_detail_bold,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text('$noiDung_DetailApproval',
                        textAlign: TextAlign.left, style: style_text_detail),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Container / Size',
                      style: style_text_detail_bold,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    RichText(
                        text: TextSpan(children: <TextSpan>[
                      TextSpan(
                          text: '$cntrno_DetailApproval ',
                          style:
                              const TextStyle(color: Colors.red, fontSize: 16)),
                      TextSpan(
                          text: '/ $sizeType_DetailApproval',
                          style: style_text_detail)
                    ])),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Ngày cập nhật',
                      style: style_text_detail_bold,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(_dt!, style: style_text_detail),
                    const SizedBox(
                      height: 20,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Ảnh thực tế',
                          style: style_text_detail_bold,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const ImageRequest(),
                      ],
                    ),
                    Text(
                      'Ghi chú hãng tàu',
                      style: style_text_detail_bold,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextField(
                      controller: note_detail_approval,
                      textCapitalization: TextCapitalization.sentences,
                      minLines: 1,
                      maxLines: 10,
                      keyboardType: TextInputType.multiline,
                      style:
                          const TextStyle(fontSize: 16, color: Colors.black87),
                      decoration: const InputDecoration(
                        hintText: 'Ghi chú hãng tàu',
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
                            note_detail_approval.clear();
                          },
                          child: const Text(
                            'Xóa ghi chú',
                            style: TextStyle(fontSize: 13, color: Colors.blue),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Trạng thái duyệt',
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