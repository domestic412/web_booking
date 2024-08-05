import 'package:excel/excel.dart';
import 'package:flutter/material.dart';
import 'package:web_booking/constants/color.dart';
import 'package:web_booking/model/eqc_quote/model_init_quote.dart';
import 'package:web_booking/model/eqc_quote/model_input_quote_detail.dart';
import 'package:web_booking/model/eqc_quote/storage_controller/init_quote_controller.dart';
import 'package:web_booking/screen/checking_combine/import_excel/import_excel.dart';

class PortQuote extends StatefulWidget {
  const PortQuote({super.key});

  @override
  State<PortQuote> createState() => _PortQuoteState();
}

class _PortQuoteState extends State<PortQuote> {
  // PortQuotes? selectPort;
  CurrencyQuotes? selectCurrency;
  int j = 0;
  // String _list_input = '';
  


  @override
  Widget build(BuildContext context) {
    return buildPortQuote();
  }

  FutureBuilder<InitEQCQuote> buildPortQuote() {
    return FutureBuilder<InitEQCQuote>(
        future: quoteController.initEQC,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasData) {
            // List listports = snapshot.data!.portQuotes!;
            // final List<DropdownMenuEntry<PortQuotes>> portEntries =
            //     <DropdownMenuEntry<PortQuotes>>[];
            // for (final port in listports) {
            //   portEntries.add(
            //     DropdownMenuEntry<PortQuotes>(
            //       value: port,
            //       label: port.code,
            //     ),
            //   );
            // }
            List listcurrency = snapshot.data!.currencyQuotes!;
            final List<DropdownMenuEntry<CurrencyQuotes>> currencyEntries =
                <DropdownMenuEntry<CurrencyQuotes>>[];
            for (final currency in listcurrency) {
              currencyEntries.add(
                DropdownMenuEntry<CurrencyQuotes>(
                  value: currency,
                  label: currency.currency,
                ),
              );
            }
            return Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  // margin: EdgeInsets.only(right: 50),
                  child: Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(right: 10),
                        child: Text('Port/Dep'),
                      ),
                      // DropdownMenu<PortQuotes>(
                      //   width: 150,
                      //   menuHeight: 500,
                      //   // controller: quoteController.port_select.value,
                      //   enableFilter: true,
                      //   enableSearch: true,
                      //   // label: Text('Port/Dep'.tr),
                      //   dropdownMenuEntries: portEntries,
                      //   onSelected: (PortQuotes? port) {
                      //     // setState(() {
                      //     selectPort = port;
                      //     quoteController.portDepotId.value =
                      //         selectPort?.portDepotId ?? '';
                      //     // });
                      //   },
                      // ),
                      Container(
                        width: 150,
                        padding: EdgeInsets.symmetric(vertical: 13, horizontal: 13),
                        decoration: BoxDecoration(
                          color: Colors.black12,
                          // border: Border.all(
                          //   width: 0.5,
                          //   color: Colors.black87
                          // ),
                          borderRadius: BorderRadius.circular(5)
                        ),
                        child: Text('VNVIC', style: TextStyle(color: Colors.black54),)
                      )
                    ],
                  ),
                ),
                Expanded(
                  // margin: EdgeInsets.only(right: 50),
                  child: Row(
                    children: [
                      Container(
                          margin: EdgeInsets.only(right: 10),
                          child: Text('Quote No.')),
                      Container(
                        width: 150,
                        child: TextField(
                          controller: quoteController.quoteNo.value,
                          decoration: InputDecoration(
                            isDense: true, border: OutlineInputBorder()),
                        ),
                      )
                    ],
                  ),
                ),
                Expanded(
                  // margin: EdgeInsets.only(right: 50),
                  child: Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(right: 10),
                        child: Text('Currency'),
                      ),
                      DropdownMenu<CurrencyQuotes>(
                        width: 150,
                        menuHeight: 500,
                        // controller: quoteController.currency_select.value,
                        enableFilter: true,
                        enableSearch: true,
                        // label: Text('Currency'.tr),
                        dropdownMenuEntries: currencyEntries,
                        onSelected: (CurrencyQuotes? currency) {
                          selectCurrency = currency;
                          quoteController.currency.value =
                              selectCurrency?.currency ?? '';
                        },
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: Row(children: [
                    Container(
                      margin: EdgeInsets.only(right: 10),
                      child: Text('Ex. Rate'),
                    ),
                    Container(
                      width: 60,
                      margin: EdgeInsets.only(right: 100),
                      child: TextField(
                        controller: quoteController.exRate.value,
                        decoration: InputDecoration(
                            isDense: true, border: OutlineInputBorder()),
                      ),
                    )
                  ]),
                ),
                ImportButton()
              ],
            );
          }
          return Text('Error');
        });
  }
}

