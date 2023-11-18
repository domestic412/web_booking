import 'package:flutter/material.dart';
import 'package:web_booking/constants/color.dart';
import 'package:web_booking/constants/style.dart';
import 'package:web_booking/constants/variable.dart';
import 'package:web_booking/model/list_history/model_list_history.dart';
import 'package:web_booking/screen/history_list/data/data_list_history.dart';

// ignore: must_be_immutable
class ListHistoryPage extends StatefulWidget {
  @override
  State<ListHistoryPage> createState() => _ListHistoryPageState();
}

class _ListHistoryPageState extends State<ListHistoryPage> {
  DataTableHistory _dataHistoty = DataTableHistory(data: []);
  DataTableHistory _list_filter = DataTableHistory(data: []);

  TextEditingController _search_history = TextEditingController();

  @override
  void initState() {
    super.initState();
    History().fetchListHistory().then((data) {
      setState(() {
        _dataHistoty = DataTableHistory(data: data);
        _list_filter = _dataHistoty;
        print('initial data history');
      });
    });
  }

  void _filterHistory() {
    setState(() {
      final filterData = _dataHistoty.list_filter(_search_history.text);
      _list_filter = DataTableHistory(data: filterData);
      print('filter data history');
    });
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
                    "List History",
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
                        controller: _search_history,
                        decoration: const InputDecoration(
                            hintText: 'Search', border: InputBorder.none),
                        onChanged: (value) {
                          _filterHistory();
                        },
                      ),
                      trailing: IconButton(
                        icon: const Icon(Icons.cancel),
                        onPressed: () {
                          _search_history.clear();
                          _filterHistory();
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
                    dataRowMaxHeight: 50,
                    columnSpacing: 16,
                    columns: [
                      DataColumn(
                        label: Text(
                          'STT',
                          style: style_text_Table_small_bold,
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          'Số Container',
                          style: style_text_Table_small_bold,
                        ),
                      ),
                      DataColumn(
                        label: Text('Size', style: style_text_Table_small_bold),
                      ),
                      DataColumn(
                        label: Text(
                          'Số lần kết hợp',
                          style: style_text_Table_small_bold,
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          'Lần KH',
                          style: style_text_Table_small_bold,
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          'Lần CP',
                          style: style_text_Table_small_bold,
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          'Chất lượng',
                          style: style_text_Table_small_bold,
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          'Trạng thái',
                          style: style_text_Table_small_bold,
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          'Shipper',
                          style: style_text_Table_small_bold,
                        ),
                      ),
                      DataColumn(
                        label: Expanded(
                            child: Center(
                                child: Text(
                          'Kết quả',
                          style: style_text_Table_small_bold,
                        ))),
                      ),
                      DataColumn(
                        label: Text(
                          'Checker',
                          style: style_text_Table_small_bold,
                        ),
                      ),
                      DataColumn(
                        label: Text('Thời gian',
                            style: style_text_Table_small_bold),
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
