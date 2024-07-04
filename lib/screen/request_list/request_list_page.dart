import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:web_booking/constants/color.dart';
import 'package:web_booking/constants/style.dart';
import 'package:web_booking/constants/variable.dart';
import 'package:web_booking/model/list_request/model_request_list.dart';
import 'package:web_booking/screen/request_list/data/data_request.dart';
// import 'package:easy_localization/easy_localization.dart';

// ignore: must_be_immutable
class RequestListPage extends StatefulWidget {
  @override
  State<RequestListPage> createState() => _RequestListPageState();
}

class _RequestListPageState extends State<RequestListPage> {
  DataTableRequest _dataRequest = DataTableRequest(data: []);
  DataTableRequest _list_filter = DataTableRequest(data: []);

  TextEditingController _search_text = TextEditingController();

  @override
  void initState() {
    super.initState();
    try {
      RequestList().fetchRequestList().then((data) => {
            setState(() {
              _dataRequest = DataTableRequest(data: data);
              _list_filter = _dataRequest;
            })
          });
      // print('initial Request List');
    } catch (e) {
      print('Error call data RequestList: $e');
    }
  }

  void _filterRequest() {
    try {
      setState(() {
        final filterData = _dataRequest.list_filter(_search_text.text);
        _list_filter = DataTableRequest(data: filterData);
      });
    } catch (e) {
      print('Error call filter data RequestList: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // use sizedbox to content always start on top
      height: deviceHeight(context),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  width: deviceWidth(context),
                  alignment: Alignment.center,
                  child: Text(
                    "request list".tr,
                    style: style_title_page,
                  ),
                ),
                Container(
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
                  margin: const EdgeInsets.symmetric(vertical: 16),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: Colors.black45)),
                    child: ListTile(
                      leading: const Icon(Icons.search),
                      title: TextField(
                        controller: _search_text,
                        decoration: InputDecoration(
                            hintText: 'search'.tr, border: InputBorder.none),
                        onChanged: (value) {
                          setState(() {
                            _filterRequest();
                          });
                        },
                      ),
                      trailing: IconButton(
                        icon: const Icon(Icons.cancel),
                        onPressed: () {
                          setState(() {
                            _search_text.clear();
                            _filterRequest();
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
                    border: Border.all(color: blue.withOpacity(.4), width: .5),
                    boxShadow: [
                      BoxShadow(
                          offset: const Offset(0, 6),
                          color: blue.withOpacity(.1),
                          blurRadius: 12)
                    ],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: PaginatedDataTable(
                    // headingRowColor:
                    //     MaterialStateColor.resolveWith((states) => lightGrey),
                    sortColumnIndex: 0,
                    // sortAscending: true,
                    dataRowMaxHeight: 60,
                    columnSpacing: 16,
                    columns: [
                      DataColumn(
                        label: SizedBox(
                          width: 40,
                          child: Center(
                            child: Text(
                              'seq'.tr,
                              style: style_text_Table_small_bold,
                            ),
                          ),
                        ),
                      ),
                      DataColumn(
                        label: Container(
                          width: 150,
                          child: Text(
                            'request name'.tr,
                            style: style_text_Table_small_bold,
                          ),
                        ),
                      ),
                      DataColumn(
                        label: Container(
                          width: 110,
                          child: Text('container'.tr,
                              style: style_text_Table_small_bold),
                        ),
                      ),
                      DataColumn(
                        label: Container(
                          width: 60,
                          child: Text(
                            'size'.tr,
                            style: style_text_Table_small_bold,
                          ),
                        ),
                      ),
                      // DataColumn(
                      //   label: SizedBox(
                      //     width: 300,
                      //     child: Text(
                      //       'content commitment'.tr,
                      //       style: style_text_Table_small_bold,
                      //     ),
                      //   ),
                      // ),
                      // DataColumn(
                      //   label: SizedBox(
                      //     width: 400,
                      //     child: Center(
                      //       child: Text(
                      //         'note'.tr,
                      //         style: style_text_Table_small_bold,
                      //       ),
                      //     ),
                      //   ),
                      // ),
                      DataColumn(
                        label: Center(
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                _list_filter = DataTableRequest(
                                    data: _dataRequest
                                        .filter_trangthaiYC('C'));
                                _search_text.text = 'Chờ duyệt';
                              });
                            },
                            child: Text('status'.tr,
                                style: style_text_Table_small_bold),
                          ),
                        ),
                      ),
                      DataColumn(
                        label: Container(
                          width: 130,
                          child: Text(
                            'update time'.tr,
                            style: style_text_Table_small_bold,
                          ),
                        ),
                      ),
                    ],
                    source: _list_filter,
                  ),
                ),
              ]),
        ),
      ),
    );
  }
}
