import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:web_booking/constants/global.dart';
import 'package:web_booking/constants/variable.dart';

class GetCode {
  String? code;

  GetCode({this.code});

  GetCode.fromJson(Map<String, dynamic> json) {
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    return data;
  }

  Future<List<GetCode>> fetchCode() async {
    var url = ServerCode;
    final response = await http.get(Uri.parse(url), headers: {
      "Access-Control-Allow-Origin": "*",
      "Access-Control-Allow-Methods": "GET", //use fot http, not use https
      "Authorization": "Bearer $tokenAuthorize",
    });
    if (response.statusCode == 200) {
      var body = response.body;
      dataCode = json.decode(body);
      return dataCode.map((data) => GetCode.fromJson(data)).toList();
    } else {
      throw Exception('Error to fetch data Code');
    }
  }
}
