import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:web_booking/constants/color.dart';
import 'package:web_booking/constants/global.dart';
import 'package:web_booking/constants/style.dart';
import 'package:web_booking/constants/variable.dart';
import 'package:web_booking/model/list_request/model_list_request.dart';
import 'package:intl/intl.dart';
import 'package:web_booking/screen/list_request/popUp_detail/detail_list_request.dart';

// ignore: must_be_immutable
class ListRequestPage extends StatefulWidget {
  @override
  State<ListRequestPage> createState() => _ListRequestPageState();
}

class _ListRequestPageState extends State<ListRequestPage> {
  Future<List<ListRequestResponse>>? listRequest;
  List<ListRequestResponse> _list_filter = []; //comment when test

  TextEditingController _search_text = TextEditingController();

  Color? _color;
  String? _trangthai;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // fetch data list request
    listRequest = ListRequestResponse().fetchListRequest();
  }

  @override
  Widget build(BuildContext context) {
    return DataRequest();
  }

  FutureBuilder<List<ListRequestResponse>> DataRequest() {
    return FutureBuilder<List<ListRequestResponse>>(
      future: listRequest,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasData) {
          print('show data list request');
          if (_search_text.text.isEmpty) {
            _list_filter = snapshot.data!;
            print('filter show data list request');
          }
          return SizedBox(
            height: deviceHeight(context),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      width: deviceWidth(context),
                      alignment: Alignment.center,
                      padding: const EdgeInsets.only(top: 32),
                      child: Text(
                        "List Request",
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
                                _list_filter = snapshot.data!
                                    .where((item) => item.cntrno!
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
                          // sortAscending: true,
                          dataRowMaxHeight: 80,
                          columnSpacing: 16,
                          columns: [
                            DataColumn(
                              label: Expanded(
                                child: Center(
                                  child: Text(
                                    'STT',
                                    style: style_text_Table_small_bold,
                                  ),
                                ),
                              ),
                            ),
                            DataColumn(
                              label: Expanded(
                                  child: Center(
                                      child: Text(
                                'Tên yêu cầu',
                                style: style_text_Table_small_bold,
                              ))),
                            ),
                            DataColumn(
                              label: Expanded(
                                  child: Center(
                                      child: Text('Số Container',
                                          style: style_text_Table_small_bold))),
                            ),
                            DataColumn(
                              label: Expanded(
                                  child: Center(
                                      child: Text(
                                'Kích cỡ',
                                style: style_text_Table_small_bold,
                              ))),
                            ),
                            DataColumn(
                              label: Expanded(
                                  child: Center(
                                      child: Text(
                                'Nội dung yêu cầu và cam kết khách hàng',
                                style: style_text_Table_small_bold,
                              ))),
                            ),
                            DataColumn(
                              label: Expanded(
                                  child: Center(
                                      child: Text(
                                'Ghi chú hãng tàu',
                                style: style_text_Table_small_bold,
                              ))),
                            ),
                            DataColumn(
                              label: Expanded(
                                child: Center(
                                  child: InkWell(
                                    onTap: () {
                                      setState(() {
                                        _list_filter = snapshot.data!
                                            .where((item) =>
                                                item.trangThaiYc!.contains('C'))
                                            .toList();
                                        _search_text.text = 'Chờ duyệt';
                                      });
                                    },
                                    child: Center(
                                        child: Text('Trạng thái',
                                            style:
                                                style_text_Table_small_bold)),
                                  ),
                                ),
                              ),
                            ),
                            DataColumn(
                              label: Expanded(
                                  child: Center(
                                      child: Text(
                                'Ngày cập nhật',
                                style: style_text_Table_small_bold,
                              ))),
                            ),
                          ],
                          rows: List.generate(_list_filter.length, (index) {
                            var data = _list_filter[index];
                            String dt = DateFormat("yyyy-MM-dd  hh:mm")
                                .format(DateTime.parse(data.updateTime!));
                            // id_ListRequest = data.id;
                            // cntrno_ListRequest = data.cntrno;
                            trangThaiYc_ListRequest = data.trangThaiYc;
                            if (trangThaiYc_ListRequest == 'A') {
                              _color = green;
                              _trangthai = 'Đồng ý';
                            } else if (trangThaiYc_ListRequest == 'C') {
                              _color = grey;
                              _trangthai = 'Chờ xử lý';
                            } else {
                              _color = red;
                              _trangthai = 'Từ chối';
                            }
                            return DataRow(cells: [
                              DataCell(Center(
                                child: Text(
                                  (index + 1).toString(),
                                  style: style_text_Table_small,
                                ),
                              )),
                              DataCell(Center(
                                  child: SelectableText(
                                      data.tenYeuCau.toString(),
                                      style: style_text_Table_small))),
                              DataCell(Center(
                                  child: SelectableText(data.cntrno.toString(),
                                      style: style_text_Table_small))),
                              DataCell(Center(
                                  child: SelectableText(
                                      data.sizeType.toString(),
                                      style: style_text_Table_small))),
                              DataCell(Center(
                                  child: SelectableText(data.noiDung.toString(),
                                      style: style_text_Table_small))),
                              DataCell(Center(
                                  child: SelectableText(
                                      data.noteHangTau.toString(),
                                      style: style_text_Table_small))),
                              DataCell(Center(
                                child: Container(
                                  width: 110,
                                  padding: const EdgeInsets.only(
                                      top: 10, bottom: 10),
                                  child: ElevatedButton(
                                    onPressed: () {
                                      fetchListRequestDetail(
                                          _list_filter[index].id.toString());
                                      // setState(() {
                                      id_request =
                                          _list_filter[index].id.toString();
                                      // });
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
                                  child: SelectableText(dt,
                                      style: style_text_Table_small))),
                            ]);
                          })),
                    ),
                  ]),
            ),
          );
        }
        return Text('');
      },
    );
  }

  Future<void> fetchListRequestDetail(String id) async {
    var url = '$SERVER/Requests/$id';
    if (id.isNotEmpty) {
      // EasyLoading.show(
      //   status: 'Loading...',
      //   maskType: EasyLoadingMaskType.black,
      //   dismissOnTap: true,
      //   );
      final response = await http.get(
        Uri.parse(url),
      );
      if (response.statusCode == 200) {
        // EasyLoading.dismiss();
        var body = response.body;
        print('Data List Request Detail');
        final dataDetail = jsonDecode(body);
        tenYeuCau_ListRequestDetail = dataDetail['tenYeuCau'];
        noiDung_ListRequestDetail = dataDetail['noiDung'];
        cntrno_ListRequestDetail = dataDetail['cntrno'];
        sizeType_ListRequestDetail = dataDetail['sizeType'];
        trangThaiYc_ListRequestDetail = dataDetail['trangThaiYc'];
        noteHangTau_ListRequestDetail = dataDetail['noteHangTau'];
        updateTime_ListRequestDetail = dataDetail['updateTime'];
        PopUpListRequest(context);
      } else {
        // EasyLoading.dismiss();
        throw Exception('Cannot connect to server');
      }
    } else {
      throw Exception('Failed to load because no have ID');
    }
  }
}
