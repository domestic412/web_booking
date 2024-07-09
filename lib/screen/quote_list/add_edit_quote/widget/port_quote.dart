import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:web_booking/constants/color.dart';
import 'package:web_booking/model/eqc_quote/model_init_quote.dart';
import 'package:web_booking/model/eqc_quote/storage_controller/init_quote_controller.dart';

class PortQuote extends StatefulWidget {
  const PortQuote({super.key});

  @override
  State<PortQuote> createState() => _PortQuoteState();
}

class _PortQuoteState extends State<PortQuote> {
  PortQuotes? selectPort;
  CurrencyQuotes? selectCurrency;

  @override
  Widget build(BuildContext context) {
    return buildPortQuote();
  }

  FutureBuilder<InitEQCQuote> buildPortQuote() {
    return FutureBuilder<InitEQCQuote>(
        future: InitEQCQuote().fetchInitQuote(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasData) {
            List listports = snapshot.data!.portQuotes!;
            final List<DropdownMenuEntry<PortQuotes>> portEntries =
                <DropdownMenuEntry<PortQuotes>>[];
            for (final port in listports) {
              portEntries.add(
                DropdownMenuEntry<PortQuotes>(
                  value: port,
                  label: port.code,
                ),
              );
            }
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
                      DropdownMenu<PortQuotes>(
                        width: 150,
                        menuHeight: 500,
                        // controller: quoteController.port_select.value,
                        enableFilter: true,
                        enableSearch: true,
                        // label: Text('Port/Dep'.tr),
                        dropdownMenuEntries: portEntries,
                        onSelected: (PortQuotes? port) {
                          // setState(() {
                          selectPort = port;
                          quoteController.portDepotId.value =
                              selectPort?.portDepotId ?? '';
                          // });
                        },
                      ),
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
                ElevatedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll<Color>(haian),
                      minimumSize: MaterialStateProperty.all(Size(100, 50))),
                  child: Text('Import'),
                ),
              ],
            );
          }
          return Text('Error');
        });
  }
}
