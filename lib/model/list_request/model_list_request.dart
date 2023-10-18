import 'dart:convert';

import 'package:web_booking/constants/global.dart';
import 'package:web_booking/constants/variable.dart';
import 'package:http/http.dart' as http;

List<ListRequestResponse> postFromJson(String str) =>
    List<ListRequestResponse>.from(json.decode(str).map((x) => ListRequestResponse.fromJson(x)));

class ListRequestResponse {
  int? id;
  String? tenYeuCau;
  String? noiDung;
  String? cntrno;
  String? sizeType;
  String? nguoiGui;
  String? trangThaiYc;
  String? updateTime;

  ListRequestResponse(
      {
      this.id,
      this.tenYeuCau,
      this.noiDung,
      this.cntrno,
      this.sizeType,
      this.nguoiGui,
      this.trangThaiYc,
      this.updateTime});

  factory ListRequestResponse.fromJson(Map<String, dynamic> json) {
    return ListRequestResponse(
      id : json['id'],
      tenYeuCau : json['tenYeuCau'],
      noiDung : json['noiDung'],
      cntrno : json['cntrno'],
      sizeType : json['sizeType'],
      nguoiGui : json['nguoiGui'],
      trangThaiYc : json['trangThaiYc'],
      updateTime : json['updateTime'],);
  }

  Future<List<ListRequestResponse>> fetchListRequest() async {
  var url = '$SERVER/Requests/GetRequestByUser?user=$tokenLogin';
  // EasyLoading.show(
  //     status: 'Loading...',
  //     maskType: EasyLoadingMaskType.black,
  //     dismissOnTap: true,
  //     );
  // try {
  //   final response = await http.get(Uri.parse(url),headers:{
  //   "Access-Control-Allow-Origin": "*",
  //   "Access-Control-Allow-Methods": "GET", //use fot http, not use https
  //   });
  // } catch (e) {print(e);}
  final response = await http.get(Uri.parse(url),headers:{
    "Access-Control-Allow-Origin": "*",
    "Access-Control-Allow-Methods": "GET", //use fot http, not use https
    });
  if (response.statusCode == 200) {
    // EasyLoading.dismiss();
    var body = response.body;
    print('Data List Request');
  List dataListRequest = json.decode(body);
  return dataListRequest.map((data) => ListRequestResponse.fromJson(data)).toList();
  }
    else {
      // EasyLoading.dismiss();
      throw Exception('Error');
    }
  }
}
