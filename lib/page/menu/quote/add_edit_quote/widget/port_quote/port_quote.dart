import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'widget/import_button.dart';
import 'widget/widget_currency.dart';
import 'widget/widget_exRate.dart';
import 'widget/widget_quoteNo.dart';

class PortQuote extends StatefulWidget {
  const PortQuote({super.key});

  @override
  State<PortQuote> createState() => _PortQuoteState();
}

class _PortQuoteState extends State<PortQuote> {
  // CurrencyQuotes? selectCurrency;
  // int j = 0;

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          WidgetQuoteNo(),
          WidgetCurrency(),
          WidgetExRate(),
          ImportButton()
        ],
      ),
    );
  }
}

// class User {
//   final String name;
//   final int id;

//   User({required this.name, required this.id});

//   @override
//   String toString() {
//     return 'User(name: $name, id: $id)';
//   }
// }
