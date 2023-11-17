import 'dart:convert';

import 'package:web_booking/constants/global.dart';
import 'package:http/http.dart' as http;
import 'package:web_booking/constants/variable.dart';

class DetailRequest {
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
  String? updateUser;

  DetailRequest(
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
      this.updateUser});

  DetailRequest.fromJson(Map<String, dynamic> json) {
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
    updateUser = json['updateUser'];
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
    data['updateUser'] = this.updateUser;
    return data;
  }

  Future<void> fetchDetailRequest(int id) async {
    var url = '$SERVER/Requests/$id';

    final response = await http.get(Uri.parse(url), headers: {
      "Content-Type": "application/json",
      "Authorization": "Bearer $tokenAuthorize",
    });
    if (response.statusCode == 200) {
      // EasyLoading.dismiss();
      var body = response.body;
      print('Data List Request Detail');
      List dataDetail = jsonDecode(body);
      id_request_for_image = dataDetail[0]['id'];
      tenYeuCau_DetailRequest = dataDetail[0]['tenYeuCau'];
      noiDung_DetailRequest = dataDetail[0]['noiDung'];
      cntrno_DetailRequest = dataDetail[0]['cntrno'];
      sizeType_DetailRequest = dataDetail[0]['sizeType'];
      trangThaiYc_DetailRequest = dataDetail[0]['trangThaiYc'];
      noteHangTau_DetailRequest = dataDetail[0]['noteHangTau'];
      updateTime_DetailRequest = dataDetail[0]['updateTime'];
      // PopUpListRequest(context);
    } else {
      // EasyLoading.dismiss();
      throw Exception('Cannot connect to server');
    }
  }
}
