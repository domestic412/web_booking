import 'dart:convert';

import 'package:get/get.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:web_booking/constants/global.dart';
import 'package:http/http.dart' as http;
import 'package:web_booking/utils/getx_route.dart';

class ApprovalList {
  String? requestCheckContsId;
  String? tenYeuCau;
  String? noiDung;
  String? cntrno;
  String? sizeType;
  String? shipperId;
  String? shipperName;
  String? trangThaiYc;
  String? noteHangTau;
  String? shipperNote;
  String? userId;
  String? updateTimeCheckRequest;
  String? updateTime;
  String? updateUser;
  String? checkRemark;
  String? combineStuffing;

  ApprovalList(
      {this.requestCheckContsId,
      this.tenYeuCau,
      this.noiDung,
      this.cntrno,
      this.sizeType,
      this.shipperId,
      this.shipperName,
      this.trangThaiYc,
      this.noteHangTau,
      this.shipperNote,
      this.userId,
      this.updateTimeCheckRequest,
      this.updateTime,
      this.updateUser,
      this.checkRemark,
      this.combineStuffing});

  ApprovalList.fromJson(Map<String, dynamic> json) {
    requestCheckContsId = json['requestCheckContsId'];
    tenYeuCau = json['tenYeuCau'];
    noiDung = json['noiDung'];
    cntrno = json['cntrno'];
    sizeType = json['sizeType'];
    shipperId = json['shipperId'];
    shipperName = json['shipperName'];
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
    data['shipperName'] = this.shipperName;
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

  DataGridRow getDataGridRow_Approval() {
    return DataGridRow(cells: [
      DataGridCell<String>(
          columnName: 'requestCheckContsId', value: requestCheckContsId),
      DataGridCell<String>(columnName: 'cntrno'.tr, value: cntrno),
      DataGridCell<String>(columnName: 'sender'.tr, value: shipperName),
      DataGridCell<String>(
          columnName: 'approve request'.tr, value: trangThaiYc),
      DataGridCell<String>(columnName: 'update user'.tr, value: updateUser),
      DataGridCell<String>(columnName: 'updateTime'.tr, value: updateTime),
    ]);
  }

  Future<List<ApprovalList>> fetchApprovalList() async {
    try {
      var url = '$SERVER/Requests';
      final response = await http.get(Uri.parse(url), headers: {
        "Content-Type": "application/json",
      });
      switch (response.statusCode) {
        case 200:
          var body = response.body;
          List dataApprovalList = json.decode(body);
          print('Data List Approval');
          return dataApprovalList
              .map((data) => ApprovalList.fromJson(data))
              .toList();
        case 401:
          Get.toNamed(GetRoutes.SignIn);
          throw Exception(response.reasonPhrase);
        default:
          throw Exception(response.reasonPhrase);
      }
    } on Exception catch (e) {
      throw Exception('Error fetch Approval - $e');
    }
  }
}
