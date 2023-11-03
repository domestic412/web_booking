import 'dart:convert';

import 'package:web_booking/constants/global.dart';
import 'package:web_booking/constants/variable.dart';
import 'package:http/http.dart' as http;

List<imageResponse> postFromJson(String str) => List<imageResponse>.from(
    json.decode(str).map((x) => imageResponse.fromJson(x)));

class imageResponse {
  int? id;
  int? requestId;
  String? data;
  int? size;
  String? requestImage;
  Null request;

  imageResponse(
      {this.id,
      this.requestId,
      this.data,
      this.size,
      this.requestImage,
      this.request});

  imageResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    requestId = json['requestId'];
    data = json['data'];
    size = json['size'];
    requestImage = json['requestImage'];
    request = json['request'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['requestId'] = this.requestId;
    data['data'] = this.data;
    data['size'] = this.size;
    data['requestImage'] = this.requestImage;
    data['request'] = this.request;
    return data;
  }

  Future<List<imageResponse>> fetchImage(int id) async {
    var url = '$SERVER/Requests/GetDBMultiImage?id=$id';
    final response = await http.get(Uri.parse(url), headers: {
      "Access-Control-Allow-Origin": "*",
      "Access-Control-Allow-Methods": "GET", //use fot http, not use https
      "Authorization": "Bearer $tokenAuthorize",
    });
    if (response.statusCode == 200) {
      // EasyLoading.dismiss();
      var body = response.body;
      print('Data Image Request Detail');
      List dataDetail = jsonDecode(body);
      return dataDetail.map((data) => imageResponse.fromJson(data)).toList();
    } else {
      // EasyLoading.dismiss();
      throw Exception('Cannot connect to Server or no have Image');
    }
  }
}
