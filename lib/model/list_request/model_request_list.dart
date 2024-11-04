import 'dart:convert';

import 'package:get/get.dart';
import 'package:web_booking/constants/global.dart';
import 'package:http/http.dart' as http;
import 'package:web_booking/page/signin/controller_signin.dart/info_signin_controller.dart';
import 'package:web_booking/utils/getx_route.dart';

class RequestList {
  String? requestCheckContsId;
  String? tenYeuCau;
  String? noiDung;
  String? cntrno;
  String? sizeType;
  String? shipperId;
  String? trangThaiYc;
  String? noteHangTau;
  String? shipperNote;
  String? userId;
  String? updateTimeCheckRequest;
  String? updateTime;
  String? updateUser;
  String? checkRemark;
  String? combineStuffing;

  RequestList(
      {this.requestCheckContsId,
      this.tenYeuCau,
      this.noiDung,
      this.cntrno,
      this.sizeType,
      this.shipperId,
      this.trangThaiYc,
      this.noteHangTau,
      this.shipperNote,
      this.userId,
      this.updateTimeCheckRequest,
      this.updateTime,
      this.updateUser,
      this.checkRemark,
      this.combineStuffing});

  RequestList.fromJson(Map<String, dynamic> json) {
    requestCheckContsId = json['requestCheckContsId'];
    tenYeuCau = json['tenYeuCau'];
    noiDung = json['noiDung'];
    cntrno = json['cntrno'];
    sizeType = json['sizeType'];
    shipperId = json['shipperId'];
    trangThaiYc = json['trangThaiYc'];
    noteHangTau = json['noteHangTau'];
    shipperNote = json['shipperNote'];
    userId = json['userId'];
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
    data['shipperId'] = this.shipperId;
    data['trangThaiYc'] = this.trangThaiYc;
    data['noteHangTau'] = this.noteHangTau;
    data['shipperNote'] = this.shipperNote;
    data['userId'] = this.userId;
    data['updateTimeCheckRequest'] = this.updateTimeCheckRequest;
    data['updateTime'] = this.updateTime;
    data['updateUser'] = this.updateUser;
    data['checkRemark'] = this.checkRemark;
    data['combineStuffing'] = this.combineStuffing;
    return data;
  }

  Future<List<RequestList>> fetchRequestList() async {
    try {
      var url =
          '$SERVER/Requests/GetRequestByShipper?shipperId=${inforUserController.shipperId.value}';
      final response = await http.get(Uri.parse(url), headers: {
        "Access-Control-Allow-Origin": "*",
        // "Access-Control-Allow-Methods": "GET", //use fot http, not use https
      });
      switch (response.statusCode) {
        case 200:
          var body = response.body;
          // print(body);
          // print('Data List Request');
          List dataRequestList = json.decode(body);
          return dataRequestList
              .map((data) => RequestList.fromJson(data))
              .toList();
        case 401:
          Get.toNamed(GetRoutes.SignIn);
          throw Exception(response.reasonPhrase);
        default:
          throw Exception(response.reasonPhrase);
      }
    } on Exception catch (e) {
      return throw Exception(e);
    }
  }
}
