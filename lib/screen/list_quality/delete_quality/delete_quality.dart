import 'dart:convert';

import 'package:web_booking/constants/global.dart';
import 'package:web_booking/constants/variable.dart';
import 'package:http/http.dart' as http;
import 'package:web_booking/screen/home/homepage_screen.dart';

// class DeleteQuality{
Future<void> DeleteQuality(String id) async {
  final url = '$SERVER/QualityList/Delete';
  var data = {
    'id': id,
  };
  var body = json.encode(data);

  final response = await http.delete(Uri.parse(url),
      headers: {
        "Access-Control-Allow-Origin": "*",
        "Access-Control-Allow-Methods": "DELETE", //use fot http, not use https
        "Authorization": "Bearer $tokenAuthorize",
      },
      body: body);
  if (response.statusCode == 200) {
    sideBarController.index.value = 6;
  } else {
    print('Error');
    throw Exception('Error to Update');
  }
}
// }
