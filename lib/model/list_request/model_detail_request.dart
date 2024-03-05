import 'dart:convert';

import 'package:get/get.dart';
import 'package:web_booking/constants/global.dart';
import 'package:http/http.dart' as http;
import 'package:web_booking/constants/variable.dart';
import 'package:web_booking/model/list_request/storage_controller/detail_request_controller.dart';
import 'package:web_booking/page/signin/controller_signin.dart/info_signin_controller.dart';
import 'package:web_booking/storage_controller.dart/controller_image.dart';
import 'package:web_booking/utils/getx_route.dart';

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
    try {
      var url = '$SERVER/Requests/$id';
      final response = await http.get(Uri.parse(url), headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer ${informationController.authorize.value}",
      });
      switch (response.statusCode) {
        case 200:
          var body = response.body;
          print('Data List Request Detail');
          List dataDetail = jsonDecode(body);
          try {
            int id = dataDetail[0]['id'] ?? 0;
            String tenYeuCau = dataDetail[0]['tenYeuCau'] ?? '';
            String noiDung = dataDetail[0]['noiDung'] ?? '';
            String cntrno = dataDetail[0]['cntrno'] ?? '';
            String sizeType = dataDetail[0]['sizeType'] ?? '';
            String trangThaiYc = dataDetail[0]['trangThaiYc'] ?? '';
            String noteHangTau = dataDetail[0]['noteHangTau'] ?? '';
            String updateTime = dataDetail[0]['updateTime'] ?? '';

            // add id request for image in request
            imageController.updateIdImageController(id: id.obs);
            // add storage DetailRequest
            dataDetailRequestController.updateDetailRequestController(
                id: id.obs,
                tenYeuCau: tenYeuCau.obs,
                noiDung: noiDung.obs,
                cntrno: cntrno.obs,
                sizeType: sizeType.obs,
                trangThaiYc: trangThaiYc.obs,
                noteHangTau: noteHangTau.obs,
                updateTime: updateTime.obs);
          } catch (e) {
            print('Error data fetch Detail Request have null - $e');
          }
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
