import 'package:flutter/material.dart';
import 'package:web_booking/constants/color.dart';
import 'package:web_booking/constants/style.dart';
import 'package:web_booking/constants/variable.dart';
import 'package:web_booking/model/list_request/model_list_request.dart';
import 'package:web_booking/screen/list_request/data/data_request.dart';

// ignore: must_be_immutable
class ListRequestPage extends StatefulWidget {
  @override
  State<ListRequestPage> createState() => _ListRequestPageState();
}

class _ListRequestPageState extends State<ListRequestPage> {
  DataTableRequest _dataRequest = DataTableRequest(data: []);
  DataTableRequest _list_filter = DataTableRequest(data: []);

  TextEditingController _search_text = TextEditingController();

  @override
  void initState() {
    super.initState();
    try {
      ListRequest().fetchListRequest().then((data) => {
            setState(() {
              _dataRequest = DataTableRequest(data: data);
              _list_filter = _dataRequest;
            })
          });
    } catch (e) {
      print('Error call data ListRequest: $e');
    }
  }

  void _filterRequest() {
    try {
      setState(() {
        final filterData = _dataRequest.list_filter(_search_text.text);
        _list_filter = DataTableRequest(data: filterData);
      });
    } catch (e) {
      print('Error call filter data ListRequest: $e');
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
                    "List Request",
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
                        decoration: const InputDecoration(
                            hintText: 'Search', border: InputBorder.none),
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
                    sortColumnIndex: 0,
                    // sortAscending: true,
                    dataRowMaxHeight: 60,
                    columnSpacing: 16,
                    columns: [
                      DataColumn(
                        label: Container(
                          width: 35,
                          child: Text(
                            'STT',
                            style: style_text_Table_small_bold,
                          ),
                        ),
                      ),
                      DataColumn(
                        label: Container(
                          width: 150,
                          child: Text(
                            'Tên yêu cầu',
                            style: style_text_Table_small_bold,
                          ),
                        ),
                      ),
                      DataColumn(
                        label: Container(
                          width: 110,
                          child: Text('Số Container',
                              style: style_text_Table_small_bold),
                        ),
                      ),
                      DataColumn(
                        label: Container(
                          width: 60,
                          child: Text(
                            'Kích cỡ',
                            style: style_text_Table_small_bold,
                          ),
                        ),
                      ),
                      DataColumn(
                        label: SizedBox(
                          width: 300,
                          child: Text(
                            'Nội dung yêu cầu và cam kết khách hàng',
                            style: style_text_Table_small_bold,
                          ),
                        ),
                      ),
                      DataColumn(
                        label: SizedBox(
                          width: 400,
                          child: Text(
                            'Ghi chú hãng tàu',
                            style: style_text_Table_small_bold,
                          ),
                        ),
                      ),
                      DataColumn(
                        label: Container(
                          width: 120,
                          child: Center(
                            child: Center(
                              child: InkWell(
                                onTap: () {
                                  setState(() {
                                    _list_filter = DataTableRequest(
                                        data: _dataRequest
                                            .filter_trangthaiYC('C'));
                                    _search_text.text = 'Chờ duyệt';
                                  });
                                },
                                child: Text('Trạng thái',
                                    style: style_text_Table_small_bold),
                              ),
                            ),
                          ),
                        ),
                      ),
                      DataColumn(
                        label: Container(
                          width: 130,
                          child: Text(
                            'Ngày cập nhật',
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
