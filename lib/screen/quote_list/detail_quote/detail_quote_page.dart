import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:web_booking/constants/color.dart';
import 'package:web_booking/constants/style.dart';
import 'package:web_booking/constants/variable.dart';
import 'package:web_booking/controllers/sidebar_controller.dart';
import 'package:web_booking/model/eqc_quote/model_quote_detail.dart';
import 'package:web_booking/model/eqc_quote/storage_controller/init_quote_controller.dart';

import 'data/data_detail_quote.dart';

// import 'package:easy_localization/easy_localization.dart';

// ignore: must_be_immutable
class QuoteDetailsPage extends StatefulWidget {
  @override
  State<QuoteDetailsPage> createState() => _QuoteDetailsPageState();
}

class _QuoteDetailsPageState extends State<QuoteDetailsPage> {
  DataTableQuoteDetails _dataQuote = DataTableQuoteDetails(data: []);
  DataTableQuoteDetails _list_filter = DataTableQuoteDetails(data: []);

  TextEditingController _search_quote = TextEditingController();

  @override
  void initState() {
    super.initState();
    EQCQuoteDetail().fetchQuoteDetails(quoteController.eqcQuoteId.value).then((data) {
      setState(() {
        _dataQuote = DataTableQuoteDetails(data: data);
        _list_filter = _dataQuote;
        // print('initial data history');
      });
    });
  }

  void _filterQuoteDetails() {
    setState(() {
      final filterData = _dataQuote.list_filter(_search_quote.text);
      _list_filter = DataTableQuoteDetails(data: filterData);
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
                    Row(
                      children: [
                        ElevatedButton(
          onPressed: () {
            controller.selectWidget.value = quoteList;
          },
          style: ButtonStyle(
                              backgroundColor: MaterialStatePropertyAll<Color>(grey),
                              minimumSize: MaterialStateProperty.all(Size(100, 40))
                            ),
          child: Text('Back'),
        ),
        Expanded(child: SizedBox()),
        ElevatedButton(
          onPressed: () {
            // controller.selectWidget.value = quoteList;
          },
          style: ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll<Color>(haian),
                          minimumSize: MaterialStateProperty.all(Size(100, 40))
                        ),
          child: Text('Edit'),
        ),
                      ],
                    ),
                  Center(
                    child: Text(
                      "title quote details".tr,
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
                          _filterQuoteDetails();
                        },
                      ),
                      trailing: IconButton(
                        icon: const Icon(Icons.cancel),
                        onPressed: () {
                          _search_quote.clear();
                          _filterQuoteDetails();
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
                        label: Tooltip(
                          message: 'Charge Type',
                          child: Text(
                            'Type',
                            style: style_text_Table_small_bold,
                          ),
                        ),
                      ),
                      DataColumn(
                        label: Tooltip(
                          message: 'Component',
                          child: Text('Comp.', style: style_text_Table_small_bold)),
                      ),
                      DataColumn(
                        label: Text(
                          'Category',
                          style: style_text_Table_small_bold,
                        ),
                      ),
                      DataColumn(
                        label: Tooltip(
                          message: 'Damage Code',
                          child: Text(
                            'D. Code',
                            style: style_text_Table_small_bold,
                          ),
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          'Container',
                          style: style_text_Table_small_bold,
                        ),
                      ),
                      DataColumn(
                        label: Tooltip(
                          message: 'Damage Details',
                          child: Text(
                            'D. Details',
                            style: style_text_Table_small_bold,
                          ),
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          'Quantity',
                          style: style_text_Table_small_bold,
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          'Dimension',
                          style: style_text_Table_small_bold,
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          'Length',
                          style: style_text_Table_small_bold,
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          'Width',
                          style: style_text_Table_small_bold,
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          'Location',
                          style: style_text_Table_small_bold,
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          'Labor Cost',
                          style: style_text_Table_small_bold,
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          'Mr. Cost',
                          style: style_text_Table_small_bold,
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          'Total Cost',
                          style: style_text_Table_small_bold,
                        ),
                      ),
                      DataColumn(
                        label: Tooltip(
                          message: 'Estimate Date',
                          child: Text(
                            'Est. Date',
                            style: style_text_Table_small_bold,
                          ),
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          'Payer',
                          style: style_text_Table_small_bold,
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          'Status',
                          style: style_text_Table_small_bold,
                        ),
                      ),
                      // DataColumn(
                      //   label: Text(
                      //     '',
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
