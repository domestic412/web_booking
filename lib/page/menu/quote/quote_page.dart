import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_popup/flutter_popup.dart';
import 'package:get/get.dart';
import 'package:web_booking/constants/color.dart';
import 'package:web_booking/constants/style.dart';
import 'package:web_booking/constants/variable.dart';
import 'package:web_booking/model/eqc_quote/model_init_quote.dart';
import 'package:web_booking/model/eqc_quote/model_quote_list.dart';
import 'package:web_booking/model/eqc_quote/storage_controller/init_quote_controller.dart';
import 'package:web_booking/widgets/appbar/appbar.dart';
import 'package:web_booking/widgets/footer.dart';

import 'data_quote_list/data_quote_list.dart';

class QuoteListPage extends StatefulWidget {
  const QuoteListPage({super.key});

  @override
  State<QuoteListPage> createState() => _QuoteListPageState();
}

TextEditingController input = TextEditingController();
final ScrollController horizontalScroll = ScrollController();
double width_20 = 20;

class _QuoteListPageState extends State<QuoteListPage> {
  DataTableQuote _dataQuote = DataTableQuote(data: []);
  DataTableQuote _list_filter = DataTableQuote(data: []);

  TextEditingController _search_quote = TextEditingController();

  @override
  void initState() {
    super.initState();

    quoteController.fromDate_send.value =
        changeDatetoSend(date: DateTime.now().subtract(Duration(days: 30)));
    quoteController.fromDate_text.value =
        changeDatetoShow(date: DateTime.now().subtract(Duration(days: 30)));

    quoteController.toDate_send.value =
        changeDatetoSend(date: DateTime.now().add(Duration(days: 1)));
    quoteController.toDate_text.value =
        changeDatetoShow(date: DateTime.now().add(Duration(days: 1)));
    EQCQuoteList()
        .fetchQuoteList(quoteController.fromDate_send.value,
            quoteController.toDate_send.value)
        .then((data) {
      setState(() {
        _dataQuote = DataTableQuote(data: data);
        _list_filter = _dataQuote;
        // print('initial data history');
      });
    });
  }

