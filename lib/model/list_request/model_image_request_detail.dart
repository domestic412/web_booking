import 'dart:convert';

import 'package:get/get.dart';
import 'package:web_booking/constants/global.dart';
import 'package:http/http.dart' as http;
import 'package:web_booking/page/signin/controller_signin.dart/info_signin_controller.dart';
import 'package:web_booking/utils/getx_route.dart';

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
    try {
      var url = '$SERVER/Requests/GetDBMultiImage?id=$id';
      final response = await http.get(Uri.parse(url), headers: {
        "Access-Control-Allow-Origin": "*",
        "Access-Control-Allow-Methods": "GET", //use fot http, not use https
      });
      switch (response.statusCode) {
        case 200:
          var body = response.body;
          print('Data Image Request Detail');
          List dataDetail = jsonDecode(body);
          return dataDetail
              .map((data) => imageResponse.fromJson(data))
              .toList();
        case 401:
          Get.toNamed(GetRoutes.SignIn);
          throw Exception(response.reasonPhrase);
        default:
          throw Exception(response.reasonPhrase);
      }
    } on Exception catch (e) {
      throw Exception('Error fetch Image - $e');
    }
  }
}
