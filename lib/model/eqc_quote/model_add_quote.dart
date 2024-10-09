import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:html' as html;

import 'package:web_booking/constants/global.dart';
import 'package:web_booking/page/menu/quote/quote_page.dart';

import 'model_input_quote_detail.dart';
import 'storage_controller/init_quote_controller.dart';

Future<void> PostNewQuote(
    {required String eqcQuoteId,
    required String portDepotId,
    required String quoteNo,
    required String quoteStatus,
    required String quoteCcy,
    required String exRate,
    required String quoteUser,
    required String edit}) async {
  try {
    Map<String, dynamic> data = {
      "eqcQuoteId": eqcQuoteId,
      "portDepotId": portDepotId,
      "quoteNo": quoteNo,
      "quoteStatus": quoteStatus,
      "quoteCcy": quoteCcy,
      "exRate": exRate,
      "quoteUser": quoteUser,
      "edit": "I",
    };
    var body = json.encode(data);
    // print(body);
    final response = await http.post(Uri.parse('$SERVER/EQCQuote/InputQuote'),
        headers: {
          "Access-Control-Allow-Origin": "*",
          "Content-Type": "application/json",
        },
        body: body);
    switch (response.statusCode) {
      case 200:
        print('Post quote success');
        PostNewQuoteDetail(
            listQuoteDetail: quoteController.listInputQuoteDetail);
      default:
        print('Error post quote: ${response.statusCode}');
    }
  } catch (e) {
    print('Error post quote : $e');
  }
}

Future<void> PostNewQuoteDetail(
    {required List<InputQuoteDetail> listQuoteDetail}) async {
  try {
    var body = json.encode(listQuoteDetail);
    // print(body);
    final response =
        await http.post(Uri.parse('$SERVER/EQCQuote/InputQuoteDetail'),
            headers: {
              "Access-Control-Allow-Origin": "*",
              "Content-Type": "application/json",
            },
            body: body);
    switch (response.statusCode) {
      case 200:
        // controller.selectWidget.value = quoteList;
        Get.to(() => QuoteListPage());
        print('Post quote detail success');
      default:
        print('Error post quote detail: ${response.statusCode}');
    }
  } catch (e) {
    print('Error post quote detail: $e');
  }
}