  void refreshQuoteList() {
    Get.back();
    EQCQuoteList()
        .fetchQuoteList(quoteController.fromDate_send.value,
            quoteController.toDate_send.value)
        .then((data) {
      setState(() {
        _dataQuote = DataTableQuote(data: data);
        _list_filter = _dataQuote;
        // print('initial data history');
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: WidgetAppBar(),
      backgroundColor: backgroundColor,
      bottomSheet: Footer(),
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // AppbarWidget(),
              appbar(),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Container(
                  margin: EdgeInsets.fromLTRB(10, 10, 10, 40),
                  decoration: BoxDecoration(
                      color: contentColor,
                      borderRadius: BorderRadius.circular(10)),
                  // width: 1004,
                  constraints: BoxConstraints(minWidth: 1004, maxWidth: 1400),
                  // width: FWidth,
                  padding: const EdgeInsets.fromLTRB(5, 10, 5, 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Quote List',
                        style: style_title_page,
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: white,
                                border: Border.all(
                                    color: blue.withOpacity(.4), width: .5),
                                boxShadow: [
                                  BoxShadow(
                                      offset: const Offset(0, 6),
                                      color: blue.withOpacity(.1),
                                      blurRadius: 12)
                                ],
                                borderRadius: BorderRadius.circular(8),
                              ),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 8),
                              child: Row(
                                children: [
                                  Text('From Date'),
                                  CustomPopup(
                                    showArrow: false,
                                    content: SizedBox(
                                      width: 300,
                                      child: CalendarDatePicker(
                                        initialDate: dateFormat.parse(
                                            quoteController
                                                .fromDate_text.value),
                                        firstDate: DateTime(2024),
                                        lastDate: DateTime(2123),
                                        onDateChanged: (value) {
                                          quoteController.fromDate_text.value =
                                              DateFormat('dd/MM/yyyy')
                                                  .format(value);
                                          quoteController.fromDate_send.value =
                                              DateFormat('MM/dd/yyyy')
                                                  .format(value);
                                          refreshQuoteList();
                                        },
                                      ),
                                    ),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          border: Border.all(color: grey),
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      margin:
                                          EdgeInsets.symmetric(horizontal: 10),
                                      padding: const EdgeInsets.all(10),
                                      child: Text(
                                          quoteController.fromDate_text.value),
                                    ),
                                  ),
                                  Text('To Date'),
                                  CustomPopup(
                                    showArrow: false,
                                    content: SizedBox(
                                      width: 300,
                                      child: CalendarDatePicker(
                                        initialDate: dateFormat.parse(
                                            quoteController.toDate_text.value),
                                        firstDate: DateTime(2024),
                                        lastDate: DateTime(2123),
                                        onDateChanged: (value) {
                                          quoteController.toDate_text.value =
                                              DateFormat('dd/MM/yyyy')
                                                  .format(value);
                                          quoteController.toDate_send.value =
                                              DateFormat('MM/dd/yyyy')
                                                  .format(value);
                                          refreshQuoteList();
                                        },
                                      ),
                                    ),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          border: Border.all(color: grey),
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 10),
                                      padding: const EdgeInsets.all(10),
                                      child: Text(
                                          quoteController.toDate_text.value),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: white,
                                border: Border.all(
                                    color: blue.withOpacity(.4), width: .5),
                                boxShadow: [
                                  BoxShadow(
                                      offset: const Offset(0, 6),
                                      color: blue.withOpacity(.1),
                                      blurRadius: 12)
                                ],
                                borderRadius: BorderRadius.circular(8),
                              ),
                              padding: const EdgeInsets.all(8),
                              margin: const EdgeInsets.symmetric(
                                  vertical: 16, horizontal: 10),
                              child: Container(
                                constraints: BoxConstraints(
                                    minWidth: 500, maxWidth: 750),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    border: Border.all(color: Colors.black45)),
                                child: ListTile(
                                  dense: true,
                                  // leading: const Icon(Icons.search),
                                  title: TextField(
                                    controller: _search_quote,
                                    decoration: const InputDecoration(
                                        hintText: 'Search',
                                        border: InputBorder.none,
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
                            ElevatedButton(
                              onPressed: () {
                                quoteController.listInputQuoteDetail.value = [];
                                quoteController
                                    .listInputQuoteDetail_show.value = [];
                                quoteController.countRow.value = 0;
                                // quoteController.initEQC = InitEQCQuote()
                                //     .fetchInitQuote(eqcQuoteId_new);
                                InitEQCQuote().fetchInitQuote(eqcQuoteId_new);
                                // controller.selectWidget.value = quoteAE;
                                // Get.to(() => AEQuotePage());
                              },
                              style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStatePropertyAll<Color>(
                                          Colors.orange),
                                  minimumSize:
                                      MaterialStateProperty.all(Size(100, 40))),
                              child: Text('Add Quote'),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        // width: deviceWidth(context),
                        width: 1400,
                        // constraints:
                        //     BoxConstraints(minWidth: 1004, maxWidth: 1400),
                        decoration: BoxDecoration(
                          color: white,
                          border: Border.all(
                              color: blue.withOpacity(.4), width: .5),
                          boxShadow: [
                            BoxShadow(
                                offset: const Offset(0, 6),
                                color: blue.withOpacity(.1),
                                blurRadius: 12)
                          ],
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: PaginatedDataTable(
                          showCheckboxColumn: false,
                          sortColumnIndex: 0,
                          dataRowMaxHeight: 50,
                          columnSpacing: 16,
                          columns: const [
                            DataColumn(
                              label: SizedBox(
                                width: 40,
                                child: Center(
                                  child: Text(
                                    'Seq',
                                    // style: style_text_Table_small_bold,
                                  ),
                                ),
                              ),
                            ),
                            DataColumn(
                              label: Text(
                                'Port/Depot',
                                // style: style_text_Table_small_bold,
                              ),
                            ),
                            DataColumn(
                              label: Text(
                                'Quote No.',
                                // style: style_text_Table_small_bold,
                              ),
                            ),
                            DataColumn(
                              label: Text(
                                'Date',
                                // style: style_text_Table_small_bold,
                              ),
                            ),
                            DataColumn(
                              label: Text(
                                'Ccy',
                                // style: style_text_Table_small_bold,
                              ),
                            ),
                            DataColumn(
                              label: Text(
                                'ExRate',
                                // style: style_text_Table_small_bold,
                              ),
                            ),
                            DataColumn(
                              label: Text(
                                'Status',
                                // style: style_text_Table_small_bold,
                              ),
                            ),
                            DataColumn(
                              label: Text(
                                'User',
                                // style: style_text_Table_small_bold,
                              ),
                            ),
                            DataColumn(
                              label: Text(
                                'Approved By',
                                // style: style_text_Table_small_bold,
                              ),
                            ),
                            DataColumn(
                              label: Text(
                                'Approved Date',
                                // style: style_text_Table_small_bold,
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
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _filterQuote() {
    setState(() {
      final filterData = _dataQuote.list_filter(_search_quote.text);
      _list_filter = DataTableQuote(data: filterData);
      // print('filter data history');
    });
  }
}