class ImportButton extends StatelessWidget {
  const ImportButton({super.key});

  @override
  Widget build(BuildContext context) {
    int j = 0;

    String? chargeName;
    String? componentName;
    String? categoryName;
    String? errorName;
    String? container;
    String? inGateDate;
    String? damageDetail;
    int? quantity;
    String? dimension;
    int? length;
    int? width;
    String? location;
    int? laborCost;
    int? mrCost;
    int? totalCost;
    String? approveCode;
    int? payer;
    return ElevatedButton(
                  onPressed: () async {
                    await Import().ImportExcel();
                    if (resultPickedFile != null) {
                                  var bytes =
                                      resultPickedFile?.files.single.bytes;
                                  var excel = Excel.decodeBytes(bytes!);
                                  // choose sheet1 in file excel
                                  String table = 'Upload BRV';
                                  for (var row in excel.tables[table]!.rows) {
                                    print(row);
                                      int i = 0;
                                      for (var cell in row) {
                                        if (j>0) {
                                          // print(i);
                                          var value = cell?.value ?? '0';
                                          // print(i);
                                          // print(value);
                                          switch (i) {
                                              case 0:
                                                chargeName = value.toString();
                                                print(chargeName);
                                              case 1:
                                                container = value.toString();
                                                print(container);
                                              case 2:
                                                inGateDate = value.toString();
                                                print(inGateDate);
                                              case 3:
                                                componentName = value.toString();
                                                print(componentName);
                                              case 4:
                                                damageDetail = value.toString();
                                                print(damageDetail);
                                              case 5:
                                                errorName = value.toString();
                                                print(errorName);
                                              case 6:
                                                quantity = int.parse(value.toString());
                                                print(quantity);
                                              case 7:
                                                dimension = value.toString();
                                                print(dimension);
                                              case 8:
                                                length = int.parse(value.toString());
                                                print(length);
                                              case 9:
                                                width = int.parse(value.toString());
                                                print(width);
                                              case 10:
                                                location = value.toString();
                                                print(location);
                                              case 11:
                                                categoryName = value.toString();
                                                print(categoryName);
                                              case 12:
                                                laborCost = int.parse(value.toString());
                                                print(laborCost);
                                              case 13:
                                                mrCost = int.parse(value.toString());
                                                print(mrCost);
                                              case 14:
                                                totalCost = int.parse(value.toString());
                                                print(totalCost);
                                              case 15:
                                                approveCode = value.toString();
                                                print(approveCode);
                                              case 16:
                                                payer = int.parse(value.toString());
                                                print(payer);
                                          }
                                          i = i + 1;
                                        } else {}
                                      }
                                      if (chargeName == null && 
                                      container == null && 
                                      inGateDate == null && 
                                      componentName == null && 
                                      damageDetail == null && 
                                      errorName == null && 
                                      quantity == null && 
                                      dimension == null && 
                                      length == null && 
                                      width == null && 
                                      location == null && 
                                      categoryName == null && 
                                      laborCost == null && 
                                      mrCost == null && 
                                      totalCost == null) 
                                      {} else {
                                        InputQuoteDetail _listInputQuoteDetail_show = InputQuoteDetail(
                                        chargeTypeId: chargeName,
                                        componentId: componentName,
                                        categoryId: categoryName,
                                        errorId: errorName,
                                        container: container,
                                        inGateDate: inGateDate,
                                        damageDetail: damageDetail,
                                        quantity: quantity,
                                        dimension: dimension,
                                        length: length,
                                        width: width,
                                        location: location,
                                        laborCost: laborCost,
                                        mrCost: mrCost,
                                        totalCost: totalCost,
                                      );
                                      quoteController.listInputQuoteDetail_show.add(_listInputQuoteDetail_show);
                                      print(quoteController.listInputQuoteDetail_show);
                                      }
                                      j = ++j;
                                    }
                                  } else {
                                    print('no data');
                                  }
                  },
                  style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll<Color>(haian),
                      minimumSize: MaterialStateProperty.all(Size(100, 50))),
                  child: Text('Import'),
                );
  }
}