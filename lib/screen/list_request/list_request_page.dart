import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:web_booking/constants/color.dart';
import 'package:web_booking/constants/global.dart';
import 'package:web_booking/constants/text.dart';
import 'package:web_booking/constants/variable.dart';
import 'package:web_booking/model/list_request/model_list_request.dart';


// ignore: must_be_immutable
class ListRequestPage extends StatefulWidget {

  @override
  State<ListRequestPage> createState() => _ListRequestPageState();
}

class _ListRequestPageState extends State<ListRequestPage> {

  Future<List<ListRequestResponse>>? listRequest;
  List<ListRequestResponse> list_filter = [];

  TextEditingController search_text = TextEditingController();

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
  return FutureBuilder<List<ListRequestResponse>> (
    future: listRequest,
    builder:(context, snapshot) {
      if (snapshot.hasData) {
        print('show data list request');
        if (search_text.text.isEmpty) {
          list_filter = snapshot.data!;
          print('filter show data list request');
        }
        return Container(
          height: deviceHeight(context),
          padding: EdgeInsets.only(left: deviceWidth(context)*0.02, right: deviceWidth(context)*0.02),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget> [
                SizedBox(height: 10,),
                Card(
                  child: ListTile(
                    leading: const Icon(Icons.search),
                    title: TextField(
                      controller: search_text,
                      decoration: const InputDecoration(
                        hintText: 'Search', border: InputBorder.none
                        ),
                      onChanged: (value) {
                        setState(() {
                          list_filter = snapshot.data!.where((item) => item.cntrno!.contains(value.toUpperCase())).toList();
                        });
                      },
                      ),
                      trailing: IconButton(
                        icon: const Icon(Icons.cancel),
                        onPressed: () {
                          setState(() {
                            search_text.clear();
                            // list_filter = snapshot.data!;
                          });
                        },
                      ),
                  ),),
                DataTable(
                  // sortColumnIndex: 3,
                  // sortAscending: true,
                  columnSpacing: deviceWidth(context)*0.02,
                  columns: [
                          DataColumn(
                            label: Expanded(child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('STT', style: text_Table_small,),
                              ],
                            )),
                          ),
                          DataColumn(
                            label: Expanded(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('Số container', style: text_Table_small),
                                ],
                              ),
                            ),
                          ),
                          DataColumn(
                            label: Expanded(
                              child: InkWell(
                                onTap: (){
                                  setState(() {
                            list_filter = snapshot.data!.where(
                              (item) => item.trangThaiYc!.contains('C')
                              ).toList();
                              // print(list_filter);
                              search_text.text = 'Chờ duyệt';
                                  });
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children:[
                                    Text('Kết quả', style: text_Table_small)
                                    ]
                                  ),
                              ),
                            ),
                          ),
                        ],
                        rows: List.generate(list_filter.length, (index) {
                          var data = list_filter[index];
                          id_ListRequest = data.id;
                          cntrno_ListRequest = data.cntrno;
                          trangThaiYc_ListRequest = data.trangThaiYc;
                          if (trangThaiYc_ListRequest == 'A') {
                            _color = green;
                            _trangthai = 'Đồng ý';
                          } else if (trangThaiYc_ListRequest == 'C'){
                            _color = grey;
                            _trangthai = 'Chờ xử lý';
                          }
                          else {
                            _color = red;
                            _trangthai = 'Từ chối';
                          }
                          return DataRow(cells: [
                            DataCell(Container(
                              width: deviceWidth(context)*0.15,
                              child: Center(child: Text((index+1).toString(), style: text_Table_small,)))),
                            DataCell(Container(
                              width: deviceWidth(context)*0.3,
                              child: Center(child: SelectableText(cntrno_ListRequest.toString(), style: text_Table_small)))),
                            DataCell(Container(
                              width: deviceWidth(context)*0.4,
                              child: Center(
                                child: Container(
                                  width: 110,
                                  padding: EdgeInsets.only(top: 10, bottom: 10),
                                  child: ElevatedButton(
                                    onPressed: () {
                                      // fetchListRequestDetail(list_filter[index].id.toString());      /// here
                                      // setState(() {
                                        id_request = list_filter[index].id.toString();
                                        print(id_request);
                                      // });
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: _color,
                                      shape: const RoundedRectangleBorder(
                                        borderRadius:
                                          BorderRadius.all(Radius.circular(20)))),
                                    child: Text(_trangthai.toString(), style: text_style_status, textAlign: TextAlign.center,),
                                  ),
                                ),
                              ),
                            )),
                          ]);
                        })
                        ),
                        ]
            ),
          ),
        );
      } 
      return Text('');
  }
  ,);}


  // Future<void> fetchListRequestDetail(String id) async {
  //   var url = '$SERVER/Requests/$id';
  //   if (id.isNotEmpty) {
  //     // EasyLoading.show(
  //     //   status: 'Loading...',
  //     //   maskType: EasyLoadingMaskType.black,
  //     //   dismissOnTap: true,
  //     //   );
  //     final response = await http.get(Uri.parse(url),);
  //     if (response.statusCode == 200) {
  //       // EasyLoading.dismiss();
  //       var body = response.body;
  //       print('Data List Request Detail');
  //       final dataDetail = jsonDecode(body);
  //       tenYeuCau_ListRequestDetail = dataDetail['tenYeuCau'];
  //       noiDung_ListRequestDetail = dataDetail['noiDung'];
  //       cntrno_ListRequestDetail = dataDetail['cntrno'];
  //       sizeType_ListRequestDetail = dataDetail['sizeType'];
  //       trangThaiYc_ListRequestDetail = dataDetail['trangThaiYc'];
  //       noteHangTau_ListRequestDetail = dataDetail['noteHangTau'];
  //       updateTime_ListRequestDetail = dataDetail['updateTime'];

  //       PopUpListRequest(context);
  //       } else {
  //         EasyLoading.dismiss();
  //         throw Exception('Cannot connect to server');
  //       }
  //   } else {
  //     throw Exception('Failed to load because no have ID');
  //   }
  // }

  
}
