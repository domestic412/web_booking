import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:web_booking/constants/global.dart';
import 'dart:html' as html;

import 'model_input_quote_detail.dart';
import 'storage_controller/init_quote_controller.dart';

Future<void> PostNewQuote({required String eqcQuoteId,required  String portDepotId,required  String quoteNo,required  String quoteCcy,required  String exRate,required  String quoteUser,required  String edit}) async {
  try {
    Map<String, dynamic> data = {
      "eqcQuoteId": eqcQuoteId,
      "portDepotId": portDepotId,
      "quoteNo": quoteNo,
      "quoteCcy": quoteCcy,
      "exRate": exRate,
      "quoteUser": quoteUser,
      "edit": "I",
    };
  var body = json.encode(data);
  print(body);
  final response = await http.post(Uri.parse(URL_CREATE_QUOTE),
  headers: {
          "Access-Control-Allow-Origin": "*",
          "Content-Type": "application/json",
        },
        body: body);
  switch (response.statusCode) {
    case 200:
      print('Post quote success');
      PostNewQuoteDetail(listQuoteDetail: quoteController.listInputQuoteDetail);
    default:
      print('Error post quote: ${response.statusCode}');
  }
  } catch (e) {
    print('Error post quote : $e');
  }
}

Future<void> PostNewQuoteDetail({required List<InputQuoteDetail> listQuoteDetail}) async {
  try {
  var body = json.encode(listQuoteDetail);
  print(body);
  final response = await http.post(Uri.parse(URL_CREATE_QUOTE_DETAIL),
  headers: {
          "Access-Control-Allow-Origin": "*",
          "Content-Type": "application/json",
        },
        body: body);
  switch (response.statusCode) {
    case 200:
      print('Post quote detail success');
    default:
      print('Error post quote detail: ${response.statusCode}');
  }
  } catch (e) {
    print('Error post quote detail: $e');
  }
}

Future<void> PostImgQuote({required String cntr,required String date}) async {

    //PostRequest with multipartFile
      // Create a FormData object to store your files
      final formData = html.FormData();
      final url = '$SERVER/EQCQuote/UploadImage?Container=$cntr&EstimateDate=$date';
      // Assuming a list of XFile objects in _listImage
      if (quoteController.listImg != null) {
        for (int i = 0; i < quoteController.listImg!.length; i++) {
          final file = quoteController.listImg![i];
          //Convert XFile to Blob
          final blob = html.Blob([await file.readAsBytes()], file.mimeType);
          // Add the Blob to the FormData object
          formData.appendBlob('uploadfile', blob, file.name);
        }
      }
      final request = html.HttpRequest();
      request.open(
        'POST',
        url,
      );
      request.send(formData);
      request.onLoad.listen((html.ProgressEvent event) {
        if (request.status == 200) {
          print('Success send Image quote');
          // EasyLoading.dismiss();
          Get.back();
        } else {
          print('Error ${request.status} send Image quote ' + cntr);
        }
      });
  }

