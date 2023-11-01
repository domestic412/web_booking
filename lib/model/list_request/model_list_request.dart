import 'dart:convert';
import 'dart:io';

import 'package:web_booking/constants/global.dart';
import 'package:http/http.dart' as http;
import 'package:web_booking/constants/variable.dart';
import 'package:web_booking/screen/secure_storage/storage.dart';

// List<ListRequestResponse> postFromJson(String str) =>
//     List<ListRequestResponse>.from(json.decode(str).map((x) => ListRequestResponse.fromJson(x)));

class ListRequestResponse {
  int? id;
  String? tenYeuCau;
  String? noiDung;
  String? cntrno;
  String? sizeType;
  String? nguoiGui;
  String? trangThaiYc;
  String? noteHangTau;
  String? userXuly;
  String? updateTimeCheckRequest;
  String? updateTime;

  ListRequestResponse(
      {this.id,
      this.tenYeuCau,
      this.noiDung,
      this.cntrno,
      this.sizeType,
      this.nguoiGui,
      this.trangThaiYc,
      this.noteHangTau,
      this.userXuly,
      this.updateTimeCheckRequest,
      this.updateTime});

  ListRequestResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    tenYeuCau = json['tenYeuCau'];
    noiDung = json['noiDung'];
    cntrno = json['cntrno'];
    sizeType = json['sizeType'];
    nguoiGui = json['nguoiGui'];
    trangThaiYc = json['trangThaiYc'];
    noteHangTau = json['noteHangTau'];
    userXuly = json['userXuly'];
    updateTimeCheckRequest = json['updateTimeCheckRequest'];
    updateTime = json['updateTime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['tenYeuCau'] = this.tenYeuCau;
    data['noiDung'] = this.noiDung;
    data['cntrno'] = this.cntrno;
    data['sizeType'] = this.sizeType;
    data['nguoiGui'] = this.nguoiGui;
    data['trangThaiYc'] = this.trangThaiYc;
    data['noteHangTau'] = this.noteHangTau;
    data['userXuly'] = this.userXuly;
    data['updateTimeCheckRequest'] = this.updateTimeCheckRequest;
    data['updateTime'] = this.updateTime;
    return data;
  }

  Future<List<ListRequestResponse>> fetchListRequest() async {
    // String _token = await SecureStorage().readData('tokenLogin');
    // print(_token);

    // var url = '$SERVER/Requests/GetRequestByUser?user=$tokenLogin';
    var url = '$SERVER/Requests/GetRequestByUser?user=$tokenLogin';
    final response = await http.get(Uri.parse(url), headers: {
      "Access-Control-Allow-Origin": "*",
      "Access-Control-Allow-Methods": "GET", //use fot http, not use https
      "Authorization": "Bearer $tokenAuthorize",
    });
    print(tokenAuthorize);
    if (response.statusCode == 200) {
      var body = response.body;
      print('Data List Request');
      List dataListRequest = json.decode(body);
      return dataListRequest
          .map((data) => ListRequestResponse.fromJson(data))
          .toList();
    } else {
      throw Exception('Error');
    }
  }
}
