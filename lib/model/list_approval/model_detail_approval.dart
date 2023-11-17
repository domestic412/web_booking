import 'dart:convert';

import 'package:web_booking/constants/global.dart';
import 'package:http/http.dart' as http;
import 'package:web_booking/constants/variable.dart';

class DetailApproval {
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

  DetailApproval(
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

  DetailApproval.fromJson(Map<String, dynamic> json) {
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

  Future<List<DetailApproval>> fetchDetailApproval(int id) async {
    var url = '$SERVER/Requests/$id';
    final response = await http.get(Uri.parse(url), headers: {
      "Content-Type": "application/json",
      "Authorization": "Bearer $tokenAuthorize",
    });
    if (response.statusCode == 200) {
      var body = response.body;
      print('Data list approval Detail');
      List dataDetail = jsonDecode(body);
      try {
        id_DetailApproval = dataDetail[0]['id'];
        tenYeuCau_DetailApproval = dataDetail[0]['tenYeuCau'];
        noiDung_DetailApproval = dataDetail[0]['noiDung'];
        cntrno_DetailApproval = dataDetail[0]['cntrno'];
        sizeType_DetailApproval = dataDetail[0]['sizeType'];
        trangThaiYc_DetailApproval = dataDetail[0]['trangThaiYc'];
        noteHangTau_DetailApproval = dataDetail[0]['noteHangTau'];
        updateTime_DetailApproval = dataDetail[0]['updateTime'];
      } catch (e) {
        print(e);
      }
      return dataDetail.map((data) => DetailApproval.fromJson(data)).toList();
    } else {
      throw Exception('Error');
    }
  }
}
