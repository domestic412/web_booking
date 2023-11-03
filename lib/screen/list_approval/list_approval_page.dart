import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:web_booking/constants/color.dart';
import 'package:web_booking/constants/global.dart';
import 'package:web_booking/constants/style.dart';
import 'package:web_booking/constants/variable.dart';
import 'package:web_booking/model/list_approval/model_list_approval.dart';
import 'package:web_booking/screen/list_approval/popUp_detail/detail_approval.dart';
import 'package:intl/intl.dart';

// ignore: must_be_immutable
class ListApprovalPage extends StatefulWidget {
  @override
  State<ListApprovalPage> createState() => _ListApprovalPageState();
}

class _ListApprovalPageState extends State<ListApprovalPage> {
  Future<List<ListApprovalResponse>>? listApproval;
  List<ListApprovalResponse> list_filter_approval = [];

  TextEditingController _search_text = TextEditingController();

  Color? _color;
  String _trangthai = '';

  @override
  void initState() {
    super.initState();
    listApproval = ListApprovalResponse().fetchListApproval();
  }

  @override
  Widget build(BuildContext context) {
    return DataApproval();
    // );
  }

  FutureBuilder<List<ListApprovalResponse>> DataApproval() {
    return FutureBuilder<List<ListApprovalResponse>>(
      future: listApproval,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          print('show List request Admin');
          if (_search_text.text.isEmpty) {
            list_filter_approval = snapshot.data!;
            print('filter show data list request admin');
          }
          return SizedBox(
            // use sizedbox to content always start on top
            height: deviceHeight(context),
            child: SingleChildScrollView(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      width: deviceWidth(context),
                      alignment: Alignment.center,
                      padding: const EdgeInsets.only(top: 32),
                      child: Text(
                        "List Approval",
                        style: style_title_page,
                      ),
                    ),
                    Container(
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
                      padding: const EdgeInsets.all(16),
                      margin: const EdgeInsets.symmetric(
                          horizontal: 32, vertical: 16),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(color: Colors.black45)),
                        child: ListTile(
                          leading: const Icon(Icons.search),
                          title: TextField(
                            controller: _search_text,
                            decoration: const InputDecoration(
                                hintText: 'Search', border: InputBorder.none),
                            onChanged: (value) {
                              setState(() {
                                list_filter_approval = snapshot.data!
                                    .where((item) =>
                                        item.cntrno!
                                            .contains(value.toUpperCase()) ||
                                        item.nguoiGui!
                                            .toUpperCase()
                                            .contains(value.toUpperCase()) ||
                                        item.updateTime!
                                            .toUpperCase()
                                            .contains(value.toUpperCase()))
                                    .toList();
                              });
                            },
                          ),
                          trailing: IconButton(
                            icon: const Icon(Icons.cancel),
                            onPressed: () {
                              setState(() {
                                _search_text.clear();
                                // list_filter = snapshot.data!;
                              });
                            },
                          ),
                        ),
                      ),
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
                      margin: const EdgeInsets.only(
                          bottom: 16, left: 32, right: 32),
                      child: DataTable(
                          border: const TableBorder(
                              verticalInside:
                                  BorderSide(color: Colors.black12)),
                          sortColumnIndex: 0,
                          columnSpacing: 16,
                          columns: [
                            DataColumn(
                              label: Expanded(
                                  child: Center(
                                      child: Text("STT",
                                          style: style_text_Table_small_bold))),
                            ),
                            DataColumn(
                              label: Expanded(
                                  child: Center(
                                child: Text('Số Container',
                                    style: style_text_Table_small_bold),
                              )),
                            ),
                            DataColumn(
                                label: Expanded(
                                    child: Center(
                              child: Text('Người gửi',
                                  style: style_text_Table_small_bold),
                            ))),
                            DataColumn(
                              label: Expanded(
                                child: InkWell(
                                  onTap: () {
                                    setState(() {
                                      list_filter_approval = snapshot.data!
                                          .where((item) =>
                                              item.trangThaiYc!.contains('C'))
                                          .toList();
                                      // print(list_filter_Admin);
                                      _search_text.text = 'Chờ duyệt';
                                    });
                                  },
                                  child: Center(
                                    child: Text('Duyệt yêu cầu',
                                        style: style_text_Table_small_bold),
                                  ),
                                ),
                              ),
                            ),
                            DataColumn(
                                label: Expanded(
                                    child: Center(
                              child: Text('Ngày cập nhật',
                                  style: style_text_Table_small_bold),
                            ))),
                          ],
                          rows: List.generate(list_filter_approval.length,
                              (index) {
                            var data = list_filter_approval[index];
                            String _dt = DateFormat("yyyy-MM-dd  hh:mm")
                                .format(DateTime.parse(data.updateTime!));
                            if (data.trangThaiYc == 'A') {
                              _color = green;
                              _trangthai = 'Đồng ý';
                            } else if (data.trangThaiYc == 'C') {
                              _color = grey;
                              _trangthai = 'Chờ Duyệt';
                            } else {
                              _color = red;
                              _trangthai = 'Từ chối';
                            }
                            return DataRow(cells: [
                              DataCell(Center(
                                  child: Text((index + 1).toString(),
                                      style: style_text_Table_small))),
                              DataCell(Center(
                                  child: SelectableText(data.cntrno.toString(),
                                      style: style_text_Table_small))),
                              DataCell(Center(
                                child: Text(data.nguoiGui.toString(),
                                    style: style_text_Table_small),
                              )),
                              DataCell(Center(
                                child: Container(
                                  width: 150,
                                  padding: EdgeInsets.only(top: 10, bottom: 10),
                                  child: ElevatedButton(
                                    onPressed: () {
                                      fetchApprovalDetail(
                                          list_filter_approval[index]
                                              .id
                                              .toString());
                                      id_request_for_image =
                                          list_filter_approval[index].id;
                                    },
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: _color,
                                        shape: const RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(20)))),
                                    child: Text(
                                      _trangthai.toString(),
                                      style: text_style_status,
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                              )),
                              DataCell(Center(
                                child: Text(_dt.toString(),
                                    style: style_text_Table_small),
                              )),
                            ]);
                          })),
                    ),
                  ]),
            ),
          );
        }
        return const Text('');
      },
    );
  }

  Future<void> fetchApprovalDetail(String id) async {
    var url = '$SERVER/Requests/$id';
    if (id.isNotEmpty) {
      final response = await http.get(Uri.parse(url), headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $tokenAuthorize",
      });
      if (response.statusCode == 200) {
        var body = response.body;
        print('Data list approval Detail');
        final dataDetail = jsonDecode(body);
        id_ApprovalDetail = dataDetail['id'];
        tenYeuCau_ApprovalDetail = dataDetail['tenYeuCau'];
        noiDung_ApprovalDetail = dataDetail['noiDung'];
        cntrno_ApprovalDetail = dataDetail['cntrno'];
        sizeType_ApprovalDetail = dataDetail['sizeType'];
        trangThaiYc_ApprovalDetail = dataDetail['trangThaiYc'];
        noteHangTau_ApprovalDetail = dataDetail['noteHangTau'];
        updateTime_ApprovalDetail = dataDetail['updateTime'];
        // if (dataDetail['imageName'] != null) {
        //   String base64imageName = dataDetail['imageName'];
        //   // print(base64imageName.length);
        //   if (base64imageName.length % 4 > 0) {
        //     base64imageName += '=' * (4 - base64imageName.length % 4);
        //     setState(() {
        //       decodedbytes = base64.decode(base64imageName);
        //     });
        //   } else {
        //     setState(() {
        //       decodedbytes = base64.decode(base64imageName);
        //     });
        //   }
        // } else {
        //   decodedbytes = null;
        // }
        // ignore: use_build_context_synchronously
        PopUpApproval(context);
      } else {
        throw Exception('Error');
      }
    } else {
      throw Exception('Failed to load');
    }
  }
}
