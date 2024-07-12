import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:web_booking/constants/color.dart';
import 'package:web_booking/constants/style.dart';
import 'package:web_booking/constants/variable.dart';
import 'package:web_booking/model/eqc_quote/model_init_quote.dart';
import 'package:web_booking/model/eqc_quote/model_quote_list.dart';
import 'package:web_booking/model/eqc_quote/storage_controller/init_quote_controller.dart';

import '../../controllers/sidebar_controller.dart';
import 'data/data_quote_list.dart';

// import 'package:easy_localization/easy_localization.dart';

// ignore: must_be_immutable
class QuoteListPage extends StatefulWidget {
  @override
  State<QuoteListPage> createState() => _QuoteListPageState();
}

class _QuoteListPageState extends State<QuoteListPage> {
  DataTableQuote _dataQuote = DataTableQuote(data: []);
  DataTableQuote _list_filter = DataTableQuote(data: []);

  TextEditingController _search_quote = TextEditingController();

  @override
  void initState() {
    super.initState();
    EQCQuoteList().fetchQuoteList('06/01/2024', '06/27/2024').then((data) {
      setState(() {
        _dataQuote = DataTableQuote(data: data);
        _list_filter = _dataQuote;
        // print('initial data history');
      });
    });
  }

  void _filterQuote() {
    setState(() {
      final filterData = _dataQuote.list_filter(_search_quote.text);
      _list_filter = DataTableQuote(data: filterData);
      // print('filter data history');
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
                Stack(
                  children: [
                    // DownloadButtonHistory(),
                    ElevatedButton(
          onPressed: () {
            // controller.selectWidget.value = quoteList;
            // quoteController.initEQC.value = InitEQCQuote().fetchInitQuote(eqcQuoteId_new);
            quoteController.initEQC = InitEQCQuote().fetchInitQuote(eqcQuoteId_new);
            controller.selectWidget.value = quoteAE;
          },
          style: ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll<Color>(Colors.orange),
                          minimumSize: MaterialStateProperty.all(Size(100, 40))
                        ),
          child: Text('Add Quote'),
        ),
                  Center(
                    child: Text(
                      "title quote list".tr,
                      style: style_title_page,
                    ),
                  ),]
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
                  padding: const EdgeInsets.all(8),
                  margin: const EdgeInsets.symmetric(vertical: 16),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: Colors.black45)),
                    child: ListTile(
                      dense: true,
                      leading: const Icon(Icons.search),
                      title: TextField(
                        controller: _search_quote,
                        decoration: const InputDecoration(
                            hintText: 'Search', border: InputBorder.none,
                            isDense: true,
                            contentPadding: EdgeInsets.all(0)),
                        onChanged: (value) {
                          _filterQuote();
                        },
                      ),
                      trailing: IconButton(
                        icon: const Icon(Icons.cancel),
                        onPressed: () {
                          _search_quote.clear();
                          _filterQuote();
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
                    dataRowMaxHeight: 50,
                    columnSpacing: 16,
                    rowsPerPage: 5,
                    columns: [
                      DataColumn(
                        label: SizedBox(
                          width: 40,
                          child: Center(
                            child: Text(
                              'Seq',
                              style: style_text_Table_small_bold,
                            ),
                          ),
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          'Port/Depot',
                          style: style_text_Table_small_bold,
                        ),
                      ),
                      DataColumn(
                        label: Text('Quote No.', style: style_text_Table_small_bold),
                      ),
                      DataColumn(
                        label: Text(
                          'Date',
                          style: style_text_Table_small_bold,
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          'Ccy',
                          style: style_text_Table_small_bold,
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          'ExRate',
                          style: style_text_Table_small_bold,
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          'Status',
                          style: style_text_Table_small_bold,
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          'User',
                          style: style_text_Table_small_bold,
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          'Approved By',
                          style: style_text_Table_small_bold,
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          'Approved Date',
                          style: style_text_Table_small_bold,
                        ),
                      ),
                      // DataColumn(
                      //   label: Text(
                      //     'Details',
                      //     style: style_text_Table_small_bold,
                      //   ),
                      // ),
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
