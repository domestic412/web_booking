import 'dart:convert';

import 'package:web_booking/constants/global.dart';
import 'package:web_booking/constants/variable.dart';
import 'package:http/http.dart' as http;

class ListApprovalResponse {
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
  String? imageName;

  ListApprovalResponse(
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
      this.updateTime,
      this.imageName});

  factory ListApprovalResponse.fromJson(Map<String, dynamic> json) {
    return ListApprovalResponse(
      id: json['id'],
      tenYeuCau: json['tenYeuCau'],
      noiDung: json['noiDung'],
      cntrno: json['cntrno'],
      sizeType: json['sizeType'],
      nguoiGui: json['nguoiGui'],
      trangThaiYc: json['trangThaiYc'],
      noteHangTau: json['noteHangTau'],
      userXuly: json['userXuly'],
      updateTimeCheckRequest: json['updateTimeCheckRequest'],
      updateTime: json['updateTime'],
      imageName: json['imageName'],
    );
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
    data['imageName'] = this.imageName;
    return data;
  }

  Future<List<ListApprovalResponse>> fetchListApproval() async {
    var url = '$SERVER/Requests';
    final response = await http.get(Uri.parse(url), headers: {
      "Content-Type": "application/json",
      "Authorization": "Bearer $tokenAuthorize",
    });
    if (response.statusCode == 200) {
      var body = response.body;
      print('Data List Request Admin');
      List dataListApproval = json.decode(body);
      return dataListApproval
          .map((data) => ListApprovalResponse.fromJson(data))
          .toList();
    } else {
      throw Exception('Error');
    }
  }
}
