import 'dart:convert';

import 'package:web_booking/constants/global.dart';
import 'package:web_booking/constants/variable.dart';
import 'package:http/http.dart' as http;
import 'package:web_booking/page/signin/controller.dart/info_signin_controller.dart';

class ApprovalList {
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

  ApprovalList(
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

  ApprovalList.fromJson(Map<String, dynamic> json) {
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
    imageName = json['imageName'];
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

  Future<List<ApprovalList>> fetchApprovalList() async {
    try {
      var url = '$SERVER/Requests';
      final response = await http.get(Uri.parse(url), headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer ${informationController.authorize.value}",
      });
      switch (response.statusCode) {
        case 200:
          var body = response.body;
          print('Data List Request Admin');
          List dataApprovalList = json.decode(body);
          return dataApprovalList
              .map((data) => ApprovalList.fromJson(data))
              .toList();
        default:
          throw Exception(response.reasonPhrase);
      }
    } on Exception catch (e) {
      throw Exception('Error fetch Approval - $e');
    }
  }
}
