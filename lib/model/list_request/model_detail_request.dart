import 'dart:convert';

import 'package:get/get.dart';
import 'package:web_booking/constants/global.dart';
import 'package:http/http.dart' as http;
import 'package:web_booking/utils/getx_route.dart';

class DetailRequest {
  String? requestCheckContsId;
  String? tenYeuCau;
  String? noiDung;
  String? cntrno;
  String? sizeType;
  String? quality;
  String? shipperId;
  String? shipperName;
  String? trangThaiYc;
  String? noteHangTau;
  String? shipperNote;
  String? updateTimeCheckRequest;
  String? updateTime;
  String? updateUser;
  String? checkRemark;
  String? combineStuffing;

  DetailRequest(
      {this.requestCheckContsId,
      this.tenYeuCau,
      this.noiDung,
      this.cntrno,
      this.sizeType,
      this.quality,
      this.shipperId,
      this.shipperName,
      this.trangThaiYc,
      this.noteHangTau,
      this.shipperNote,
      this.updateTimeCheckRequest,
      this.updateTime,
      this.updateUser,
      this.checkRemark,
      this.combineStuffing});

  DetailRequest.fromJson(Map<String, dynamic> json) {
    requestCheckContsId = json['requestCheckContsId'];
    tenYeuCau = json['tenYeuCau'];
    noiDung = json['noiDung'];
    cntrno = json['cntrno'];
    sizeType = json['sizeType'];
    quality = json['quality'];
    shipperId = json['shipperId'];
    shipperName = json['shipperName'];
    trangThaiYc = json['trangThaiYc'];
    noteHangTau = json['noteHangTau'];
    shipperNote = json['shipperNote'];
    updateTimeCheckRequest = json['updateTimeCheckRequest'];
    updateTime = json['updateTime'];
    updateUser = json['updateUser'];
    checkRemark = json['checkRemark'];
    combineStuffing = json['combineStuffing'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['requestCheckContsId'] = this.requestCheckContsId;
    data['tenYeuCau'] = this.tenYeuCau;
    data['noiDung'] = this.noiDung;
    data['cntrno'] = this.cntrno;
    data['sizeType'] = this.sizeType;
    data['quality'] = this.quality;
    data['shipperId'] = this.shipperId;
    data['shipperName'] = this.shipperName;
    data['trangThaiYc'] = this.trangThaiYc;
    data['noteHangTau'] = this.noteHangTau;
    data['shipperNote'] = this.shipperNote;
    data['updateTimeCheckRequest'] = this.updateTimeCheckRequest;
    data['updateTime'] = this.updateTime;
    data['updateUser'] = this.updateUser;
    data['checkRemark'] = this.checkRemark;
    data['combineStuffing'] = this.combineStuffing;
    return data;
  }

  Future<List<DetailRequest>> fetchDetailRequest({required String id}) async {
    try {
      var url = '$SERVER/Requests/GetRequestById?Id=$id';
      final response = await http.get(Uri.parse(url), headers: {
        "Content-Type": "application/json",
      });
      switch (response.statusCode) {
        case 200:
          var body = response.body;
          print('Data List Request Detail');
          List dataDetail = jsonDecode(body);
          // try {
          //   String id = dataDetail[0]['requestCheckContsId'] ?? '';
          //   String tenYeuCau = dataDetail[0]['tenYeuCau'] ?? '';
          //   String shipperName = dataDetail[0]['shipperName'] ?? '';
          //   String shipperNote = dataDetail[0]['shipperNote'] ?? '';
          //   String noiDung = dataDetail[0]['noiDung'] ?? '';
          //   String cntrno = dataDetail[0]['cntrno'] ?? '';
          //   String sizeType = dataDetail[0]['sizeType'] ?? '';
          //   String trangThaiYc = dataDetail[0]['trangThaiYc'] ?? '';
          //   String noteHangTau = dataDetail[0]['noteHangTau'] ?? '';
          //   String updateTime = dataDetail[0]['updateTime'] ?? '';

          //   // add id request for image in request
          //   imageController.id.value = id;
          //   // add storage DetailRequest
          //   dataDetailRequestController.updateDetailRequestController(
          //       id: id.obs,
          //       tenYeuCau: tenYeuCau.obs,
          //       shipperName: shipperName.obs,
          //       shipperNote: shipperNote.obs,
          //       noiDung: noiDung.obs,
          //       cntrno: cntrno.obs,
          //       sizeType: sizeType.obs,
          //       trangThaiYc: trangThaiYc.obs,
          //       noteHangTau: noteHangTau.obs,
          //       updateTime: updateTime.obs);
          // } catch (e) {
          //   print('Error data fetch Detail Request have null - $e');
          // }
          return dataDetail
              .map((data) => DetailRequest.fromJson(data))
              .toList();
        case 401:
          Get.toNamed(GetRoutes.SignIn);
          throw Exception(response.reasonPhrase);
        default:
          throw Exception(response.reasonPhrase);
      }
    } on Exception catch (e) {
      throw Exception('Error fetch Detail Request - $e');
    }
  }
}
