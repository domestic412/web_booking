import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:web_booking/constants/color.dart';
import 'package:web_booking/constants/style.dart';
import 'package:web_booking/constants/variable.dart';
import 'package:web_booking/controllers/sidebar_controller.dart';
import 'package:web_booking/model/container_stock/model_container_stock.dart';
import 'package:web_booking/screen/container_stock/data/data_container_stock.dart';

class ContainerStockPage extends StatefulWidget {
  @override
  State<ContainerStockPage> createState() => _ContainerStockPageState();
}

class _ContainerStockPageState extends State<ContainerStockPage> {
  late DataTableContainerStock _dataContainerStock =
      DataTableContainerStock(data: []);
  DataTableContainerStock _list_filter = DataTableContainerStock(data: []);

  TextEditingController _search_stock = TextEditingController();

  @override
  void initState() {
    super.initState();
    ContainerStock().fetchContainerStock().then((data) {
      setState(() {
        _dataContainerStock = DataTableContainerStock(data: data);
        _list_filter = _dataContainerStock;
        print('inital data');
      });
    });
  }

  void _filterContainerStock() {
    setState(() {
      final filterData = _dataContainerStock.list_filter(_search_stock.text);
      _list_filter = DataTableContainerStock(data: filterData);
      print('filter data stock');
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: deviceHeight(context),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: deviceWidth(context),
                  alignment: Alignment.center,
                  child: Text(
                    'title container stock'.tr,
                    style: style_title_page,
                    textAlign: TextAlign.center,
                  ),
                ),
                InkWell(
                  onTap: () {
                    // sideBarController.index.value = 12;
                    // controller.changeWidget('importStock');
                    controller.selectWidget.value = importStock;
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                    decoration: BoxDecoration(
                        color: haian, borderRadius: BorderRadius.circular(8)),
                    child: Text(
                      'Import File Excel',
                      style: style_text_box_button_small,
                    ),
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
                  margin: EdgeInsets.symmetric(vertical: 16),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: Colors.black45)),
                    child: ListTile(
                      leading: const Icon(Icons.search),
                      title: TextField(
                        controller: _search_stock,
                        decoration: const InputDecoration(
                            hintText: 'Search', border: InputBorder.none),
                        onChanged: (value) {
                          _filterContainerStock();
                        },
                      ),
                      trailing: IconButton(
                        icon: const Icon(Icons.cancel),
                        onPressed: () {
                          _search_stock.clear();
                          _filterContainerStock();
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
                              'STT',
                              style: style_text_Table_small_bold,
                            ),
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
                        label: Text('Size', style: style_text_Table_small_bold),
                      ),
                      DataColumn(
                        label: Text(
                          'Shipper',
                          style: style_text_Table_small_bold,
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          'Full Out',
                          style: style_text_Table_small_bold,
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          'Empty Out',
                          style: style_text_Table_small_bold,
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          'Full arrived',
                          style: style_text_Table_small_bold,
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          'Port/Depot',
                          style: style_text_Table_small_bold,
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          'Combinative Stuffing',
                          style: style_text_Table_small_bold,
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          'Ship Voy',
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
                          'Quality',
                          style: style_text_Table_small_bold,
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          'Check',
                          style: style_text_Table_small_bold,
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          '##',
                          style: style_text_Table_small_bold,
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
